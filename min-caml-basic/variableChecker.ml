
open KNormal
open Id

module M = Map.Make(struct
  type t = string
  let compare = String.compare
end)

module C = Map.Make(struct
  type t = string
  let compare = String.compare
end)

module S = Set.Make(struct
  type t = string
  let compare = String.compare
end)

module LeakM = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

module FloatM = Map.Make(struct
  type t = string
  let compare = String.compare
end)

let const_env_ref = ref C.empty
let mutable_env_ref = ref S.empty
let leakable_env_ref : bool LeakM.t ref = ref LeakM.empty
let global_use_words_ref = ref 0

let find_const x = C.find_opt x !const_env_ref
let global_use_words () = !global_use_words_ref

let leakable_env () = !leakable_env_ref

(* bool payload means "appeared in use position at least once". *)
let is_leakable_defined x =
  match LeakM.find_opt x !leakable_env_ref with
  | Some true -> true
  | _ -> false

let add_leakable_use x env =
  if Id.is_leakable x then LeakM.add x true env else env

let mark_leakable_def x env =
  if Id.is_leakable x then
    match LeakM.find_opt x env with
    | Some b -> LeakM.add x b env
    | None -> LeakM.add x false env
  else
    env

let rec collect_leakable_env env = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> env
  | Neg(x) | FNeg(x) | Var(x) | Break(x) ->
      add_leakable_use x env
  | Add(x, y) | Sub(x, y) | Sll(x, y) | Sra(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y)
  | Get(x, y) ->
      add_leakable_use y (add_leakable_use x env)
  | Put(x, y, z) ->
      add_leakable_use z (add_leakable_use y (add_leakable_use x env))
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
      let env1 = add_leakable_use y (add_leakable_use x env) in
      let env2 = collect_leakable_env env1 e1 in
      collect_leakable_env env2 e2
  | Let((x, _), e1, e2) ->
      let env1 = collect_leakable_env env e1 in
      let env2 = mark_leakable_def x env1 in
      collect_leakable_env env2 e2
  | LetRec({ name = (f, _); args; body; tags = _ }, e2) ->
      let env1 = mark_leakable_def f env in
      let env2 = List.fold_left (fun acc (a, _) -> mark_leakable_def a acc) env1 args in
      let env3 = collect_leakable_env env2 body in
      collect_leakable_env env3 e2
  | App(f, ys) ->
      List.fold_left (fun acc y -> add_leakable_use y acc) (add_leakable_use f env) ys
  | Tuple(xs) | ExtFunApp(_, xs) ->
      List.fold_left (fun acc x -> add_leakable_use x acc) env xs
  | LetTuple(xts, y, e) ->
      let env1 = add_leakable_use y env in
      let env2 = List.fold_left (fun acc (x, _) -> mark_leakable_def x acc) env1 xts in
      collect_leakable_env env2 e
  | TernPhi(c, x, y) ->
      add_leakable_use y (add_leakable_use x (add_leakable_use c env))
  | Assign(x, y, e, _) ->
      let env1 = add_leakable_use y env in
      let env2 = mark_leakable_def x env1 in
      collect_leakable_env env2 e
  | While(e1, e2) ->
      let env1 = collect_leakable_env env e1 in
      collect_leakable_env env1 e2

let recompute_leakable_env e =
  leakable_env_ref := collect_leakable_env LeakM.empty e

let replace_tag (x, t) global_env =
  let local = 
    if M.mem x global_env then Id.Global (M.find x global_env)
    else match t with
    | Id.Known(Id.Leakable, _) -> Id.Leakable
    | Id.Known(l, _) -> l
    | Id.Unknown -> Id.Local
  in
  let const =
    if S.mem x !mutable_env_ref then Id.None
    else
      match find_const x with
      | Some i -> Id.ConstInt i
      | None -> match t with
        | Id.Known(_, c) -> c
        | Id.Unknown -> Id.None
  in
  (x, Id.Known(local, const))

let get_const_tag = function
  | Int i -> Id.ConstInt i
  | Float d -> Id.ConstFloat d
  | _ -> Id.None

let float_key d = Printf.sprintf "%016Lx" (Int64.bits_of_float d)

let fresh_float_const_id d =
  let key = float_key d in
  Id.genid ("float_const_" ^ key)

let rec rewrite_float_literals e is_top_level fmap new_defs =
  match e with
  | Let((x, t), e1, e2) ->
      (match e1, is_top_level, t with
      | Float d, true, Type.Float ->
          let key = float_key d in
          let (e1'', fmap1, new_defs1) =
            match FloatM.find_opt key fmap with
            | None ->
                (Float d, FloatM.add key x fmap, new_defs)
            | Some y when y = x ->
                (Float d, fmap, new_defs)
            | Some y ->
                (Var y, fmap, new_defs)
          in
          let (e2', fmap2, new_defs2) =
            rewrite_float_literals e2 true fmap1 new_defs1
          in
          (Let((x, t), e1'', e2'), fmap2, new_defs2)
      | _ ->
          let (e1', fmap1, new_defs1) =
            rewrite_float_literals e1 false fmap new_defs
          in
          let (e2', fmap2, new_defs2) =
            rewrite_float_literals e2 is_top_level fmap1 new_defs1
          in
          (Let((x, t), e1', e2'), fmap2, new_defs2))
  | LetRec({ name = xt; args = yts; body = e1; tags = tags }, e2) ->
      let (e1', fmap1, new_defs1) =
        rewrite_float_literals e1 false fmap new_defs
      in
      let (e2', fmap2, new_defs2) =
        rewrite_float_literals e2 is_top_level fmap1 new_defs1
      in
      (LetRec({ name = xt; args = yts; body = e1'; tags = tags }, e2'), fmap2, new_defs2)
  | LetTuple(xts, y, e1) ->
      let (e1', fmap1, new_defs1) =
        rewrite_float_literals e1 is_top_level fmap new_defs
      in
      (LetTuple(xts, y, e1'), fmap1, new_defs1)
  | IfEq(x, y, e1, e2) ->
      let (e1', fmap1, new_defs1) =
        rewrite_float_literals e1 false fmap new_defs
      in
      let (e2', fmap2, new_defs2) =
        rewrite_float_literals e2 false fmap1 new_defs1
      in
      (IfEq(x, y, e1', e2'), fmap2, new_defs2)
  | IfLE(x, y, e1, e2) ->
      let (e1', fmap1, new_defs1) =
        rewrite_float_literals e1 false fmap new_defs
      in
      let (e2', fmap2, new_defs2) =
        rewrite_float_literals e2 false fmap1 new_defs1
      in
      (IfLE(x, y, e1', e2'), fmap2, new_defs2)
  | While(e1, e2) ->
      let (e1', fmap1, new_defs1) =
        rewrite_float_literals e1 false fmap new_defs
      in
      let (e2', fmap2, new_defs2) =
        rewrite_float_literals e2 false fmap1 new_defs1
      in
      (While(e1', e2'), fmap2, new_defs2)
  | Assign(x, y, e1, tag) ->
      let (e1', fmap1, new_defs1) =
        rewrite_float_literals e1 false fmap new_defs
      in
      (Assign(x, y, e1', tag), fmap1, new_defs1)
  | Float d ->
      let key = float_key d in
      (match FloatM.find_opt key fmap with
      | Some x -> (Var x, fmap, new_defs)
      | None ->
          let x = fresh_float_const_id d in
          (Var x, FloatM.add key x fmap, (x, d) :: new_defs))
  | Unit | Int(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _) | Sra(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | TernPhi(_, _, _) | Break(_) | Var(_) | App(_, _) | Tuple(_) | Get(_, _)
  | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _) ->
      (e, fmap, new_defs)

let hoist_float_literals_to_global_head e =
  let (e', _, new_defs_rev) = rewrite_float_literals e true FloatM.empty [] in
  List.fold_left
    (fun acc (x, d) -> Let((x, Type.Float), Float d, acc))
    e'
    (List.rev new_defs_rev)

let rec g e is_top_level global_env const_env global_ptr =
  match e with
  | Let(((x, tag), t), e1, e2) when is_top_level ->
    (match e1 with
    | ExtFunApp((f, _), [(sz, _); _]) when (f = "create_array" || f = "create_float_array") && C.mem sz const_env -> 
      let span = 4 * C.find sz const_env in
      let end_bytes = global_ptr + span in
      global_use_words_ref := max !global_use_words_ref ((end_bytes + 3) / 4);
      let e1' = g e1 false global_env const_env global_ptr in
      let e2' = g e2 is_top_level (M.add x global_ptr global_env) const_env (global_ptr + span) in
      Let(((x, Id.Known(Id.Global global_ptr, Id.None)), t), e1', e2')
    | _ -> 
      (match t with
      | Array _ | Tuple _ | Unit -> 
          let e1' = g e1 false global_env const_env global_ptr in
          let e2' = g e2 is_top_level global_env const_env global_ptr in
          Let(((x, Id.Known(Id.Local, Id.None)), t), e1', e2')
      | _ -> 
        let end_bytes = global_ptr + 4 in
        global_use_words_ref := max !global_use_words_ref ((end_bytes + 3) / 4);
        let e1' = g e1 false global_env const_env global_ptr in
        (match e1 with Int i -> const_env_ref := C.add x i !const_env_ref | _ -> ());
        let e2' = g e2 is_top_level (M.add x global_ptr global_env) const_env (global_ptr + 4) in
        let const_tag = get_const_tag e1 in
        Let(((x, Id.Known(Id.Global global_ptr, const_tag)), t), e1', e2')
      ))
  | Let(((x, tag), t), e1, e2) ->
      let e1' = g e1 false global_env const_env global_ptr in
      let e2' = g e2 false global_env const_env global_ptr in
      let local = match tag with
        | Id.Known(Id.Leakable, _) -> Id.Leakable
        | _ -> Id.Local
      in
      Let(((x, Id.Known(local, Id.None)), t), e1', e2')
  | LetRec({ name = (x, t); args = yts; body = e1; tags = tags }, e2) ->
      let e1' = g e1 false global_env const_env global_ptr in
      let e2' = g e2 is_top_level global_env const_env global_ptr in
      LetRec({ name = (x, t); args = yts; body = e1'; tags = tags }, e2')
  | LetTuple(xts, y, e) ->
      let e' = g e is_top_level global_env const_env global_ptr in
      LetTuple(xts, replace_tag y global_env, e')
  
  | Unit -> Unit
  | Int(i) -> Int(i)
  | Float(d) -> Float(d)
  | Neg(x) -> Neg(replace_tag x global_env)
  | Add(x, y) -> Add(replace_tag x global_env, replace_tag y global_env)
  | Sub(x, y) -> Sub(replace_tag x global_env, replace_tag y global_env)
  | Sll(x, y) -> Sll(replace_tag x global_env, replace_tag y global_env)
  | Sra(x, y) -> Sra(replace_tag x global_env, replace_tag y global_env)
  | FNeg(x) -> FNeg(replace_tag x global_env)
  | FAdd(x, y) -> FAdd(replace_tag x global_env, replace_tag y global_env)
  | FSub(x, y) -> FSub(replace_tag x global_env, replace_tag y global_env)
  | FMul(x, y) -> FMul(replace_tag x global_env, replace_tag y global_env)
  | FDiv(x, y) -> FDiv(replace_tag x global_env, replace_tag y global_env)
  | IfEq(x, y, e1, e2) -> 
      IfEq(replace_tag x global_env, replace_tag y global_env, 
           g e1 false global_env const_env global_ptr, 
           g e2 false global_env const_env global_ptr)
  | IfLE(x, y, e1, e2) ->
      IfLE(replace_tag x global_env, replace_tag y global_env, 
           g e1 false global_env const_env global_ptr, 
           g e2 false global_env const_env global_ptr)
  | While(e1, e2) ->
      While(
        g e1 false global_env const_env global_ptr,
        g e2 false global_env const_env global_ptr)
  | Assign(x, y, e, tag) ->
      Assign(
        replace_tag x global_env,
        replace_tag y global_env,
        g e false global_env const_env global_ptr,
        tag)
  | TernPhi(c, x, y) ->
      TernPhi(replace_tag c global_env, replace_tag x global_env, replace_tag y global_env)
  | Break(x) -> Break(replace_tag x global_env)
  | Var(x) -> Var(replace_tag x global_env)
  | App(x, ys) -> App(replace_tag x global_env, List.map (fun y -> replace_tag y global_env) ys)
  | Tuple(xs) -> Tuple(List.map (fun x -> replace_tag x global_env) xs)
  | Get(x, y) -> Get(replace_tag x global_env, replace_tag y global_env)
  | Put(x, y, z) -> Put(replace_tag x global_env, replace_tag y global_env, replace_tag z global_env)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(x, ys) -> ExtFunApp(x, List.map (fun y -> replace_tag y global_env) ys)

let rec get_const_env e const_env =
  match e with
  | Let((x, _), e1, e2) ->
    let const_env = get_const_env e1 const_env in
    let const_env =
      if S.mem (fst x) !mutable_env_ref then C.remove (fst x) const_env
      else
        match e1 with
        | Int(i) -> C.add (fst x) i const_env
        | Var(y) when C.mem (fst y) const_env -> C.add (fst x) (C.find (fst y) const_env) const_env
        | _ -> const_env
    in
    get_const_env e2 const_env
  | LetRec({ name = (_, _); args = _; body = e1; tags = _ }, e2) ->
    let const_env = get_const_env e1 const_env in
    get_const_env e2 const_env
  | LetTuple(_, _, e) ->
    get_const_env e const_env
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
    let const_env = get_const_env e1 const_env in
    get_const_env e2 const_env
  | While(e1, e2) ->
    let const_env = get_const_env e1 const_env in
    get_const_env e2 const_env
  | Assign(x, _, e, _) ->
    get_const_env e (C.remove (fst x) const_env)
  | TernPhi(_, _, _) ->
    const_env
  | Break(_) -> const_env
  | _ -> const_env

let rec get_mutable_env e acc =
  match e with
  | Assign(x, _, e2, _) ->
    get_mutable_env e2 (S.add (fst x) acc)
  | TernPhi(_, _, _) ->
    acc
  | Let((_, _), e1, e2)
  | IfEq(_, _, e1, e2)
  | IfLE(_, _, e1, e2)
  | While(e1, e2)
  | LetRec({ name = (_, _); args = _; body = e1; tags = _ }, e2) ->
    let acc' = get_mutable_env e1 acc in
    get_mutable_env e2 acc'
  | LetTuple(_, _, e1) ->
    get_mutable_env e1 acc
  | _ -> acc

let f e =
  global_use_words_ref := 0;
  let e = hoist_float_literals_to_global_head e in
  mutable_env_ref := get_mutable_env e S.empty;
  let const_env = get_const_env e C.empty in
  const_env_ref := S.fold C.remove !mutable_env_ref const_env;
  recompute_leakable_env e;
  g e true M.empty const_env 0
