open KNormal

module IdMap = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

let threshold = ref 500

let subst_id subst x =
  match IdMap.find_opt x subst with
  | Some y -> y
  | None -> x

let rec remove_keys subst = function
  | [] -> subst
  | k :: ks -> remove_keys (IdMap.remove k subst) ks

let rec subst_expr subst = function
  | Unit -> Unit
  | Int(i) -> Int(i)
  | Float(f) -> Float(f)
  | Neg(x) -> Neg(subst_id subst x)
  | Add(x, y) -> Add(subst_id subst x, subst_id subst y)
  | Sub(x, y) -> Sub(subst_id subst x, subst_id subst y)
  | Sll(x, y) -> Sll(subst_id subst x, subst_id subst y)
  | Sra(x, y) -> Sra(subst_id subst x, subst_id subst y)
  | FNeg(x) -> FNeg(subst_id subst x)
  | FAdd(x, y) -> FAdd(subst_id subst x, subst_id subst y)
  | FSub(x, y) -> FSub(subst_id subst x, subst_id subst y)
  | FMul(x, y) -> FMul(subst_id subst x, subst_id subst y)
  | FDiv(x, y) -> FDiv(subst_id subst x, subst_id subst y)
  | IfEq(x, y, e1, e2) ->
      IfEq(subst_id subst x, subst_id subst y, subst_expr subst e1, subst_expr subst e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(subst_id subst x, subst_id subst y, subst_expr subst e1, subst_expr subst e2)
  | Let((x, t), e1, e2) ->
      let e1' = subst_expr subst e1 in
      let e2' = subst_expr (IdMap.remove x subst) e2 in
      Let((x, t), e1', e2')
  | Var(x) -> Var(subst_id subst x)
  | LetRec({ name = (f, ft); args = yts; body = body; tags = tags }, e2) ->
      let body_subst = remove_keys (IdMap.remove f subst) (List.map fst yts) in
      let body' = subst_expr body_subst body in
      let e2' = subst_expr (IdMap.remove f subst) e2 in
      LetRec({ name = (f, ft); args = yts; body = body'; tags = tags }, e2')
  | App(f, xs) -> App(subst_id subst f, List.map (subst_id subst) xs)
  | Tuple(xs) -> Tuple(List.map (subst_id subst) xs)
  | LetTuple(xts, y, e) ->
      let subst' = remove_keys subst (List.map fst xts) in
      LetTuple(xts, subst_id subst y, subst_expr subst' e)
  | Get(x, y) -> Get(subst_id subst x, subst_id subst y)
  | Put(x, y, z) -> Put(subst_id subst x, subst_id subst y, subst_id subst z)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(f, xs) -> ExtFunApp(f, List.map (subst_id subst) xs)
  | TernPhi(c, x, y) -> TernPhi(subst_id subst c, subst_id subst x, subst_id subst y)
  | Assign(x, y, e, tag) ->
      (* Assignment kills the previous substituted value of x. *)
      Assign(x, subst_id subst y, subst_expr (IdMap.remove x subst) e, tag)
  | While(e1, e2) -> While(subst_expr subst e1, subst_expr subst e2)
  | Break(x) -> Break(subst_id subst x)

let rec collect_assign_chain acc = function
  | Assign(x, y, e, AssignWhile) -> collect_assign_chain ((x, y) :: acc) e
  | e -> (List.rev acc, e)

let subst_map_of_assign_tail tail =
  let assigns, last = collect_assign_chain [] tail in
  if assigns = [] then None
  else
    match last with
    | Unit ->
        Some (List.fold_left (fun m (x, y) -> IdMap.add x y m) IdMap.empty assigns)
    | _ -> None

let rec rewrite_continue_branch while_body = function
  | Let(xt, e1, e2) ->
      (match rewrite_continue_branch while_body e2 with
      | Some e2' -> Some(Let(xt, e1, e2'))
      | None -> None)
  | IfEq(x, y, e1, e2) ->
      (match rewrite_continue_branch while_body e1 with
      | Some e1' -> Some(IfEq(x, y, e1', e2))
      | None ->
          (match rewrite_continue_branch while_body e2 with
          | Some e2' -> Some(IfEq(x, y, e1, e2'))
          | None -> None))
  | IfLE(x, y, e1, e2) ->
      (match rewrite_continue_branch while_body e1 with
      | Some e1' -> Some(IfLE(x, y, e1', e2))
      | None ->
          (match rewrite_continue_branch while_body e2 with
          | Some e2' -> Some(IfLE(x, y, e1, e2'))
          | None -> None))
  | tail ->
      (match subst_map_of_assign_tail tail with
      | Some subst ->
          let fresh_body = Alpha.f while_body in
          Some(subst_expr subst fresh_body)
      | None -> None)

let unroll_once_in_body while_body =
  let rec go = function
    | Let(xt, e1, e2) -> Let(xt, e1, go e2)
    | IfEq(x, y, e1, e2) ->
        let e1' =
          match rewrite_continue_branch while_body e1 with
          | Some u -> u
          | None -> e1
        in
        let e2' =
          match rewrite_continue_branch while_body e2 with
          | Some u -> u
          | None -> e2
        in
        IfEq(x, y, e1', e2')
    | IfLE(x, y, e1, e2) ->
        let e1' =
          match rewrite_continue_branch while_body e1 with
          | Some u -> u
          | None -> e1
        in
        let e2' =
          match rewrite_continue_branch while_body e2 with
          | Some u -> u
          | None -> e2
        in
        IfLE(x, y, e1', e2')
    | e -> e
  in
  go while_body

let rec unroll_while_body_until_threshold body =
  if Inline.size body > !threshold then body
  else
    let body' = unroll_once_in_body body in
    if body = body' then body
    else if Inline.size body' > !threshold then body
    else unroll_while_body_until_threshold body'

let rec g = function
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g e1, g e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g e1, g e2)
  | Let(xt, e1, e2) -> Let(xt, g e1, g e2)
  | LetRec({ name = xt; args = yts; body = e1; tags = tags }, e2) ->
      LetRec({ name = xt; args = yts; body = g e1; tags = tags }, g e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, g e)
  | Assign(x, y, e, tag) -> Assign(x, y, g e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(Int(1), body) ->
      let body' = g body in
      While(Int(1), unroll_while_body_until_threshold body')
  | While(e1, e2) -> While(g e1, g e2)
  | e -> e

let f e =
  g e
