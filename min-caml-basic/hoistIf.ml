open KNormal

module ExpOrd = struct
  type t = KNormal.t
  let compare = Stdlib.compare
end

module ExpMap = Map.Make(ExpOrd)
module ExpSet = Set.Make(ExpOrd)

module IdOrd = struct
  type t = Id.t
  let compare = Id.compare
end

module IdMap = Map.Make(IdOrd)

let rec collect_defined acc = function
  | Let((x, _), e1, e2) ->
      let acc' = S.add x acc in
      collect_defined (collect_defined acc' e1) e2
  | LetRec({ name = (f, _); args = yts; body = e1; tags = _ }, e2) ->
      let acc' = S.add f acc in
      let acc'' = List.fold_left (fun a (y, _) -> S.add y a) acc' yts in
      collect_defined (collect_defined acc'' e1) e2
  | LetTuple(xts, _, e) ->
      let acc' = List.fold_left (fun a (x, _) -> S.add x a) acc xts in
      collect_defined acc' e
  | Assign(x, _, e, _) ->
      collect_defined (S.add x acc) e
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | While(e1, e2) ->
      collect_defined (collect_defined acc e1) e2
  | TernPhi(_, _, _) -> acc
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _)
  | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | Var(_) | App(_, _) | Tuple(_) | Get(_, _) | Put(_, _, _) | ExtArray(_)
  | ExtFunApp(_, _) | Break(_) ->
      acc

let can_hoist_rhs defs_in_if rhs =
  FunctionChecker.checkExpPurity rhs
  && S.is_empty (S.inter (fv rhs) defs_in_if)

let split_leading_lets e =
  let rec aux acc = function
    | Let(xt, rhs, tail) -> aux ((xt, rhs) :: acc) tail
    | tail -> (List.rev acc, tail)
  in
  aux [] e

let wrap_lets lets body =
  List.fold_right (fun (xt, rhs) acc -> Let(xt, rhs, acc)) lets body

let rec resolve_id env x =
  match IdMap.find_opt x env with
  | None -> x
  | Some y ->
      if Id.compare x y = 0 then y else resolve_id env y

let rewrite_id env x = resolve_id env x

let remove_bound_from_env env ids =
  List.fold_left (fun acc id -> IdMap.remove id acc) env ids

let rec rewrite_expr env = function
  | Unit -> Unit
  | Int(i) -> Int(i)
  | Float(f) -> Float(f)
  | Neg(x) -> Neg(rewrite_id env x)
  | Add(x, y) -> Add(rewrite_id env x, rewrite_id env y)
  | Sub(x, y) -> Sub(rewrite_id env x, rewrite_id env y)
  | Sll(x, y) -> Sll(rewrite_id env x, rewrite_id env y)
  | Sra(x, y) -> Sra(rewrite_id env x, rewrite_id env y)
  | FNeg(x) -> FNeg(rewrite_id env x)
  | FAdd(x, y) -> FAdd(rewrite_id env x, rewrite_id env y)
  | FSub(x, y) -> FSub(rewrite_id env x, rewrite_id env y)
  | FMul(x, y) -> FMul(rewrite_id env x, rewrite_id env y)
  | FDiv(x, y) -> FDiv(rewrite_id env x, rewrite_id env y)
  | IfEq(x, y, e1, e2) ->
      IfEq(rewrite_id env x, rewrite_id env y, rewrite_expr env e1, rewrite_expr env e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(rewrite_id env x, rewrite_id env y, rewrite_expr env e1, rewrite_expr env e2)
  | Let((x, t), e1, e2) ->
      let e1' = rewrite_expr env e1 in
      let e2' = rewrite_expr (IdMap.remove x env) e2 in
      Let((x, t), e1', e2')
  | Var(x) ->
      Var(rewrite_id env x)
  | LetRec({ name = (f, ft); args = yts; body = e1; tags = _ }, e2) ->
      let env' = remove_bound_from_env env (f :: List.map fst yts) in
      let fundef = { name = (f, ft); args = yts; body = rewrite_expr env' e1; tags = KNormal.default_tag() } in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, rewrite_expr (IdMap.remove f env) e2)
  | App(f, ys) ->
      App(rewrite_id env f, List.map (rewrite_id env) ys)
  | Tuple(xs) ->
      Tuple(List.map (rewrite_id env) xs)
  | LetTuple(xts, y, e) ->
      let env' = remove_bound_from_env env (List.map fst xts) in
      LetTuple(xts, rewrite_id env y, rewrite_expr env' e)
  | Get(x, y) ->
      Get(rewrite_id env x, rewrite_id env y)
  | Put(x, y, z) ->
      Put(rewrite_id env x, rewrite_id env y, rewrite_id env z)
  | ExtArray(x) ->
      ExtArray(x)
  | ExtFunApp(f, xs) ->
      ExtFunApp(f, List.map (rewrite_id env) xs)
  | TernPhi(c, x, y) ->
      TernPhi(rewrite_id env c, rewrite_id env x, rewrite_id env y)
  | Assign(x, y, e, tag) ->
      Assign(rewrite_id env x, rewrite_id env y, rewrite_expr env e, tag)
  | While(e1, e2) ->
      While(rewrite_expr env e1, rewrite_expr env e2)
  | Break(x) ->
      Break(rewrite_id env x)

let build_exp_table defs_in_if bindings =
  List.fold_left
    (fun tbl (((x, _), rhs) as b) ->
      if Id.is_leakable x || not (can_hoist_rhs defs_in_if rhs) then tbl
      else if ExpMap.mem rhs tbl then tbl
      else ExpMap.add rhs b tbl)
    ExpMap.empty
    bindings

let transform_if_common_lets ctor x y e1 e2 =
  let b1, tail1 = split_leading_lets e1 in
  let b2, tail2 = split_leading_lets e2 in
  let defs_in_if = S.union (collect_defined S.empty e1) (collect_defined S.empty e2) in
  let tbl1 = build_exp_table defs_in_if b1 in
  let tbl2 = build_exp_table defs_in_if b2 in

  let common_exps, _ =
    List.fold_left
      (fun (acc, seen) ((x1, _), rhs) ->
        if Id.is_leakable x1 || not (can_hoist_rhs defs_in_if rhs) then (acc, seen)
        else if (not (ExpMap.mem rhs tbl2)) || ExpSet.mem rhs seen then (acc, seen)
        else (rhs :: acc, ExpSet.add rhs seen))
      ([], ExpSet.empty)
      b1
  in
  let common_exps = List.rev common_exps in
  if common_exps = [] then
    ctor x y e1 e2
  else
    let common_set =
      List.fold_left (fun s rhs -> ExpSet.add rhs s) ExpSet.empty common_exps
    in
    let canonical_by_exp =
      List.fold_left
        (fun m rhs ->
          let ((x1, t1), rhs1) = ExpMap.find rhs tbl1 in
          ExpMap.add rhs ((x1, t1), rhs1) m)
        ExpMap.empty
        common_exps
    in
    let hoisted =
      List.map (fun rhs -> ExpMap.find rhs canonical_by_exp) common_exps
    in
    let add_aliases side_bindings env0 =
      List.fold_left
        (fun env ((xv, _), rhs) ->
          if ExpSet.mem rhs common_set then
            let ((xcanon, _), _) = ExpMap.find rhs canonical_by_exp in
            IdMap.add xv xcanon env
          else env)
        env0
        side_bindings
    in
    let alias1 = add_aliases b1 IdMap.empty in
    let alias2 = add_aliases b2 IdMap.empty in
    let keep1 = List.filter (fun (_, rhs) -> not (ExpSet.mem rhs common_set)) b1 in
    let keep2 = List.filter (fun (_, rhs) -> not (ExpSet.mem rhs common_set)) b2 in
    let body1 = rewrite_expr alias1 (wrap_lets keep1 tail1) in
    let body2 = rewrite_expr alias2 (wrap_lets keep2 tail2) in
    wrap_lets hoisted (ctor x y body1 body2)

let rec g = function
  | Let(xt, e1, e2) ->
      Let(xt, g e1, g e2)
  | LetRec({ name = xt; args = yts; body = e1; tags = _ }, e2) ->
      let fundef = { name = xt; args = yts; body = g e1; tags = KNormal.default_tag() } in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, g e2)
  | LetTuple(xts, y, e) ->
      LetTuple(xts, y, g e)
  | Assign(x, y, e, tag) ->
      Assign(x, y, g e, tag)
  | While(e1, e2) ->
      While(g e1, g e2)
  | IfEq(x, y, e1, e2) ->
      transform_if_common_lets (fun a b c d -> IfEq(a, b, c, d)) x y (g e1) (g e2)
  | IfLE(x, y, e1, e2) ->
      transform_if_common_lets (fun a b c d -> IfLE(a, b, c, d)) x y (g e1) (g e2)
  | TernPhi(c, x, y) ->
      TernPhi(c, x, y)
  | e -> e

let f e =
  g e |> Assoc.f
