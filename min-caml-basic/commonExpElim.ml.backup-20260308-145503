open KNormal

let rec expr_to_list t =
  let f2i f = Int32.to_int (Int32.bits_of_float f) in
  let s2i (s : string) : int = Hashtbl.hash s in
  match t with
  | Unit -> [0]
  | Int x -> [1; x]
  | Float f -> [2; f2i f]
  | Neg x -> [3; s2i (Id.to_string x)]
  | Add (x, y) -> [4; s2i (Id.to_string x); s2i (Id.to_string y)]
  | Sub (x, y) -> [5; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FNeg x -> [6; s2i (Id.to_string x)]
  | FAdd (x, y) -> [7; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FSub (x, y) -> [8; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FMul (x, y) -> [9; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FDiv (x, y) -> [10; s2i (Id.to_string x); s2i (Id.to_string y)]
  | IfEq (x, y, e1, e2) -> [11; s2i (Id.to_string x); s2i (Id.to_string y)] @ expr_to_list e1 @ expr_to_list e2
  | IfLE (x, y, e1, e2) -> [12; s2i (Id.to_string x); s2i (Id.to_string y)] @ expr_to_list e1 @ expr_to_list e2
  | Let (x, e1, e2) -> [13; s2i (Id.to_string (fst x))] @ expr_to_list e1 @ expr_to_list e2
  | Var x -> [14; s2i (Id.to_string x)]
  | LetRec (f, e) -> [15; s2i (Id.to_string (fst f.name))] @ expr_to_list f.body @ expr_to_list e
  | App (f, xs) -> [16; s2i (Id.to_string f); List.length xs] @ List.map (fun x -> s2i (Id.to_string x)) xs
  | Tuple xs -> [17; List.length xs] @ List.map (fun x -> s2i (Id.to_string x)) xs
  | LetTuple (xts, y, e) -> [18; List.length xts; s2i (Id.to_string y)] @ expr_to_list e
  | Put (x, y, z) -> [19; s2i (Id.to_string x); s2i (Id.to_string y); s2i (Id.to_string z)]
  | Get (x, y) -> [20; s2i (Id.to_string x); s2i (Id.to_string y)]
  | ExtArray x -> [21; s2i (Id.to_string x)]
  | ExtFunApp (f, xs) -> [22; s2i (Id.to_string f); List.length xs] @ List.map (fun x -> s2i (Id.to_string x)) xs
  | Sll (x, y) -> [23; s2i (Id.to_string x); s2i (Id.to_string y)]
  | Sra (x, y) -> [24; s2i (Id.to_string x); s2i (Id.to_string y)]
  | TernPhi (c, x, y) -> [25; s2i (Id.to_string c); s2i (Id.to_string x); s2i (Id.to_string y)]
  | Assign (x, y, e, tag) ->
      let tag_i =
        match tag with
        | AssignWhile -> 0
        | AssignArray -> 1
      in
      [26; tag_i; s2i (Id.to_string x); s2i (Id.to_string y)] @ expr_to_list e
  | While (e1, e2) -> [27] @ expr_to_list e1 @ expr_to_list e2
  | Break x -> [28; s2i (Id.to_string x)]

let compare_expr e1 e2 =
  let l1 = expr_to_list e1 in
  let l2 = expr_to_list e2 in
  compare l1 l2

module ExprMap = Map.Make (struct
  type t = KNormal.t
  let compare = compare_expr
end)

module IdMap = Map.Make (struct
  type t = Id.t
  let compare = Id.compare
end)

module IdSet = Set.Make (struct
  type t = Id.t
  let compare = Id.compare
end)

module IntMap = Map.Make (struct
  type t = int
  let compare = Stdlib.compare
end)

type const_val = CInt of int | CFloat of float
type const_env_t = const_val IdMap.t
type get_cache_t = Id.t IntMap.t IdMap.t

type state = {
  const_env : const_env_t;
  cse_env : Id.t ExprMap.t;
  alias_fwd : IdSet.t IdMap.t;
  alias_rev : IdSet.t IdMap.t;
  get_cache : get_cache_t;
}

let empty_state = {
  const_env = IdMap.empty;
  cse_env = ExprMap.empty;
  alias_fwd = IdMap.empty;
  alias_rev = IdMap.empty;
  get_cache = IdMap.empty;
}

let simplify_expr (const_env : const_env_t) e =
  let counter = ref 0 in
  let fresh () =
    let n = !counter in
    counter := n + 1;
    (Printf.sprintf "v%d" n, Id.Unknown)
  in
  let rename env x =
    match IdMap.find_opt x const_env with
    | Some (CInt i) -> (Printf.sprintf "CONST_INT_%d" i, Id.Unknown)
    | Some (CFloat f) -> (Printf.sprintf "CONST_FLOAT_%d" (Int32.to_int (Int32.bits_of_float f)), Id.Unknown)
    | None ->
        (match IdMap.find_opt x env with
         | Some x' -> x'
         | None -> x)
  in
  let rec helper env e =
    match e with
    | Var x when IdMap.mem x const_env ->
        (match IdMap.find x const_env with
         | CInt i -> KNormal.Int i
         | CFloat f -> KNormal.Float f)
    | _ ->
        (match e with
         | Unit -> Unit
         | Int i -> Int i
         | Float f -> Float f
         | Neg x -> Neg (rename env x)
         | Add (x, y) -> Add (rename env x, rename env y)
         | Sub (x, y) -> Sub (rename env x, rename env y)
         | Sll (x, y) -> Sll (rename env x, rename env y)
         | Sra (x, y) -> Sra (rename env x, rename env y)
         | FNeg x -> FNeg (rename env x)
         | FAdd (x, y) -> FAdd (rename env x, rename env y)
         | FSub (x, y) -> FSub (rename env x, rename env y)
         | FMul (x, y) -> FMul (rename env x, rename env y)
         | FDiv (x, y) -> FDiv (rename env x, rename env y)
         | Var x -> Var (rename env x)
         | IfEq (x, y, e1, e2) -> IfEq (rename env x, rename env y, helper env e1, helper env e2)
         | IfLE (x, y, e1, e2) -> IfLE (rename env x, rename env y, helper env e1, helper env e2)
         | Let ((x, t), e1, e2) ->
             let e1' = helper env e1 in
             let x' = fresh () in
             let env' = IdMap.add x x' env in
             Let ((x', t), e1', helper env' e2)
         | LetRec ({ name = (f, ft); args = yts; body = body; tags = tags }, e2) ->
             let f' = fresh () in
             let env' = IdMap.add f f' env in
             let yts', env'' =
               List.fold_left
                 (fun (acc, env_acc) (y, yt) ->
                   let y' = fresh () in
                   (acc @ [ (y', yt) ], IdMap.add y y' env_acc))
                 ([], env') yts
             in
             let body' = helper env'' body in
             LetRec ({ name = (f', ft); args = yts'; body = body'; tags = tags }, helper env' e2)
         | App (f, xs) -> App (rename env f, List.map (rename env) xs)
         | Tuple xs -> Tuple (List.map (rename env) xs)
         | LetTuple (xts, y, e2) ->
             let xts', env' =
               List.fold_left
                 (fun (acc, env_acc) (x, xt) ->
                   let x' = fresh () in
                   (acc @ [ (x', xt) ], IdMap.add x x' env_acc))
                 ([], env) xts
             in
             LetTuple (xts', rename env y, helper env' e2)
         | Get (x, y) -> Get (rename env x, rename env y)
         | Put (x, y, z) -> Put (rename env x, rename env y, rename env z)
         | ExtArray x -> ExtArray x
         | ExtFunApp (f, xs) -> ExtFunApp (f, List.map (rename env) xs)
         | TernPhi (c, x, y) -> TernPhi (rename env c, rename env x, rename env y)
         | Assign (x, y, e2, tag) -> Assign (x, rename env y, helper env e2, tag)
         | While (e1, e2) -> While (helper env e1, helper env e2)
         | Break x -> Break (rename env x))
  in
  helper IdMap.empty e

let is_simple_expr e =
  match e with
  | Unit | Int _ | Var _ | Float _ -> false
  | _ -> true

let get_const_int const_env x =
  match IdMap.find_opt x const_env with
  | Some (CInt i) -> Some i
  | _ -> None

let update_const_env const_env x rhs =
  match rhs with
  | Int i -> IdMap.add x (CInt i) const_env
  | Float f -> IdMap.add x (CFloat f) const_env
  | Var y ->
      (match IdMap.find_opt y const_env with
       | Some c -> IdMap.add x c const_env
       | None -> IdMap.remove x const_env)
  | _ -> IdMap.remove x const_env

let remove_cse_value x cse_env =
  ExprMap.filter (fun _ v -> Id.compare v x <> 0) cse_env

let cache_lookup cache base off =
  match IdMap.find_opt base cache with
  | Some im -> IntMap.find_opt off im
  | None -> None

let cache_set cache base off value =
  let im =
    match IdMap.find_opt base cache with
    | Some m -> m
    | None -> IntMap.empty
  in
  IdMap.add base (IntMap.add off value im) cache

let cache_remove_offset cache base off =
  match IdMap.find_opt base cache with
  | None -> cache
  | Some im ->
      let im' = IntMap.remove off im in
      if IntMap.is_empty im' then IdMap.remove base cache else IdMap.add base im' cache

let cache_remove_base cache base =
  IdMap.remove base cache

let cache_remove_value cache value =
  IdMap.fold
    (fun base im acc ->
      let im' = IntMap.filter (fun _ v -> Id.compare v value <> 0) im in
      if IntMap.is_empty im' then acc else IdMap.add base im' acc)
    cache IdMap.empty

let cache_intersect c1 c2 =
  IdMap.fold
    (fun base im1 acc ->
      match IdMap.find_opt base c2 with
      | None -> acc
      | Some im2 ->
          let im' =
            IntMap.fold
              (fun off v1 acc_im ->
                match IntMap.find_opt off im2 with
                | Some v2 when Id.compare v1 v2 = 0 -> IntMap.add off v1 acc_im
                | _ -> acc_im)
              im1 IntMap.empty
          in
          if IntMap.is_empty im' then acc else IdMap.add base im' acc)
    c1 IdMap.empty

let add_set_map m key value =
  let s =
    match IdMap.find_opt key m with
    | Some s -> s
    | None -> IdSet.empty
  in
  IdMap.add key (IdSet.add value s) m

let remove_set_map m key value =
  match IdMap.find_opt key m with
  | None -> m
  | Some s ->
      let s' = IdSet.remove value s in
      if IdSet.is_empty s' then IdMap.remove key m else IdMap.add key s' m

let alias_add_edge alias_fwd alias_rev src dst =
  if Id.compare src dst = 0 then (alias_fwd, alias_rev)
  else
    let alias_fwd' = add_set_map alias_fwd src dst in
    let alias_rev' = add_set_map alias_rev dst src in
    (alias_fwd', alias_rev')

let alias_drop_node alias_fwd alias_rev x =
  let alias_fwd1, alias_rev1 =
    match IdMap.find_opt x alias_fwd with
    | None -> (alias_fwd, alias_rev)
    | Some out_s ->
        let alias_fwd' = IdMap.remove x alias_fwd in
        let alias_rev' = IdSet.fold (fun dst acc -> remove_set_map acc dst x) out_s alias_rev in
        (alias_fwd', alias_rev')
  in
  match IdMap.find_opt x alias_rev1 with
  | None -> (alias_fwd1, alias_rev1)
  | Some in_s ->
      let alias_rev2 = IdMap.remove x alias_rev1 in
      let alias_fwd2 = IdSet.fold (fun src acc -> remove_set_map acc src x) in_s alias_fwd1 in
      (alias_fwd2, alias_rev2)

let alias_single_target alias_fwd x =
  match IdMap.find_opt x alias_fwd with
  | Some s when IdSet.cardinal s = 1 -> Some (IdSet.choose s)
  | _ -> None

let alias_rev_closure alias_rev start =
  let rec dfs work visited =
    match work with
    | [] -> visited
    | x :: xs when IdSet.mem x visited -> dfs xs visited
    | x :: xs ->
        let preds =
          match IdMap.find_opt x alias_rev with
          | Some s -> IdSet.elements s
          | None -> []
        in
        dfs (preds @ xs) (IdSet.add x visited)
  in
  dfs [start] IdSet.empty

let alias_intersect a1 a2 =
  IdMap.fold
    (fun src s1 acc ->
      match IdMap.find_opt src a2 with
      | None -> acc
      | Some s2 ->
          let s = IdSet.inter s1 s2 in
          if IdSet.is_empty s then acc else IdMap.add src s acc)
    a1 IdMap.empty

let rebuild_alias_rev alias_fwd =
  IdMap.fold
    (fun src dsts acc -> IdSet.fold (fun dst acc2 -> add_set_map acc2 dst src) dsts acc)
    alias_fwd IdMap.empty

let intersect_const_env c1 c2 =
  IdMap.fold
    (fun x v1 acc ->
      match IdMap.find_opt x c2 with
      | Some v2 when v1 = v2 -> IdMap.add x v1 acc
      | _ -> acc)
    c1 IdMap.empty

let intersect_cse_env e1 e2 =
  ExprMap.fold
    (fun expr x1 acc ->
      match ExprMap.find_opt expr e2 with
      | Some x2 when Id.compare x1 x2 = 0 -> ExprMap.add expr x1 acc
      | _ -> acc)
    e1 ExprMap.empty

let merge_state s1 s2 =
  let alias_fwd = alias_intersect s1.alias_fwd s2.alias_fwd in
  {
    const_env = intersect_const_env s1.const_env s2.const_env;
    cse_env = intersect_cse_env s1.cse_env s2.cse_env;
    alias_fwd;
    alias_rev = rebuild_alias_rev alias_fwd;
    get_cache = cache_intersect s1.get_cache s2.get_cache;
  }

let drop_var_state st x =
  let alias_fwd, alias_rev = alias_drop_node st.alias_fwd st.alias_rev x in
  {
    const_env = IdMap.remove x st.const_env;
    cse_env = remove_cse_value x st.cse_env;
    alias_fwd;
    alias_rev;
    get_cache = cache_remove_value (cache_remove_base st.get_cache x) x;
  }

let rec collect_alias_targets e =
  match e with
  | Var y -> IdSet.singleton y
  | ExtArray y -> IdSet.singleton y
  | TernPhi (_, x, y) -> IdSet.of_list [x; y]
  | IfEq (_, _, e1, e2) | IfLE (_, _, e1, e2) -> IdSet.union (collect_alias_targets e1) (collect_alias_targets e2)
  | Let (_, _, e2) | LetTuple (_, _, e2) | Assign (_, _, e2, _) -> collect_alias_targets e2
  | _ -> IdSet.empty

let add_alias_targets st x targets =
  let alias_fwd, alias_rev =
    IdSet.fold
      (fun y (fwd, rev) -> alias_add_edge fwd rev x y)
      targets (st.alias_fwd, st.alias_rev)
  in
  { st with alias_fwd; alias_rev }

let add_get_cache_for_binding st x rhs =
  match rhs with
  | Get (base, idx) ->
      (match get_const_int st.const_env idx with
       | None -> st
       | Some off ->
           let c1 = cache_set st.get_cache base off x in
           let c2 =
             match alias_single_target st.alias_fwd base with
             | Some only_dst -> cache_set c1 only_dst off x
             | None -> c1
           in
           { st with get_cache = c2 })
  | _ -> st

let bind_let st x t rhs add_cse simp_rhs =
  let st0 = drop_var_state st x in
  let cse_env = if add_cse then ExprMap.add simp_rhs x st0.cse_env else st0.cse_env in
  let st1 = { st0 with const_env = update_const_env st0.const_env x rhs; cse_env } in
  let st2 =
    match t with
    | Type.Array _ -> add_alias_targets st1 x (collect_alias_targets rhs)
    | _ -> st1
  in
  add_get_cache_for_binding st2 x rhs

let invalidate_get_cache_by_put st base idx =
  let affected = alias_rev_closure st.alias_rev base in
  let cache' =
    match get_const_int st.const_env idx with
    | Some off -> IdSet.fold (fun a acc -> cache_remove_offset acc a off) affected st.get_cache
    | None -> IdSet.fold (fun a acc -> cache_remove_base acc a) affected st.get_cache
  in
  { st with get_cache = cache' }

let invalidate_unknown_memory_effect st =
  { st with get_cache = IdMap.empty }

let rec g st e =
  match e with
  | Let ((x, t), e1, e2) ->
      let e1', st_after_e1 = g st e1 in
      let simp_e1 = simplify_expr st_after_e1.const_env e1' in
      let rhs, st_for_e2 =
        match ExprMap.find_opt simp_e1 st_after_e1.cse_env with
        | Some x' ->
            let rhs = Var x' in
            (rhs, bind_let st_after_e1 x t rhs false simp_e1)
        | None ->
            let add_cse = is_simple_expr e1' && FunctionChecker.checkExpPurity e1' in
            (e1', bind_let st_after_e1 x t e1' add_cse simp_e1)
      in
      let e2', st_after_e2 = g st_for_e2 e2 in
      (Let ((x, t), rhs, e2'), drop_var_state st_after_e2 x)
  | IfEq (x, y, e1, e2) ->
      let e1', st1 = g st e1 in
      let e2', st2 = g st e2 in
      (IfEq (x, y, e1', e2'), merge_state st1 st2)
  | IfLE (x, y, e1, e2) ->
      let e1', st1 = g st e1 in
      let e2', st2 = g st e2 in
      (IfLE (x, y, e1', e2'), merge_state st1 st2)
  | LetTuple (xs, y, e2) ->
      let st_body = List.fold_left (fun acc (x, _) -> drop_var_state acc x) st xs in
      let e2', st_after = g st_body e2 in
      let st_out = List.fold_left (fun acc (x, _) -> drop_var_state acc x) st_after xs in
      (LetTuple (xs, y, e2'), st_out)
  | LetRec ({ name = (x, t); args = yts; body = e1; tags = _ }, e2) ->
      let body_const_env = List.fold_left (fun acc (y, _) -> IdMap.remove y acc) st.const_env yts in
      let body_st = { empty_state with const_env = body_const_env } in
      let body', _ = g body_st e1 in
      let fundef' = { name = (x, t); args = yts; body = body'; tags = KNormal.default_tag () } in
      FunctionChecker.registerFunctionDef fundef';
      let e2', st_after_e2 = g (drop_var_state st x) e2 in
      (LetRec (fundef', e2'), drop_var_state st_after_e2 x)
  | Assign (x, y, e2, tag) ->
      let st1 = drop_var_state st x in
      let st1 =
        let alias_fwd, alias_rev = alias_add_edge st1.alias_fwd st1.alias_rev x y in
        { st1 with cse_env = ExprMap.empty; alias_fwd; alias_rev }
      in
      let e2', st2 = g st1 e2 in
      (Assign (x, y, e2', tag), st2)
  | While (e1, e2) ->
      let cond_st = { st with cse_env = ExprMap.empty; alias_fwd = IdMap.empty; alias_rev = IdMap.empty; get_cache = IdMap.empty } in
      let body_st = { empty_state with const_env = IdMap.empty } in
      let e1', _ = g cond_st e1 in
      let e2', _ = g body_st e2 in
      let st_out = { st with const_env = IdMap.empty; cse_env = ExprMap.empty; alias_fwd = IdMap.empty; alias_rev = IdMap.empty; get_cache = IdMap.empty } in
      (While (e1', e2'), st_out)
  | Put (base, idx, z) ->
      (Put (base, idx, z), invalidate_get_cache_by_put st base idx)
  | Get (base, idx) ->
      (match get_const_int st.const_env idx with
       | Some off ->
           (match cache_lookup st.get_cache base off with
            | Some v -> (Var v, st)
            | None -> (Get (base, idx), st))
       | None -> (Get (base, idx), st))
  | App _ | ExtFunApp _ ->
      if FunctionChecker.checkExpPurity e then (e, st)
      else (e, invalidate_unknown_memory_effect st)
  | Break x -> (Break x, st)
  | _ ->
      let e_simp = simplify_expr st.const_env e in
      (match ExprMap.find_opt e_simp st.cse_env with
       | Some x' -> (Var x', st)
       | None -> (e, st))

let f e =
  fst (g empty_state e)
