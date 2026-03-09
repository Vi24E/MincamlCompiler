open Asm

let data = ref []
let global_env = ref M.empty
let all_type_env = ref M.empty
let enable_if_simplify = Config.TKA.Virtual.enable_if_simplify

let rec collect_globals = function
  | Closure.Let((x, t), _, e) ->
      if Id.is_global x then global_env := M.add x t !global_env;
      collect_globals e
  | Closure.LetTuple(xts, _, e) ->
      List.iter (fun (x, t) -> if Id.is_global x then global_env := M.add x t !global_env) xts;
      collect_globals e
  | _ -> () (* Other constructs don't define globals locally in the body sequence *)

let add_type_if_absent acc (x, t) =
  if M.mem x acc then acc else M.add x t acc

let starts_with s prefix =
  let ls = String.length s and lp = String.length prefix in
  ls >= lp && String.sub s 0 lp = prefix

let infer_type_from_id x =
  let s = Id.to_string x in
  if starts_with s "Ti" then Some(Type.Int)
  else if starts_with s "Td" then Some(Type.Float)
  else if starts_with s "Tb" then Some(Type.Bool)
  else if starts_with s "Tu" then Some(Type.Unit)
  else if starts_with s "Ta" then Some(Type.Array(Type.Int))
  else None

let rec collect_all_types acc = function
  | Closure.Let((x, t), e1, e2) ->
      let acc' = add_type_if_absent acc (x, t) in
      collect_all_types (collect_all_types acc' e1) e2
  | Closure.LetTuple(xts, _, e) ->
      let acc' = List.fold_left add_type_if_absent acc xts in
      collect_all_types acc' e
  | Closure.MakeCls((x, t), _, e) ->
      collect_all_types (add_type_if_absent acc (x, t)) e
  | Closure.IfEq(_, _, e1, e2) | Closure.IfLE(_, _, e1, e2) ->
      collect_all_types (collect_all_types acc e1) e2
  | Closure.Loop(e) ->
      collect_all_types acc e
  | Closure.Assign(_, _, e) ->
      collect_all_types acc e
  | Closure.Unit | Closure.Int(_) | Closure.Float(_) | Closure.Neg(_)
  | Closure.Add(_, _) | Closure.Sub(_, _) | Closure.Sll(_, _) | Closure.Sra(_, _)
  | Closure.FNeg(_) | Closure.FAdd(_, _) | Closure.FSub(_, _) | Closure.FMul(_, _)
  | Closure.FDiv(_) | Closure.Var(_) | Closure.AppCls(_, _) | Closure.AppDir(_, _)
  | Closure.Tuple(_) | Closure.Get(_, _) | Closure.Put(_, _, _) | Closure.ExtArray(_)
  | Closure.TernPhi(_, _, _) | Closure.Break(_) ->
      acc

let find_type x env =
  try M.find x env
  with Not_found ->
    (match M.find_opt x !all_type_env with
    | Some t -> t
    | None ->
        if Id.is_global x then M.find x !global_env
        else
          (match infer_type_from_id x with
          | Some t -> t
          | None -> raise Not_found))

let classify xts ini addf addi =
  List.fold_left
    (fun acc (x, t) ->
      match t with
      | Type.Unit -> acc
      | Type.Float -> addf acc x
      | _ -> addi acc x t)
    ini
    xts

let separate xts =
  classify
    xts
    ([], [])
    (fun (int, float) x -> (int, float @ [x]))
    (fun (int, float) x _ -> (int @ [x], float))

let expand xts ini addf addi =
  classify
    xts
    ini
    (fun (offset, acc) x ->
      let offset = align offset in
      (offset + 4, addf x offset acc))
    (fun (offset, acc) x t ->
      (offset + 4, addi x t offset acc))

let const_int_of_id_tag (_, tag) =
  match tag with
  | Id.Known(_, Id.ConstInt i) -> Some(i)
  | _ -> None

let const_int_of_id const_env x =
  try Some(M.find x const_env)
  with Not_found -> const_int_of_id_tag x

let int01_of_closure = function
  | Closure.Int(0) -> Some(0)
  | Closure.Int(1) -> Some(1)
  | _ -> None

type bool_projection = Keep | Invert

let projection_of_01 e1 e2 =
  match int01_of_closure e1, int01_of_closure e2 with
  | Some(1), Some(0) -> Some(Keep)
  | Some(0), Some(1) -> Some(Invert)
  | _ -> None

let bool_not_to_int x =
  Ans(CmpEq(x, C(0)))

let int_cmp_rhs const_env y =
  match const_int_of_id const_env y with
  | Some(i) -> C(i)
  | None -> V(y)

type float_sign_pattern =
  | SignMul of bool_projection * Id.t
  | SignConst of bool_projection

type float_atom =
  | AVar of Id.t
  | ANegVar of Id.t
  | AConst of float

let rec float_atom_of_expr env = function
  | Closure.Var(x) ->
      (match M.find_opt x env with
      | Some(a) -> Some(a)
      | None -> Some(AVar(x)))
  | Closure.FNeg(x) ->
      (match M.find_opt x env with
      | Some(AVar(v)) -> Some(ANegVar(v))
      | Some(ANegVar(v)) -> Some(AVar(v))
      | Some(AConst(f)) -> Some(AConst(-.f))
      | None -> Some(ANegVar(x)))
  | Closure.Float(f) -> Some(AConst(f))
  | Closure.Let((x, Type.Float), e1, e2) ->
      (match float_atom_of_expr env e1 with
      | Some(a) -> float_atom_of_expr (M.add x a env) e2
      | None -> None)
  | _ -> None

let float_sign_pattern_of_branches (e1, e2) =
  match float_atom_of_expr M.empty e1, float_atom_of_expr M.empty e2 with
  | Some(AVar(v1)), Some(ANegVar(v2)) when v1 = v2 -> Some(SignMul(Keep, v1))
  | Some(ANegVar(v1)), Some(AVar(v2)) when v1 = v2 -> Some(SignMul(Invert, v1))
  | Some(AConst(f1)), Some(AConst(f2)) when f1 = 1.0 && f2 = -1.0 -> Some(SignConst(Keep))
  | Some(AConst(f1)), Some(AConst(f2)) when f1 = -1.0 && f2 = 1.0 -> Some(SignConst(Invert))
  | _ -> None

let build_signed_float_from_cmp cmp_exp pattern =
  let b = Id.genid "cmpb" in
  let c = Id.genid "cmpc" in
  let d = Id.genid "cmpd" in
  let df = Id.genid "cmpf" in
  let proj =
    match pattern with
    | SignMul(p, _) -> p
    | SignConst(p) -> p
  in
  let out =
    match pattern with
    | SignMul(_, v) -> Ans(FMul(df, v))
    | SignConst(_) -> Ans(FMov(df))
  in
  let rest = Let((df, Type.Float), CallDir(Id.L("min_caml_float_of_int"), [d], []), out) in
  let d_code =
    match proj with
    | Keep ->
        Let((d, Type.Int), Sub(c, C(1)), rest)  (* (b<<1)-1 *)
    | Invert ->
        let n = Id.genid "cmpneg" in
        Let((n, Type.Int), Neg(c), Let((d, Type.Int), Add(n, C(1)), rest))  (* 1-(b<<1) *)
  in
  Let((b, Type.Int), cmp_exp, Let((c, Type.Int), Sll(b, C(1)), d_code))

let cmp_exp_of_ifeq env const_env x y =
  match find_type x env with
  | Type.Bool | Type.Int -> CmpEq(x, int_cmp_rhs const_env y)
  | Type.Float -> CmpFEq(x, y)
  | _ -> failwith "equality supported only for bool, int, and float"

let cmp_exp_of_ifle env const_env x y =
  match find_type x env with
  | Type.Bool | Type.Int -> CmpLE(x, int_cmp_rhs const_env y)
  | Type.Float -> CmpFLE(x, y)
  | _ -> failwith "inequality supported only for bool, int, and float"

(* not(x <= y) = y < x *)
let inv_cmp_exp_of_ifle env const_env x y =
  match find_type x env with
  | Type.Bool | Type.Int -> CmpLT(y, int_cmp_rhs const_env x)
  | Type.Float -> CmpFLT(y, x)
  | _ -> failwith "inequality supported only for bool, int, and float"

let simplify_bool_ifeq_to_int env const_env x y e1 e2 =
  match int01_of_closure e1, int01_of_closure e2 with
  | Some(a), Some(b) ->
      let simplify_with var const =
        if find_type var env <> Type.Bool then None
        else if a = b then Some(Ans(SetInt(a)))
        else if a = const then Some(Ans(Mov(var)))
        else Some(bool_not_to_int var)
      in
      (match const_int_of_id const_env x, const_int_of_id const_env y with
      | Some(c), _ when c = 0 || c = 1 -> simplify_with y c
      | _, Some(c) when c = 0 || c = 1 -> simplify_with x c
      | _ -> None)
  | _ -> None

let rec g env const_env break_label continue_label e = 
    match e with
    | Closure.Unit -> Ans(Nop)
    | Closure.Int(i) -> Ans(SetInt(i))
    | Closure.Float(f) -> Ans(SetFloat(f))
    | Closure.Neg(x) -> Ans(Neg(x))
    | Closure.Add(x, y) -> Ans(Add(x, V(y)))
    | Closure.Sub(x, y) -> Ans(Sub(x, V(y)))
    | Closure.Sll(x, y) -> Ans(Sll(x, V(y)))
    | Closure.Sra(x, y) -> Ans(Sra(x, V(y)))
    | Closure.FNeg(x) -> Ans(FNeg(x))
    | Closure.FAdd(x, y) -> Ans(FAdd(x, y))
    | Closure.FSub(x, y) -> Ans(FSub(x, y))
    | Closure.FMul(x, y) -> Ans(FMul(x, y))
    | Closure.FDiv(x, y) -> 
        let id = Id.genid "f" in
        Let((id, Type.Float), FInv(y), Ans(FMul(x, id)))
    | Closure.IfEq(x, y, e1, e2) ->
      if !enable_if_simplify then
        (match float_sign_pattern_of_branches (e1, e2) with
        | Some(pattern) ->
            build_signed_float_from_cmp (cmp_exp_of_ifeq env const_env x y) pattern
        | None ->
            (match projection_of_01 e1 e2 with
            | Some(proj) ->
                (match simplify_bool_ifeq_to_int env const_env x y e1 e2 with
                | Some(simplified) -> simplified
                | None ->
                    let as_int_result cmp_exp =
                      match proj with
                      | Keep -> Ans(cmp_exp)
                      | Invert ->
                          let t = Id.genid "cmp" in
                          Let((t, Type.Int), cmp_exp, Ans(CmpEq(t, C(0))))
                    in
                    as_int_result (cmp_exp_of_ifeq env const_env x y))
            | None ->
                (match find_type x env with
                | Type.Bool | Type.Int ->
                    Ans
                      (IfEq
                         ( x,
                           V(y),
                           g env const_env break_label continue_label e1,
                           g env const_env break_label continue_label e2 ))
                | Type.Float ->
                    Ans
                      (IfFEq
                         ( x,
                           y,
                           g env const_env break_label continue_label e1,
                           g env const_env break_label continue_label e2 ))
                | _ -> failwith "equality supported only for bool, int, and float")))
      else
        (match find_type x env with
        | Type.Bool | Type.Int ->
            Ans
              (IfEq
                 ( x,
                   V(y),
                   g env const_env break_label continue_label e1,
                   g env const_env break_label continue_label e2 ))
        | Type.Float ->
            Ans
              (IfFEq
                 ( x,
                   y,
                   g env const_env break_label continue_label e1,
                   g env const_env break_label continue_label e2 ))
        | _ -> failwith "equality supported only for bool, int, and float")
    | Closure.IfLE(x, y, e1, e2) ->
      if !enable_if_simplify then
        (match float_sign_pattern_of_branches (e1, e2) with
        | Some(pattern) ->
            build_signed_float_from_cmp (cmp_exp_of_ifle env const_env x y) pattern
        | None ->
            (match projection_of_01 e1 e2 with
            | Some(proj) ->
                (match proj with
                | Keep ->
                    Ans(cmp_exp_of_ifle env const_env x y)
                | Invert ->
                    Ans(inv_cmp_exp_of_ifle env const_env x y))
            | None ->
                (match find_type x env with
                | Type.Bool | Type.Int ->
                    Ans
                      (IfLE
                         ( x,
                           V(y),
                           g env const_env break_label continue_label e1,
                           g env const_env break_label continue_label e2 ))
                | Type.Float ->
                    Ans
                      (IfFLE
                         ( x,
                           y,
                           g env const_env break_label continue_label e1,
                           g env const_env break_label continue_label e2 ))
                | _ -> failwith "inequality supported only for bool, int, and float")))
      else
        (match find_type x env with
        | Type.Bool | Type.Int ->
            Ans
              (IfLE
                 ( x,
                   V(y),
                   g env const_env break_label continue_label e1,
                   g env const_env break_label continue_label e2 ))
        | Type.Float ->
            Ans
              (IfFLE
                 ( x,
                   y,
                   g env const_env break_label continue_label e1,
                   g env const_env break_label continue_label e2 ))
        | _ -> failwith "inequality supported only for bool, int, and float")
    | Closure.Let((x, t1), e1, e2) ->
      let e1' = g env const_env break_label continue_label e1 in
      let const_env2 =
        match e1 with
        | Closure.Int(i) -> M.add x i const_env
        | _ -> M.remove x const_env
      in
      let e2' = g (M.add x t1 env) const_env2 break_label continue_label e2 in
      concat e1' (x, t1) e2'
    | Closure.Var(x) ->
      (match find_type x env with
      | Type.Unit -> Ans(Nop)
      | Type.Float -> Ans(FMov(x))
      | _ -> Ans(Mov(x)))
    | Closure.MakeCls((x, t), { Closure.entry = l; Closure.actual_fv = ys }, e2) -> 
      let e2' = g (M.add x t env) (M.remove x const_env) break_label continue_label e2 in
      let offset, store_fv =
        expand
          (List.map (fun y -> (y, find_type y env)) ys)
          (4, e2')
          (fun y offset store_fv -> seq(StF(y, x, C(offset)), store_fv))
          (fun y _ offset store_fv -> seq(St(y, x, C(offset)), store_fv)) in
      Let((x, t), Mov(reg_hp),
          Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
              let z = Id.genid "l" in
              Let((z, Type.Int), SetLabel(l),
                  seq(St(z, x, C(0)),
                      store_fv))))
    | Closure.AppCls(x, ys) ->
      let (int, float) = separate (List.map (fun y -> (y, find_type y env)) ys) in
      Ans(CallCls(x, int, float))
    | Closure.AppDir(Id.L(x), ys) ->
      let (int, float) = separate (List.map (fun y -> (y, find_type y env)) ys) in
      Ans(CallDir(Id.L(x), int, float))
    | Closure.Tuple(xs) -> (* Ȥ (caml2html: virtual_tuple) *)
      let y = Id.genid "t" in
      let (offset, store) =
        expand
          (List.map (fun x -> (x, find_type x env)) xs)
          (0, Ans(Mov(y)))
          (fun x offset store -> seq(StF(x, y, C(offset)), store))
          (fun x _ offset store -> seq(St(x, y, C(offset)), store)) in
      Let((y, Type.Tuple(List.map (fun x -> M.find x env) xs)), Mov(reg_hp),
          Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
              store))
    | Closure.LetTuple(xts, y, e2) ->
      let s = Closure.fv e2 in
      let const_env' = List.fold_left (fun cenv (x, _) -> M.remove x cenv) const_env xts in
      let (offset, load) =
        expand
          xts
          (0, g (M.add_list xts env) const_env' break_label continue_label e2)
          (fun x offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            Let((x, Type.Float), LdF(y, C(offset)), load))
          (fun x t offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            Let((x, t), Ld(y, C(offset)), load)) in
      load
    | Closure.Get(x, y) ->
      (match find_type x env with
      | Type.Array(Type.Unit) -> Ans(Nop)
      | Type.Array(Type.Float) ->
          (match const_int_of_id const_env y with
          | Some(i) -> Ans(LdF(x, C(i * 4)))
          | None ->
              let offset = Id.genid "o" in
              Let((offset, Type.Int), Sll(y, C(2)),
                  Ans(LdF(x, V(offset)))))
      | Type.Array(_) ->
          (match const_int_of_id const_env y with
          | Some(i) -> Ans(Ld(x, C(i * 4)))
          | None ->
              let offset = Id.genid "o" in
              Let((offset, Type.Int), Sll(y, C(2)),
                  Ans(Ld(x, V(offset)))))
      | _ -> assert false)
    | Closure.Put(x, y, z) ->
      (match find_type x env with
      | Type.Array(Type.Unit) -> Ans(Nop)
      | Type.Array(Type.Float) ->
          (match const_int_of_id const_env y with
          | Some(i) -> Ans(StF(z, x, C(i * 4)))
          | None ->
              let offset = Id.genid "o" in
              Let((offset, Type.Int), Sll(y, C(2)),
                  Ans(StF(z, x, V(offset)))))
      | Type.Array(_) ->
          (match const_int_of_id const_env y with
          | Some(i) -> Ans(St(z, x, C(i * 4)))
          | None ->
              let offset = Id.genid "o" in
              Let((offset, Type.Int), Sll(y, C(2)),
                  Ans(St(z, x, V(offset)))))
      | _ -> assert false)
    | Closure.ExtArray(Id.L(x)) -> Ans(SetLabel(Id.L("min_caml_" ^ x)))
    | Closure.TernPhi(c, x, y) ->
      let tx = try Some(find_type x env) with Not_found -> None in
      let ty = try Some(find_type y env) with Not_found -> None in
      let txy =
        match tx, ty with
        | Some(Type.Unit), Some(Type.Unit) -> Type.Unit
        | Some(Type.Float), _ | _, Some(Type.Float) -> Type.Float
        | Some t, _ -> t
        | _, Some t -> t
        | None, None -> Type.Int
      in
      (match txy with
      | Type.Unit ->
          Ans(Nop)
      | Type.Float ->
          Ans(TernF(c, x, y))
      | _ ->
          Ans(Tern(c, x, y)))
    | Closure.Loop(e) ->
      let l_start = Id.genid "loop_start" in
      let l_end = Id.genid "loop_end" in
      Ans
        (Loop
           ( Id.L(Id.to_string l_start),
             Id.L(Id.to_string l_end),
             g
               env
               M.empty
               (Some(Id.L(Id.to_string l_end)))
               (Some(Id.L(Id.to_string l_start)))
               e ))
    | Closure.Assign(x, y, e) ->
      concat (Ans(Assign(x, y))) (Id.gentmp Type.Unit, Type.Unit) (g env (M.remove x const_env) break_label continue_label e)
    | Closure.Break(x) ->
      (match break_label with
      | Some(l) ->
          let t = find_type x env in
          Ans(Break(x, t, l))
      | None -> failwith "Break used outside of loop")
    
let h { Closure.name = (Id.L(x), t); Closure.args = yts; Closure.formal_fv = zts; Closure.body = e } =
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (4, g (M.add (x, Id.Unknown) t (M.add_list yts (M.add_list zts M.empty))) M.empty None None e)
      (fun z offset load -> fletd(z, LdF((x, Id.Unknown), C(offset)), load))
      (fun z t offset load -> Let((z, t), Ld((x, Id.Unknown), C(offset)), load)) in
  match t with
  | Type.Fun(_, t2) ->
      { name = Id.L(x); args = int; fargs = float; body = load; ret = t2 }
  | _ -> assert false
    
let f (Closure.Prog(fundefs, e)) =
    data := [];
    global_env := M.empty;
    all_type_env := M.empty;
    let collected =
      List.fold_left
        (fun acc { Closure.args; formal_fv; body; _ } ->
          let acc' = List.fold_left add_type_if_absent acc args in
          let acc'' = List.fold_left add_type_if_absent acc' formal_fv in
          collect_all_types acc'' body)
        M.empty
        fundefs
      |> fun acc -> collect_all_types acc e
    in
    all_type_env := collected;
    collect_globals e;
    let fundefs = List.map h fundefs in
    let e = g M.empty M.empty None None e in
    Prog(!data, fundefs, e)
