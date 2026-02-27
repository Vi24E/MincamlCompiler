open KNormal

type usage = {
  mutable bad : bool;
  mutable touched : bool;
}

let max_size = ref 8

let same_id x y = Id.compare x y = 0

let const_int_of_id = function
  | (_, Id.Known(_, Id.ConstInt i)) -> Some i
  | _ -> None

let is_create_array = function
  | ("create_array", _) | ("create_float_array", _) -> true
  | _ -> false

let mark_bad_if_target usage target x =
  if same_id x target then usage.bad <- true

let add_const_index usage size = function
  | Some i when 0 <= i && i < size ->
      usage.touched <- true
  | _ -> usage.bad <- true

let rec contains_target target = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> false
  | Neg(x) | FNeg(x) -> same_id x target
  | Add(x, y) | Sub(x, y) | Sll(x, y) | Sra(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y)
  | Get(x, y) -> same_id x target || same_id y target
  | Put(x, y, z) -> same_id x target || same_id y target || same_id z target
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
      same_id x target || same_id y target
      || contains_target target e1 || contains_target target e2
  | Let((x, _), e1, e2) ->
      same_id x target || contains_target target e1 || contains_target target e2
  | Var(x) -> same_id x target
  | LetRec({ name = (f, _); args; body; tags = _ }, e2) ->
      same_id f target
      || List.exists (fun (arg, _) -> same_id arg target) args
      || contains_target target body
      || contains_target target e2
  | App(f, ys) ->
      same_id f target || List.exists (fun y -> same_id y target) ys
  | Tuple(xs) | ExtFunApp(_, xs) ->
      List.exists (fun x -> same_id x target) xs
  | LetTuple(xts, y, e) ->
      List.exists (fun (x, _) -> same_id x target) xts
      || same_id y target
      || contains_target target e
  | Assign(x, y, e) ->
      same_id x target || same_id y target || contains_target target e
  | While(e1, e2) ->
      contains_target target e1 || contains_target target e2
  | Break(x) -> same_id x target

let rec scan_usage usage target size e =
  match e with
  | Unit | Int(_) | Float(_) | ExtArray(_) -> ()
  | Neg(x) | FNeg(x) ->
      mark_bad_if_target usage target x
  | Add(x, y) | Sub(x, y) | Sll(x, y) | Sra(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) ->
      mark_bad_if_target usage target x;
      mark_bad_if_target usage target y
  | Get(x, y) ->
      if same_id x target then add_const_index usage size (const_int_of_id y);
      mark_bad_if_target usage target y
  | Put(x, y, z) ->
      if same_id x target then add_const_index usage size (const_int_of_id y);
      mark_bad_if_target usage target y;
      mark_bad_if_target usage target z
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
      mark_bad_if_target usage target x;
      mark_bad_if_target usage target y;
      scan_usage usage target size e1;
      scan_usage usage target size e2
  | Let((x, _), e1, e2) ->
      mark_bad_if_target usage target x;
      scan_usage usage target size e1;
      scan_usage usage target size e2
  | Var(x) ->
      mark_bad_if_target usage target x
  | LetRec({ name = (f, _); args; body; tags = _ }, e2) ->
      mark_bad_if_target usage target f;
      List.iter (fun (arg, _) -> mark_bad_if_target usage target arg) args;
      if contains_target target body then usage.bad <- true;
      scan_usage usage target size e2
  | App(f, ys) ->
      mark_bad_if_target usage target f;
      List.iter (mark_bad_if_target usage target) ys
  | Tuple(xs) | ExtFunApp(_, xs) ->
      List.iter (mark_bad_if_target usage target) xs
  | LetTuple(xts, y, e1) ->
      List.iter (fun (x, _) -> mark_bad_if_target usage target x) xts;
      mark_bad_if_target usage target y;
      scan_usage usage target size e1
  | Assign(x, y, e1) ->
      mark_bad_if_target usage target x;
      mark_bad_if_target usage target y;
      scan_usage usage target size e1
  | While(e1, e2) ->
      scan_usage usage target size e1;
      scan_usage usage target size e2
  | Break(x) ->
      mark_bad_if_target usage target x

let can_scalarize target size e =
  let usage = { bad = false; touched = false } in
  scan_usage usage target size e;
  (not usage.bad) && usage.touched

let rec rewrite_expr target elem_t slots size e =
  match e with
  | Unit -> Unit
  | Int(i) -> Int(i)
  | Float(d) -> Float(d)
  | Neg(x) -> Neg(x)
  | Add(x, y) -> Add(x, y)
  | Sub(x, y) -> Sub(x, y)
  | Sll(x, y) -> Sll(x, y)
  | Sra(x, y) -> Sra(x, y)
  | FNeg(x) -> FNeg(x)
  | FAdd(x, y) -> FAdd(x, y)
  | FSub(x, y) -> FSub(x, y)
  | FMul(x, y) -> FMul(x, y)
  | FDiv(x, y) -> FDiv(x, y)
  | IfEq(x, y, e1, e2) ->
      IfEq(x, y, rewrite_expr target elem_t slots size e1, rewrite_expr target elem_t slots size e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(x, y, rewrite_expr target elem_t slots size e1, rewrite_expr target elem_t slots size e2)
  | Let((x, t), e1, e2) ->
      Let((x, t), rewrite_expr target elem_t slots size e1, rewrite_expr target elem_t slots size e2)
  | Var(x) -> Var(x)
  | LetRec({ name = (f, ft); args; body; tags }, e2) ->
      LetRec(
        { name = (f, ft); args; body = rewrite_expr target elem_t slots size body; tags },
        rewrite_expr target elem_t slots size e2)
  | App(f, ys) -> App(f, ys)
  | Tuple(xs) -> Tuple(xs)
  | LetTuple(xts, y, e1) ->
      LetTuple(xts, y, rewrite_expr target elem_t slots size e1)
  | Get(x, y) when same_id x target ->
      (match const_int_of_id y with
      | Some idx when 0 <= idx && idx < size -> Var(slots.(idx))
      | _ -> Get(x, y))
  | Get(x, y) -> Get(x, y)
  | Put(x, y, z) when same_id x target ->
      (match const_int_of_id y with
      | Some idx when 0 <= idx && idx < size -> Assign(slots.(idx), z, Unit)
      | _ -> Put(x, y, z))
  | Put(x, y, z) -> Put(x, y, z)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(f, ys) -> ExtFunApp(f, ys)
  | Assign(x, y, e1) ->
      Assign(x, y, rewrite_expr target elem_t slots size e1)
  | While(e1, e2) ->
      While(rewrite_expr target elem_t slots size e1, rewrite_expr target elem_t slots size e2)
  | Break(x) -> Break(x)

let initialize_slots elem_t init slots body =
  Array.fold_right
    (fun slot acc -> Let((slot, elem_t), Var(init), acc))
    slots
    body

let rec g e =
  match e with
  | Let((x, t), e1, e2) ->
      let e1' = g e1 in
      let e2' = g e2 in
      (match e1', t with
      | ExtFunApp(fn, [size_id; init]), Type.Array(elem_t) when is_create_array fn ->
          (match const_int_of_id size_id with
          | Some size when 0 <= size && size <= !max_size && can_scalarize x size e2' ->
							Format.eprintf "Array %s can be scalarized (size: %d)@." (Id.to_string x) size;
              let init_slots = Array.init size (fun _ -> Id.gentmp elem_t) in
              let body' = rewrite_expr x elem_t init_slots size e2' in
              initialize_slots elem_t init init_slots body'
          | _ ->
              Let((x, t), e1', e2'))
      | _ ->
          Let((x, t), e1', e2'))
  | LetRec({ name = (f, ft); args; body; tags }, e2) ->
      let body' = g body in
      let fundef' = { name = (f, ft); args; body = body'; tags } in
      FunctionChecker.registerFunctionDef fundef';
      LetRec(fundef', g e2)
  | IfEq(x, y, e1, e2) ->
      IfEq(x, y, g e1, g e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(x, y, g e1, g e2)
  | LetTuple(xts, y, e1) ->
      LetTuple(xts, y, g e1)
  | Assign(x, y, e1) ->
      Assign(x, y, g e1)
  | While(e1, e2) ->
      While(g e1, g e2)
  | _ -> e

let f e = g e
