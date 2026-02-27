open KNormal

(* インライン展開する関数の最大サイズ (caml2html: inline_threshold) *)
let threshold = ref 50000 (* Mainで-inlineオプションによりセットされる *)

let same_id x y = Id.compare x y = 0

let rec size = function
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2)
  | LetRec({ body = e1; tags = _; _ }, e2)
  | While(e1, e2) -> 1 + size e1 + size e2
  | Let(_, e1, e2) -> 
    (match e1 with
    | Int(_) -> size e2
    | _ -> 1 + size e1 + size e2)
  | Assign(_, _, e1) -> 1 + size e1
  | LetTuple(_, _, e) -> 1 + size e
  | _ -> 1

(* true if function [name] has a self-recursive call in non-tail position. *)
let rec has_non_tail_self_call name tail_pos = function
  | App(f, _) when same_id f name -> not tail_pos
  | App(_, _) -> false
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      has_non_tail_self_call name tail_pos e1
      || has_non_tail_self_call name tail_pos e2
  | Let((x, _), e1, e2) ->
      let e1_tail =
        tail_pos
        &&
        match e2 with
        | Var(y) when same_id x y -> true
        | _ -> false
      in
      has_non_tail_self_call name e1_tail e1
      || has_non_tail_self_call name tail_pos e2
  | LetRec({ name = (f, _); body; tags = _; args = _ }, e2) ->
      if same_id f name then
        has_non_tail_self_call name tail_pos e2
      else
        has_non_tail_self_call name false body
        || has_non_tail_self_call name tail_pos e2
  | LetTuple(_, _, e) ->
      has_non_tail_self_call name tail_pos e
  | Assign(_, _, e) ->
      has_non_tail_self_call name tail_pos e
  | While(e1, e2) ->
      has_non_tail_self_call name false e1
      || has_non_tail_self_call name false e2
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _) | Sra(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _) | Var(_) | Tuple(_)
  | Get(_, _) | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _) | Break(_) ->
      false

let rec g env = function (* インライン展開ルーチン本体 (caml2html: inline_g) *)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g env e1, g env e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g env e1, g env e2)
  | Let(xt, e1, e2) -> Let(xt, g env e1, g env e2)
  | LetRec({ name = (x, t); args = yts; body = e1; tags = _ }, e2) -> (* 関数定義の場合 (caml2html: inline_letrec) *)
      let can_inline =
        size e1 <= !threshold
        && not (has_non_tail_self_call x true e1)
      in
      let env = if can_inline then M.add x (yts, e1) env else env in
      let fundef = { name = (x, t); args = yts; body = g env e1; tags = KNormal.default_tag() } in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, g env e2)
  | App(x, ys) when M.mem x env -> (* 関数適用の場合 (caml2html: inline_app) *)
      let (zs, e) = M.find x env in
      (* Format.eprintf "inlining %s@." x; *)
      let params' =
        List.map
          (fun (z, t) -> (Id.genid (Id.to_string z), t))
          zs
      in
      let alpha_env =
        List.fold_left2
          (fun env' (z, _t) (z', _t') -> M.add z z' env')
          M.empty
          zs
          params'
      in
      let body' = Alpha.g alpha_env e in
      List.fold_right2
        (fun (z', t) y acc -> Let((z', t), Var(y), acc))
        params'
        ys
        body'
  | LetTuple(xts, y, e) -> LetTuple(xts, y, g env e)
  | Assign(x, y, e) -> Assign(x, y, g env e)
  | While(e1, e2) -> While(g env e1, g env e2)
  | e -> e

let f e = g M.empty e
