(* 仮想レジスタ割り当て (Virtual Register Allocation) *)
open Asm

let id_or_imm_is_reg = function
  | V(x) -> is_reg x
  | _ -> false

let reg_zero = ("%i0", Id.Known(Id.Register, Id.None))

(* 関数やグローバル変数のアドレスをロードする命令かどうか *)
let is_load_addr = function
  | SetLabel _ -> true
  | _ -> false

(* 仮想レジスタ割り当て関数 *)
(* 基本的に、ローカル変数は新しい仮想レジスタに割り当てる *)
let alloc x t regenv =
  if M.mem x regenv then M.find x regenv (* 既に割り当て済みならそれを使う *)
  else (* 新しい仮想レジスタを割り当て *)
    let new_reg =
      match t with
      | Type.Unit -> ("%i0", Id.Unknown) (* dummy: zero register *)
      | Type.Float -> gen_virtual_float_reg ()
      | _ -> gen_virtual_int_reg ()
    in
    new_reg

(* 仮想レジスタ環境への追加 *)
let add x r regenv =
  if is_reg x then (assert (x = r); regenv) else
  M.add x r regenv

let loop_envs = ref []

let is_float_reg_id x =
  let s = Id.to_string x in
  String.length s >= 2 &&
  (String.sub s 0 2 = "%f" ||
   (String.length s >= 3 && String.sub s 0 3 = "%vf"))

let infer_assign_type x y regenv =
  if M.mem x regenv then
    if is_float_reg_id (M.find x regenv) then Type.Float else Type.Int
  else if M.mem y regenv then
    if is_float_reg_id (M.find y regenv) then Type.Float else Type.Int
  else if is_reg x then
    if is_float_reg_id x then Type.Float else Type.Int
  else if is_reg y then
    if is_float_reg_id y then Type.Float else Type.Int
  else
    Type.Int

(* 変数の検索 *)
(* 変数の検索とロード (CPS Style) *)
let find_and_bind x t regenv k =
  if is_reg x then k x
  else
    try k (M.find x regenv)
    with Not_found ->
      if Id.is_global x then
        let r = match t with Type.Float -> gen_virtual_float_reg () | _ -> gen_virtual_int_reg () in
        let offset = Id.offset x in
        let load_instr =
          match t with
          | Type.Float -> LdF(reg_zero, C(offset))
          | _ -> Ld(reg_zero, C(offset))
        in
        let (e, reg_out) = k r in
        (Let((r, t), load_instr, e), reg_out)
      else k x

let find_and_bind' x' regenv k =
  match x' with
  | V(x) -> find_and_bind x Type.Int regenv (fun r -> k (V(r)))
  | c -> k c

(* 命令列に対するレジスタ割り当て *)
let rec g dest cont regenv = function
  | Ans(exp) -> g' dest cont regenv exp
  | Let((x, t) as xt, exp, e) ->
      let (e1', regenv1) = g' xt cont regenv exp in
      let r = 
        if is_reg x then x 
        else alloc x t regenv1
      in
      let regenv2 = add x r regenv1 in
      let (e2', regenv3) = g dest cont regenv2 e in
      (* グローバル変数の場合はSaveを挿入してグローバル領域に保存 *)
      let seq_e2' = if Id.is_global x then seq(Save(r, x), e2') else e2' in
      (concat e1' (r, t) seq_e2', regenv3)

and g' dest cont regenv = function
  | Nop | SetInt _ | SetFloat _ | SetLabel _ | Restore _ as exp -> (Ans(exp), regenv)
  | Mov(x) -> find_and_bind x Type.Int regenv (fun rx -> (Ans(Mov(rx)), regenv))
  | Neg(x) -> find_and_bind x Type.Int regenv (fun rx -> (Ans(Neg(rx)), regenv))
  | Add(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(Add(rx, ry')), regenv)))
  | Sub(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(Sub(rx, ry')), regenv)))
  | Sll(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(Sll(rx, ry')), regenv)))
  | Sra(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(Sra(rx, ry')), regenv)))
  | Ld(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(Ld(rx, ry')), regenv)))
  | St(x, y, z') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind y Type.Int regenv (fun ry -> find_and_bind' z' regenv (fun rz' -> (Ans(St(rx, ry, rz')), regenv))))
  | LdF(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(LdF(rx, ry')), regenv)))
  | StF(x, y, z') -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Int regenv (fun ry -> find_and_bind' z' regenv (fun rz' -> (Ans(StF(rx, ry, rz')), regenv))))
  | FInv(x) -> find_and_bind x Type.Float regenv (fun rx -> (Ans(FInv(rx)), regenv))
  | FMov(x) -> find_and_bind x Type.Float regenv (fun rx -> (Ans(FMov(rx)), regenv))
  | FNeg(x) -> find_and_bind x Type.Float regenv (fun rx -> (Ans(FNeg(rx)), regenv))
  | FAdd(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(FAdd(rx, ry)), regenv)))
  | FSub(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(FSub(rx, ry)), regenv)))
  | FMul(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(FMul(rx, ry)), regenv)))
  | FDiv(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(FDiv(rx, ry)), regenv)))
  | CmpEq(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(CmpEq(rx, ry')), regenv)))
  | CmpLE(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(CmpLE(rx, ry')), regenv)))
  | CmpLT(x, y') -> find_and_bind x Type.Int regenv (fun rx -> find_and_bind' y' regenv (fun ry' -> (Ans(CmpLT(rx, ry')), regenv)))
  | CmpFEq(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(CmpFEq(rx, ry)), regenv)))
  | CmpFLE(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(CmpFLE(rx, ry)), regenv)))
  | CmpFLT(x, y) -> find_and_bind x Type.Float regenv (fun rx -> find_and_bind y Type.Float regenv (fun ry -> (Ans(CmpFLT(rx, ry)), regenv)))
  
  | IfEq(x, y', e1, e2) -> 
      find_and_bind x Type.Int regenv (fun rx -> 
        find_and_bind' y' regenv (fun ry' ->
          g'_if dest cont regenv (fun e1' e2' -> IfEq(rx, ry', e1', e2')) e1 e2))
  | IfLE(x, y', e1, e2) -> 
      find_and_bind x Type.Int regenv (fun rx -> 
        find_and_bind' y' regenv (fun ry' ->
          g'_if dest cont regenv (fun e1' e2' -> IfLE(rx, ry', e1', e2')) e1 e2))
  | IfFEq(x, y, e1, e2) -> 
      find_and_bind x Type.Float regenv (fun rx -> 
        find_and_bind y Type.Float regenv (fun ry ->
          g'_if dest cont regenv (fun e1' e2' -> IfFEq(rx, ry, e1', e2')) e1 e2))
  | IfFLE(x, y, e1, e2) -> 
      find_and_bind x Type.Float regenv (fun rx -> 
        find_and_bind y Type.Float regenv (fun ry ->
          g'_if dest cont regenv (fun e1' e2' -> IfFLE(rx, ry, e1', e2')) e1 e2))
  | Loop(l_start, l_end, e) ->
      loop_envs := regenv :: !loop_envs;
      let (e', _) = g (Id.gentmp Type.Unit, Type.Unit) cont regenv e in
      loop_envs := List.tl !loop_envs;
      (Ans(Loop(l_start, l_end, e')), regenv)
  | Assign(x, y) ->
      let t = infer_assign_type x y regenv in
      let target_reg =
        if is_reg x then
          x
        else
          match !loop_envs with
          | entry_env :: _ when M.mem x entry_env -> M.find x entry_env
          | _ when M.mem x regenv -> M.find x regenv
          | _ -> alloc x t regenv
      in
      find_and_bind y t regenv (fun source_reg ->
        (Ans(Assign(target_reg, source_reg)), add x target_reg regenv))
  | Break(x, t, l) ->
      find_and_bind x t regenv (fun rx -> (Ans(Break(rx, t, l)), regenv))

  | CallCls(x, ys, zs) ->
      (* 関数呼び出し: 引数を評価してから *)
      let (d, dt) = dest in
      find_and_bind x Type.Int regenv (fun rx ->
        let rec binds_ys ys k = match ys with
          | [] -> k []
          | y::ys -> find_and_bind y Type.Int regenv (fun ry -> binds_ys ys (fun rys -> k (ry::rys)))
        in
        binds_ys ys (fun rys ->
          let rec binds_zs zs k = match zs with
            | [] -> k []
            | z::zs -> find_and_bind z Type.Float regenv (fun rz -> binds_zs zs (fun rzs -> k (rz::rzs)))
          in
          binds_zs zs (fun rzs ->
            (* rys, rzs are virtual registers holding values *)
            (* Now map to physical registers for Call *)
            let args = List.map2 (fun r y_vreg -> (r, y_vreg)) (Array.to_list (Array.sub regs 0 (List.length rys))) rys in
            let fargs = List.map2 (fun fr z_vreg -> (fr, z_vreg)) (Array.to_list (Array.sub fregs 0 (List.length rzs))) rzs in
            
            let call_inst = CallCls(rx, List.map fst args, List.map fst fargs) in
            
            let set_args_expr body =
              let rec loop args fargs =
                match args, fargs with
                | [], [] -> body
                | (r, y)::rs, _ -> Let((r, Type.Int), Mov(y), loop rs fargs)
                | [], (fr, z)::frs -> Let((fr, Type.Float), FMov(z), loop [] frs)
              in
              loop args fargs
            in
            (* 戻り値のコピーを明示的に生成 *)
            let call_and_return = 
              match dt with
              | Type.Unit -> Ans(call_inst)
              | Type.Float -> 
                  let tmp = gen_virtual_float_reg () in
                  concat (Ans(call_inst)) (tmp, Type.Float) (Ans(FMov(fregs.(0))))
              | _ -> 
                  let tmp = gen_virtual_int_reg () in
                  concat (Ans(call_inst)) (tmp, Type.Int) (Ans(Mov(regs.(0))))
            in
            (set_args_expr call_and_return, regenv)
          )
        )
      )

  | CallDir(Id.L(x), ys, zs) ->
      (* CallClsと同様 *)
      let (_, dt) = dest in
      let rec binds_ys ys k = match ys with
        | [] -> k []
        | y::ys -> find_and_bind y Type.Int regenv (fun ry -> binds_ys ys (fun rys -> k (ry::rys)))
      in
      binds_ys ys (fun rys ->
        let rec binds_zs zs k = match zs with
          | [] -> k []
          | z::zs -> find_and_bind z Type.Float regenv (fun rz -> binds_zs zs (fun rzs -> k (rz::rzs)))
        in
        binds_zs zs (fun rzs ->
          let args = List.map2 (fun r y_vreg -> (r, y_vreg)) (Array.to_list (Array.sub regs 0 (List.length rys))) rys in
          let fargs = List.map2 (fun fr z_vreg -> (fr, z_vreg)) (Array.to_list (Array.sub fregs 0 (List.length rzs))) rzs in
          
          let int_arg_regs = List.map fst args in
          let int_arg_regs =
            List.map2
              (fun src r ->
                match snd src with
                | Id.Known(_, Id.ConstInt i) -> (fst r, Id.Known(Id.Register, Id.ConstInt i))
                | _ when fst src = "%i0" -> (fst r, Id.Known(Id.Register, Id.ConstInt 0))
                | _ -> r)
              ys
              int_arg_regs
          in
          let float_arg_regs = List.map fst fargs in
          let float_arg_regs =
            List.map2
              (fun src r ->
                match snd src with
                | Id.Known(_, Id.ConstFloat f) -> (fst r, Id.Known(Id.Register, Id.ConstFloat f))
                | _ when fst src = "%f0" -> (fst r, Id.Known(Id.Register, Id.ConstFloat 0.0))
                | _ -> r)
              zs
              float_arg_regs
          in
          let call_inst = CallDir(Id.L(x), int_arg_regs, float_arg_regs) in
          
          let set_args_expr body =
            let rec loop args fargs =
              match args, fargs with
              | [], [] -> body
              | (r, y)::rs, _ -> Let((r, Type.Int), Mov(y), loop rs fargs)
              | [], (fr, z)::frs -> Let((fr, Type.Float), FMov(z), loop [] frs)
            in
            loop args fargs
          in
          let call_result_is_special =
            x = "min_caml_int_of_float" ||
            x = "min_caml_float_to_int" ||
            x = "min_caml_float_of_int" ||
            x = "min_caml_xor"
          in
          (* 戻り値のコピーを明示的に生成 *)
          let call_and_return = 
            if call_result_is_special then
              Ans(call_inst)
            else
              match dt with
              | Type.Unit -> Ans(call_inst)
              | Type.Float -> 
                  let tmp = gen_virtual_float_reg () in
                  concat (Ans(call_inst)) (tmp, Type.Float) (Ans(FMov(fregs.(0))))
              | _ -> 
                  let tmp = gen_virtual_int_reg () in
                  concat (Ans(call_inst)) (tmp, Type.Int) (Ans(Mov(regs.(0))))
          in
          (set_args_expr call_and_return, regenv)
        )
      )

  | Save(_, _) -> assert false (* 仮想モードでは明示的なSaveは生成されないはず *)

and g'_if dest cont regenv constr e1 e2 =
  let (e1', _) = g dest cont regenv e1 in
  let (e2', _) = g dest cont regenv e2 in
  (* ifの結果はdestに入るように生成されるので、単純に結合 *)
  (Ans(constr e1' e2'), regenv)

let h { name = Id.L(x); args = ys; fargs = zs; body = e; ret = t } = 
  (* ステップ1: 引数の仮想レジスタへのマッピング作成 *)
  (* RegAllocと同様に、関数名(クロージャポインタ)をreg_clにマッピングする *)
  let regenv = M.add (x, Id.Unknown) reg_cl M.empty in
  let (regenv, arg_moves) = 
    List.fold_left2
      (fun (env, moves) y r ->
         let vreg = gen_virtual_int_reg () in
         (M.add y vreg env, moves @ [Let((vreg, Type.Int), Mov(r), Ans(Nop))])) (* Nopはダミー *)
      (regenv, [])
      ys
      (Array.to_list (Array.sub regs 0 (List.length ys)))
  in
  let (regenv, farg_moves) = 
    List.fold_left2
      (fun (env, moves) z fr ->
         let vreg = gen_virtual_float_reg () in
         (M.add z vreg env, moves @ [Let((vreg, Type.Float), FMov(fr), Ans(Nop))]))
      (regenv, [])
      zs
      (Array.to_list (Array.sub fregs 0 (List.length zs)))
  in
  
  (* ステップ2: 関数本体の処理 *)
  (* 戻り値の格納先決定 *)
  let a = 
    match t with
    | Type.Unit -> Id.gentmp Type.Unit
    | Type.Float -> ("%f0", Id.Unknown) (* 戻り値は物理レジスタへ *)
    | _ -> ("%i0", Id.Unknown)
  in
  
  let (e', _) = g (a, t) (Ans(Mov(a))) regenv e in
  
  (* ステップ3: 引数ムーブ命令の挿入 *)
  let rec seq_moves moves check_body =
    match moves with
    | [] -> check_body
    | Let(xt, exp, _) :: rest -> Let(xt, exp, seq_moves rest check_body)
    | _ -> assert false
  in
  
  let body' = seq_moves (arg_moves @ farg_moves) e' in
  
  (* 引数リストは物理レジスタ *)
  let phys_args = Array.to_list (Array.sub regs 0 (List.length ys)) in
  let phys_fargs = Array.to_list (Array.sub fregs 0 (List.length zs)) in
  
  { name = Id.L(x); args = phys_args; fargs = phys_fargs; body = body'; ret = t }

let f (Prog(data, fundefs, e)) =
  Format.eprintf "virtual register allocation mode@.";
  let fundefs' = List.map h fundefs in
  let e', _ = g (Id.gentmp Type.Unit, Type.Unit) (Ans(Nop)) M.empty e in
  Prog(data, fundefs', e')
