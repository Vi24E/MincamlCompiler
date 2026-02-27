open KNormal

module IntSet = Set.Make(struct
  type t = int
  let compare = compare
end)

module IntMap = Map.Make(struct
  type t = int
  let compare = compare
end)

type arg_state = {
  elem_t : Type.t;
  mutable bad : bool;
  mutable idxs : IntSet.t;
}

type scalar_plan = {
  arg : Id.t;
  elem_t : Type.t;
  entries : (int * Id.t) list;
}

let max_indices = ref 8

let const_int_of_id = function
  | (_, Id.Known(_, Id.ConstInt i)) -> Some i
  | _ -> None

let mark_bad states x =
  match M.find_opt x states with
  | Some st -> st.bad <- true
  | None -> ()

let remove_keys m keys =
  List.fold_left (fun acc k -> M.remove k acc) m keys

let rec scan states = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> ()
  | Neg(x) | FNeg(x) ->
      mark_bad states x
  | Add(x, y) | Sub(x, y) | Sll(x, y) | Sra(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) ->
      mark_bad states x;
      mark_bad states y
  | Get(x, y) ->
      (match M.find_opt x states with
      | Some st ->
          (match const_int_of_id y with
          | Some i -> st.idxs <- IntSet.add i st.idxs
          | None -> st.bad <- true)
      | None -> ());
      mark_bad states y
  | Put(x, y, z) ->
      mark_bad states x;
      mark_bad states y;
      mark_bad states z
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
      mark_bad states x;
      mark_bad states y;
      scan states e1;
      scan states e2
  | Let((x, _), e1, e2) ->
      scan states e1;
      scan (M.remove x states) e2
  | Var(x) ->
      mark_bad states x
  | LetRec({ name = (f, _); args = yts; body = e1; tags = _ }, e2) ->
      let states_body = remove_keys states (f :: List.map fst yts) in
      scan states_body e1;
      scan (M.remove f states) e2
  | App(f, ys) ->
      mark_bad states f;
      List.iter (mark_bad states) ys
  | Tuple(xs) | ExtFunApp(_, xs) ->
      List.iter (mark_bad states) xs
  | LetTuple(xts, y, e) ->
      mark_bad states y;
      scan (remove_keys states (List.map fst xts)) e
  | Assign(x, y, e) ->
      mark_bad states x;
      mark_bad states y;
      scan states e
  | While(e1, e2) ->
      scan states e1;
      scan states e2
  | Break(x) ->
      mark_bad states x

let analyze_fundef ({ args; body; _ } : fundef) =
  let init_states =
    List.fold_left
      (fun acc (x, t) ->
        match t with
        | Type.Array(elem_t) ->
            M.add x { elem_t; bad = false; idxs = IntSet.empty } acc
        | _ -> acc)
      M.empty
      args
  in
  scan init_states body;
  List.fold_left
    (fun acc (x, _t) ->
      match M.find_opt x init_states with
      | Some st when (not st.bad) && (not (IntSet.is_empty st.idxs))
                     && IntSet.cardinal st.idxs <= !max_indices ->
          let entries =
            IntSet.elements st.idxs
            |> List.map (fun i -> (i, Id.gentmp st.elem_t))
          in
          { arg = x; elem_t = st.elem_t; entries } :: acc
      | _ -> acc)
    []
    args
  |> List.rev

let build_rewrite_map plans =
  List.fold_left
    (fun acc plan ->
      let im =
        List.fold_left
          (fun m (idx, tmp) -> IntMap.add idx tmp m)
          IntMap.empty
          plan.entries
      in
      M.add plan.arg im acc)
    M.empty
    plans

let rec rewrite_get maps = function
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
      IfEq(x, y, rewrite_get maps e1, rewrite_get maps e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(x, y, rewrite_get maps e1, rewrite_get maps e2)
  | Let((x, t), e1, e2) ->
      Let((x, t), rewrite_get maps e1, rewrite_get (M.remove x maps) e2)
  | Var(x) -> Var(x)
  | LetRec({ name = (f, ft); args = yts; body = e1; tags }, e2) ->
      let maps_body = remove_keys maps (f :: List.map fst yts) in
      LetRec(
        { name = (f, ft); args = yts; body = rewrite_get maps_body e1; tags },
        rewrite_get (M.remove f maps) e2)
  | App(f, ys) -> App(f, ys)
  | Tuple(xs) -> Tuple(xs)
  | LetTuple(xts, y, e) ->
      LetTuple(xts, y, rewrite_get (remove_keys maps (List.map fst xts)) e)
  | Get(x, y) ->
      (match const_int_of_id y, M.find_opt x maps with
      | Some idx, Some im ->
          (match IntMap.find_opt idx im with
          | Some tmp -> Var(tmp)
          | None -> Get(x, y))
      | _ -> Get(x, y))
  | Put(x, y, z) -> Put(x, y, z)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(f, ys) -> ExtFunApp(f, ys)
  | Assign(x, y, e) -> Assign(x, y, rewrite_get maps e)
  | While(e1, e2) -> While(rewrite_get maps e1, rewrite_get maps e2)
  | Break(x) -> Break(x)

let insert_loads plans body =
  List.fold_right
    (fun plan acc ->
      List.fold_right
        (fun (idx, tmp) acc2 ->
          let ci = Id.gentmp Type.Int in
          Let((ci, Type.Int), Int(idx), Let((tmp, plan.elem_t), Get(plan.arg, ci), acc2)))
        plan.entries
        acc)
    plans
    body

let scalarize_fundef ({ name; args; body; tags } : fundef) =
  let plans = analyze_fundef { name; args; body; tags } in
  if plans = [] then
    { name; args; body; tags }
  else
    let maps = build_rewrite_map plans in
    let body' = rewrite_get maps body in
    { name; args; body = insert_loads plans body'; tags }

let rec g = function
  | LetRec({ name; args; body; tags } as fundef, e2) ->
      let body' = g body in
      let fundef' = scalarize_fundef { fundef with body = body' } in
      FunctionChecker.registerFunctionDef fundef';
      LetRec(fundef', g e2)
  | Let(xt, e1, e2) ->
      Let(xt, g e1, g e2)
  | IfEq(x, y, e1, e2) ->
      IfEq(x, y, g e1, g e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(x, y, g e1, g e2)
  | LetTuple(xts, y, e) ->
      LetTuple(xts, y, g e)
  | Assign(x, y, e) ->
      Assign(x, y, g e)
  | While(e1, e2) ->
      While(g e1, g e2)
  | e -> e

let f e = g e
