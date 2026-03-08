open Asm

(* asm.mli does not expose zero regs *)
let reg_zero = ("%i0", Id.Known(Id.Register, Id.None))
let reg_fzero = ("%f0", Id.Known(Id.Register, Id.None))

let check_imm i = -2048 <= i && i < 2048
let is_pos_zero_float f = Int64.bits_of_float f = 0L

let starts_with s p =
  let lp = String.length p in
  String.length s >= lp && String.sub s 0 lp = p

let is_fixed_reg x =
  let s = Id.to_string x in
  (starts_with s "%i" || starts_with s "%f")
  && not (starts_with s "%vi" || starts_with s "%vf")

let trackable x = not (is_fixed_reg x)

type env = {
  mut_env : S.t;
  zero_env : S.t;
  fzero_env : S.t;
  const_env : int M.t;
}

let empty_env mut_env =
  { mut_env; zero_env = S.empty; fzero_env = S.empty; const_env = M.empty }

let kill_env x env =
  {
    env with
    zero_env = S.remove x env.zero_env;
    fzero_env = S.remove x env.fzero_env;
    const_env = M.remove x env.const_env;
  }

let add_const_env x i env =
  if (not (trackable x)) || S.mem x env.mut_env then kill_env x env
  else
    {
      env with
      zero_env = if i = 0 then S.add x env.zero_env else S.remove x env.zero_env;
      fzero_env = S.remove x env.fzero_env;
      const_env = M.add x i env.const_env;
    }

let add_fzero_env x env =
  if (not (trackable x)) || S.mem x env.mut_env then kill_env x env
  else
    {
      env with
      zero_env = S.remove x env.zero_env;
      fzero_env = S.add x env.fzero_env;
      const_env = M.remove x env.const_env;
    }

let find_const env x =
  try Some(M.find x env.const_env) with Not_found -> None

let is_zero env x = S.mem x env.zero_env
let is_fzero env x = S.mem x env.fzero_env

let replace_int_id env x =
  if is_zero env x then reg_zero else x

let replace_float_id env x =
  if is_fzero env x then reg_fzero else x

let replace_id_or_imm env = function
  | C(i) -> C(i)
  | V(y) ->
      (match find_const env y with
      | Some(i) when check_imm i -> C(i)
      | _ when is_zero env y -> C(0)
      | _ -> V(y))

let use_id x = S.singleton x
let use_id_or_imm = function C(_) -> S.empty | V(x) -> S.singleton x

let use_union a b = S.union a b

let rec collect_mutable = function
  | Ans(exp) -> collect_mutable_exp exp
  | Let((_, _), exp, e) ->
      use_union (collect_mutable_exp exp) (collect_mutable e)
and collect_mutable_exp = function
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2)
  | IfFEq(_, _, e1, e2) | IfFLE(_, _, e1, e2) ->
      use_union (collect_mutable e1) (collect_mutable e2)
  | Loop(_, _, e) ->
      collect_mutable e
  | Assign(x, _) ->
      S.singleton x
  | _ ->
      S.empty

let update_env_for_binding env x exp =
  let env = kill_env x env in
  if (not (trackable x)) || S.mem x env.mut_env then env
  else
    match exp with
    | SetInt(i) -> add_const_env x i env
    | SetFloat(f) when is_pos_zero_float f -> add_fzero_env x env
    | _ -> env

let rec g env = function
  | Ans(exp) ->
      let exp', used = g_exp env exp in
      (Ans(exp'), used)
  | Let((x, t), exp, e) ->
      let exp', used_exp = g_exp env exp in
      let env2 = update_env_for_binding env x exp in
      let e', used_e = g env2 e in
      let used_out = use_union used_exp (S.remove x used_e) in
      let keep =
        if (not (trackable x)) || S.mem x env.mut_env then true
        else
          match exp with
          | SetInt(0) -> true
            (* 旧: false (無条件削除)
               修正理由: TernPhiInsert が if 枝内で SetInt(0) の phi 変数を生成するが、
               Tern 命令が if 外でその変数を参照する。keep=false だと Let 束縛が
               消去され zero_env のスコープ外で変数が未定義になり allocVirtual がクラッシュする。
               keep=true にしても zero_env による同スコープ内の reg_zero 置換は引き続き有効。 *)
          | SetFloat(f) when is_pos_zero_float f -> true
            (* 同上: SetFloat(+0.0) も同じ構造で問題が発生しうる *)
          | SetInt(_) ->
            (* phi 変数 (_phi. を含む) は if 枝内で定義され TernPhi が if 外で参照する。
               used_e のスコープが枝内に限られるため枝外の参照を検出できない。
               phi 変数は always keep、その他は通常の used チェック。 *)
            let sx = Id.to_string x in
            (* let has_phi =
              let len = String.length sx in
              let rec check i =
                if i + 5 > len then false
                else if String.sub sx i 5 = "_phi." then true
                else check (i + 1)
              in check 0
            in *)
            if Id.is_leakable x then true else S.mem x used_e
          | _ -> true
      in
      if keep then (Let((x, t), exp', e'), used_out)
      else (e', used_out)

and g_exp env = function
  | Nop -> (Nop, S.empty)
  | SetInt(i) ->
      if i = 0 then (Mov(reg_zero), use_id reg_zero)
      else (SetInt(i), S.empty)
  | SetFloat(f) ->
      if is_pos_zero_float f then (FMov(reg_fzero), use_id reg_fzero)
      else (SetFloat(f), S.empty)
  | SetLabel(l) -> (SetLabel(l), S.empty)
  | Mov(x) ->
      let x' = replace_int_id env x in
      (Mov(x'), use_id x')
  | Neg(x) ->
      let x' = replace_int_id env x in
      (Neg(x'), use_id x')
  | Add(x, y') ->
      let x' = replace_int_id env x in
      (match replace_id_or_imm env y' with
      | C(_) as y'' ->
          (Add(x', y''), use_union (use_id x') (use_id_or_imm y''))
      | V(y) as y'' ->
          (match find_const env x with
          | Some(i) when check_imm i ->
              let y0 = replace_int_id env y in
              (Add(y0, C(i)), use_union (use_id y0) (use_id_or_imm (C(i))))
          | _ ->
              (Add(x', y''), use_union (use_id x') (use_id_or_imm y''))))
  | Sub(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (Sub(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | Sll(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (Sll(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | Sra(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (Sra(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | Ld(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (Ld(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | LdF(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (LdF(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | St(x, y, z') ->
      let x' = replace_int_id env x in
      let y' = replace_int_id env y in
      let z'' = replace_id_or_imm env z' in
      (St(x', y', z''), use_union (use_id x') (use_union (use_id y') (use_id_or_imm z'')))
  | StF(x, y, z') ->
      let x' = replace_float_id env x in
      let y' = replace_int_id env y in
      let z'' = replace_id_or_imm env z' in
      (StF(x', y', z''), use_union (use_id x') (use_union (use_id y') (use_id_or_imm z'')))
  | FMov(x) ->
      let x' = replace_float_id env x in
      (FMov(x'), use_id x')
  | Mif(x) ->
      let x' = replace_int_id env x in
      (Mif(x'), use_id x')
  | FNeg(x) ->
      let x' = replace_float_id env x in
      (FNeg(x'), use_id x')
  | FAdd(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (FAdd(x', y'), use_union (use_id x') (use_id y'))
  | FSub(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (FSub(x', y'), use_union (use_id x') (use_id y'))
  | FMul(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (FMul(x', y'), use_union (use_id x') (use_id y'))
  | FDiv(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (FDiv(x', y'), use_union (use_id x') (use_id y'))
  | FInv(x) ->
      let x' = replace_float_id env x in
      (FInv(x'), use_id x')
  | CmpEq(x, y') ->
      let x' = replace_int_id env x in
      (match replace_id_or_imm env y' with
      | C(_) as y'' ->
          (CmpEq(x', y''), use_union (use_id x') (use_id_or_imm y''))
      | V(y) as y'' ->
          (match find_const env x with
          | Some(i) when check_imm i ->
              let y0 = replace_int_id env y in
              (CmpEq(y0, C(i)), use_union (use_id y0) (use_id_or_imm (C(i))))
          | _ ->
              (CmpEq(x', y''), use_union (use_id x') (use_id_or_imm y''))))
  | CmpLE(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (CmpLE(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | CmpLT(x, y') ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      (CmpLT(x', y''), use_union (use_id x') (use_id_or_imm y''))
  | CmpFEq(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (CmpFEq(x', y'), use_union (use_id x') (use_id y'))
  | CmpFLE(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (CmpFLE(x', y'), use_union (use_id x') (use_id y'))
  | CmpFLT(x, y) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (CmpFLT(x', y'), use_union (use_id x') (use_id y'))
  | Tern(c, x, y) ->
      let c' = replace_int_id env c in
      let x' = replace_int_id env x in
      let y' = replace_int_id env y in
      (Tern(c', x', y'), use_union (use_id c') (use_union (use_id x') (use_id y')))
  | TernF(c, x, y) ->
      let c' = replace_float_id env c in
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      (TernF(c', x', y'), use_union (use_id c') (use_union (use_id x') (use_id y')))
  | IfEq(x, y', e1, e2) ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      let e1', used1 = g env e1 in
      let e2', used2 = g env e2 in
      (match y'' with
      | C(i) ->
          (IfEq(x', C(i), e1', e2'),
           use_union (use_union (use_id x') (use_id_or_imm (C(i)))) (use_union used1 used2))
      | V(y) as yv ->
          (match find_const env x with
          | Some(i) when check_imm i ->
              let y0 = replace_int_id env y in
              (IfEq(y0, C(i), e1', e2'),
               use_union (use_union (use_id y0) (use_id_or_imm (C(i)))) (use_union used1 used2))
          | _ ->
              (IfEq(x', yv, e1', e2'),
               use_union (use_union (use_id x') (use_id_or_imm yv)) (use_union used1 used2))))
  | IfLE(x, y', e1, e2) ->
      let x' = replace_int_id env x in
      let y'' = replace_id_or_imm env y' in
      let e1', used1 = g env e1 in
      let e2', used2 = g env e2 in
      (IfLE(x', y'', e1', e2'),
       use_union (use_union (use_id x') (use_id_or_imm y'')) (use_union used1 used2))
  | IfFEq(x, y, e1, e2) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      let e1', used1 = g env e1 in
      let e2', used2 = g env e2 in
      (IfFEq(x', y', e1', e2'),
       use_union (use_union (use_id x') (use_id y')) (use_union used1 used2))
  | IfFLE(x, y, e1, e2) ->
      let x' = replace_float_id env x in
      let y' = replace_float_id env y in
      let e1', used1 = g env e1 in
      let e2', used2 = g env e2 in
      (IfFLE(x', y', e1', e2'),
       use_union (use_union (use_id x') (use_id y')) (use_union used1 used2))
  | Loop(l_start, l_end, body) ->
      let body', used = g env body in
      (Loop(l_start, l_end, body'), used)
  | Assign(x, y) ->
      let y' =
        if is_fzero env y then reg_fzero
        else replace_int_id env y
      in
      (Assign(x, y'), use_id y')
  | Break(x, t, l) ->
      (match t with
      | Type.Float ->
          let x' = replace_float_id env x in
          (Break(x', t, l), use_id x')
      | _ ->
          let x' = replace_int_id env x in
          (Break(x', t, l), use_id x'))
  | CallCls(x, ys, zs) ->
      let x' = replace_int_id env x in
      let ys' = List.map (replace_int_id env) ys in
      let zs' = List.map (replace_float_id env) zs in
      (CallCls(x', ys', zs'),
       List.fold_left (fun acc y -> S.add y acc) (use_id x')
         (ys' @ zs'))
  | CallDir(l, ys, zs) ->
      let ys' = List.map (replace_int_id env) ys in
      let zs' = List.map (replace_float_id env) zs in
      (CallDir(l, ys', zs'),
       List.fold_left (fun acc y -> S.add y acc) S.empty
         (ys' @ zs'))
  | Save(x, y) ->
      let x' =
        if is_fzero env x then reg_fzero
        else replace_int_id env x
      in
      (Save(x', y), use_id x')
  | Restore(y) ->
      (Restore(y), S.empty)

let h { name = l; args = xs; fargs = ys; body = e; ret = t } =
  let mut = collect_mutable e in
  let e', _ = g (empty_env mut) e in
  { name = l; args = xs; fargs = ys; body = e'; ret = t }

let f (Prog(data, fundefs, e)) =
  let mut = collect_mutable e in
  let e', _ = g (empty_env mut) e in
  Prog(data, List.map h fundefs, e')
