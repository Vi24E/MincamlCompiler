open KNormal

type scan_result = {
  tail_calls : int;
  has_invalid_use : bool;
}

let empty_scan = { tail_calls = 0; has_invalid_use = false }

let merge_scan a b =
  {
    tail_calls = a.tail_calls + b.tail_calls;
    has_invalid_use = a.has_invalid_use || b.has_invalid_use;
  }

let mark_invalid r = { r with has_invalid_use = true }

let uses_id name x = Id.compare name x = 0
let same_id x y = Id.compare x y = 0

let rec scan_self_usage name tail_pos = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> empty_scan
  | Neg(x) | FNeg(x) ->
      if uses_id name x then mark_invalid empty_scan else empty_scan
  | Add(x, y) | Sub(x, y) | Sll(x, y) | Sra(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y)
  | Get(x, y) ->
      if uses_id name x || uses_id name y then mark_invalid empty_scan else empty_scan
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
      let here =
        if uses_id name x || uses_id name y then mark_invalid empty_scan else empty_scan
      in
      merge_scan here
        (merge_scan (scan_self_usage name tail_pos e1) (scan_self_usage name tail_pos e2))
  | Let((x, _), e1, e2) ->
      let e1_tail = tail_pos && (match e2 with Var(y) when same_id x y -> true | _ -> false) in
      let r1 = scan_self_usage name e1_tail e1 in
      let r2 = scan_self_usage name tail_pos e2 in
      merge_scan r1 r2
  | Var(x) ->
      if uses_id name x then mark_invalid empty_scan else empty_scan
  | LetRec({ name = (_, _); args = _; body = e1; tags = _ }, e2) ->
      let r1 = scan_self_usage name false e1 in
      let r2 = scan_self_usage name tail_pos e2 in
      merge_scan r1 r2
  | App(f, ys) ->
      if uses_id name f then
        if tail_pos then { tail_calls = 1; has_invalid_use = false }
        else { tail_calls = 0; has_invalid_use = true }
      else if List.exists (uses_id name) ys then
        mark_invalid empty_scan
      else
        empty_scan
  | Tuple(xs) | ExtFunApp(_, xs) ->
      if List.exists (uses_id name) xs then mark_invalid empty_scan else empty_scan
  | Put(x, y, z) ->
      if uses_id name x || uses_id name y || uses_id name z then
        mark_invalid empty_scan
      else
        empty_scan
  | LetTuple(xts, y, e) ->
      let here =
        if uses_id name y then mark_invalid empty_scan else empty_scan
      in
      let shadowed = List.exists (fun (x, _) -> uses_id name x) xts in
      if shadowed then here else merge_scan here (scan_self_usage name tail_pos e)
  | Assign(x, y, e, _) ->
      let here =
        if uses_id name x || uses_id name y then mark_invalid empty_scan else empty_scan
      in
      merge_scan here (scan_self_usage name tail_pos e)
  | TernPhi(c, x, y) ->
      if uses_id name c || uses_id name x || uses_id name y then mark_invalid empty_scan else empty_scan
  | While(e1, e2) ->
      merge_scan (scan_self_usage name false e1) (scan_self_usage name false e2)
  | Break(x) ->
      if uses_id name x then mark_invalid empty_scan else empty_scan

let can_loopize_fundef ({ name = (f, _); args = _; body; tags = _ } : fundef) =
  let r = scan_self_usage f true body in
  r.tail_calls > 0 && not r.has_invalid_use

let with_break ret_t e =
  let br = Id.gentmp ret_t in
  Let((br, ret_t), e, Break(br))

let build_parallel_assign args ys cont =
  if List.length args <> List.length ys then
    None
  else
    let tmps =
      List.map2
        (fun (_arg, t) y ->
          let tmp = Id.gentmp t in
          (tmp, t, y))
        args ys
    in
    let after_assign =
      List.fold_right2
        (fun (arg, _t) (tmp, _tmp_t, _y) acc -> Assign(arg, tmp, acc, AssignWhile))
        args
        tmps
        cont
    in
    let with_loads =
      List.fold_right
        (fun (tmp, t, y) acc -> Let((tmp, t), Var(y), acc))
        tmps
        after_assign
    in
    Some with_loads

let rec transform_tail name args ret_t tail_pos = function
  | IfEq(x, y, e1, e2) ->
      IfEq
        ( x,
          y,
          transform_tail name args ret_t tail_pos e1,
          transform_tail name args ret_t tail_pos e2 )
  | IfLE(x, y, e1, e2) ->
      IfLE
        ( x,
          y,
          transform_tail name args ret_t tail_pos e1,
          transform_tail name args ret_t tail_pos e2 )
  | Let((x, _), e1, Var(y)) when tail_pos && same_id x y ->
      transform_tail name args ret_t true e1
  | Let(xt, e1, e2) ->
      Let(xt, transform_tail name args ret_t false e1, transform_tail name args ret_t tail_pos e2)
  | LetRec({ name = xt; args = yts; body = e1; tags = tags }, e2) ->
      LetRec(
        { name = xt; args = yts; body = transform_tail name args ret_t false e1; tags },
        transform_tail name args ret_t tail_pos e2)
  | LetTuple(xts, y, e) ->
      LetTuple(xts, y, transform_tail name args ret_t tail_pos e)
  | Assign(x, y, e, tag) ->
      Assign(x, y, transform_tail name args ret_t tail_pos e, tag)
  | TernPhi(c, x, y) ->
      TernPhi(c, x, y)
  | While(e1, e2) ->
      While(transform_tail name args ret_t false e1, transform_tail name args ret_t false e2)
  | App(f, ys) when tail_pos && uses_id name f ->
      (match build_parallel_assign args ys Unit with
      | Some e -> e
      | None -> with_break ret_t (App(f, ys)))
  | e when tail_pos ->
      with_break ret_t (transform_tail name args ret_t false e)
  | e -> e

let rec visit = function
  | LetRec({ name = (f, ft); args = yts; body = e1; tags } as fundef, e2) ->
      let body' = visit e1 in
      let e2' = visit e2 in
      if can_loopize_fundef { fundef with body = body' } then
        let ret_t =
          match ft with
          | Type.Fun(_, rt) -> rt
          | _ -> Type.Unit
        in
        let loop_body = transform_tail f yts ret_t true body' in
        LetRec({ name = (f, ft); args = yts; body = While(Int(1), loop_body); tags }, e2')
      else
        LetRec({ name = (f, ft); args = yts; body = body'; tags }, e2')
  | Let(xt, e1, e2) -> Let(xt, visit e1, visit e2)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, visit e1, visit e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, visit e1, visit e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, visit e)
  | Assign(x, y, e, tag) -> Assign(x, y, visit e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(e1, e2) -> While(visit e1, visit e2)
  | e -> e

let f e = visit e
