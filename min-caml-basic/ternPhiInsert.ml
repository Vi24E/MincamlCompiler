open KNormal

module IdMap = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

module IdSet = Set.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

type subst = Id.t IdMap.t

type post_binding = (Id.t * Type.t) * KNormal.t

type rewrite_out = {
  expr : KNormal.t;
  subst_out : subst;
  post : post_binding list;
}

let trace_seq = ref 0
let trace_events : string list ref = ref []
let trace_limit = 20000
let trace_event_count = ref 0
let phi_threshold = Config.TernPhiInsert.phi_threshold
let trace_enabled_flag = Config.TernPhiInsert.trace_enabled
let ternphi_fallback_enabled = Config.TernPhiInsert.fallback_enabled

let trace_enabled () =
  !trace_enabled_flag

let trace_log msg =
  if trace_enabled () && !trace_event_count < trace_limit then begin
    trace_events := msg :: !trace_events
    ; incr trace_event_count
  end

let trace_flush () =
  if trace_enabled () then begin
    let events = List.rev !trace_events in
    let path = Printf.sprintf "test/minrt.ternphi.trace.%03d" !trace_seq in
    incr trace_seq;
    let ch = open_out path in
    List.iter (fun line -> output_string ch line; output_char ch '\n') events;
    close_out ch;
    Format.eprintf "TernPhiInsert: dumped trace to %s (events=%d)@." path (List.length events)
  end

let lookup_subst subst x =
  let rec aux seen v =
    if IdSet.mem v seen then
      v
    else
      match IdMap.find_opt v subst with
      | Some v' when Id.compare v v' <> 0 ->
          aux (IdSet.add v seen) v'
      | _ ->
          v
  in
  aux IdSet.empty x

let add_subst subst x y =
  if Id.compare x y = 0 then IdMap.remove x subst else IdMap.add x y subst

let wrap_post_before post body =
  List.fold_right (fun (xt, e1) acc -> Let(xt, e1, acc)) post body

(* Append an expression chain at the tail of a K-normal form expression.
   This preserves scoping so that variables defined in the outer expression
   remain visible in the appended chain. *)
let rec append_at_tail chain = function
  | Let(xt, e1, e2) -> Let(xt, e1, append_at_tail chain e2)
  | LetRec(fd, e2) -> LetRec(fd, append_at_tail chain e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, append_at_tail chain e)
  | Assign(x, y, e, tag) -> Assign(x, y, append_at_tail chain e, tag)
  | e ->
      (* e is a terminal expression (Unit, Var, Int, etc.).
         Replace it with: Let(tmp, e, chain) *)
      let tmp = Id.gentmp Type.Unit in
      Let((tmp, Type.Unit), e, chain)

let rec expr_uses_any ids = function
  | Unit | Int(_) | Float(_) | ExtArray(_) -> false
  | Neg(x) | FNeg(x) | Var(x) | Break(x) -> IdSet.mem x ids
  | Add(x, y) | Sub(x, y) | Sll(x, y) | Sra(x, y)
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y)
  | Get(x, y) ->
      IdSet.mem x ids || IdSet.mem y ids
  | Put(x, y, z) ->
      IdSet.mem x ids || IdSet.mem y ids || IdSet.mem z ids
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) ->
      IdSet.mem x ids || IdSet.mem y ids || expr_uses_any ids e1 || expr_uses_any ids e2
  | Let((x, _), e1, e2) ->
      IdSet.mem x ids || expr_uses_any ids e1 || expr_uses_any ids e2
  | LetRec({ name = (f, _); args; body; _ }, e2) ->
      IdSet.mem f ids
      || List.exists (fun (a, _) -> IdSet.mem a ids) args
      || expr_uses_any ids body
      || expr_uses_any ids e2
  | App(f, ys) ->
      IdSet.mem f ids || List.exists (fun y -> IdSet.mem y ids) ys
  | Tuple(xs) | ExtFunApp(_, xs) ->
      List.exists (fun x -> IdSet.mem x ids) xs
  | LetTuple(xts, y, e) ->
      List.exists (fun (x, _) -> IdSet.mem x ids) xts
      || IdSet.mem y ids
      || expr_uses_any ids e
  | TernPhi(c, x, y) ->
      IdSet.mem c ids || IdSet.mem x ids || IdSet.mem y ids
  | Assign(x, y, e, _) ->
      IdSet.mem x ids || IdSet.mem y ids || expr_uses_any ids e
  | While(e1, e2) ->
      expr_uses_any ids e1 || expr_uses_any ids e2

let drop_scope_from_subst ids subst =
  IdMap.fold
    (fun k v acc ->
      if IdSet.mem k ids || IdSet.mem v ids then acc else IdMap.add k v acc)
    subst
    IdMap.empty

let rec infer_type env = function
  | Unit -> Type.Unit
  | Int(_) -> Type.Int
  | Float(_) -> Type.Float
  | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _) | Sra(_, _) -> Type.Int
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _) -> Type.Float
  | IfEq(_, _, e1, _) | IfLE(_, _, e1, _) -> infer_type env e1
  | Let((x, t), _, e2) -> infer_type (IdMap.add x t env) e2
  | Var(x) ->
      (match IdMap.find_opt x env with
      | Some t -> t
      | None -> Type.Int)
  | LetRec({ name = (_, ft); _ }, e2) ->
      (match ft with
      | Type.Fun(_, _) -> infer_type env e2
      | _ -> infer_type env e2)
  | App(f, _) ->
      (match IdMap.find_opt f env with
      | Some(Type.Fun(_, rt)) -> rt
      | _ -> Type.Int)
  | Tuple(xs) ->
      Type.Tuple(
        List.map
          (fun x ->
            match IdMap.find_opt x env with
            | Some t -> t
            | None -> Type.Int)
          xs)
  | LetTuple(xts, _, e2) ->
      infer_type (List.fold_left (fun acc (x, t) -> IdMap.add x t acc) env xts) e2
  | Get(x, _) ->
      (match IdMap.find_opt x env with
      | Some(Type.Array(t)) -> t
      | _ -> Type.Int)
  | Put(_, _, _) -> Type.Unit
  | ExtArray(_) -> Type.Array(Type.Int)
  | ExtFunApp((name, _), _) ->
      (match M.find_opt (name, Id.Unknown) !Typing.extenv with
      | Some(Type.Fun(_, rt)) -> rt
      | Some t -> t
      | None -> Type.Int)
  | TernPhi(_, x, _) ->
      (match IdMap.find_opt x env with
      | Some t -> t
      | None -> Type.Int)
  | Assign(_, _, e, _) -> infer_type env e
  | While(_, _) -> Type.Unit
  | Break(_) -> Type.Unit

let append_post env expr post =
  match post with
  | [] -> expr
  | _ ->
      let t = infer_type env expr in
      let tmp = Id.gentmp t in
      Let((tmp, t), expr, wrap_post_before post (Var(tmp)))

let make_cond_var_if_eq x y =
  let c = Id.genid "phi_cond" in
  ((c, Type.Int), IfEq(x, y, Int(1), Int(0)), c)

let make_cond_var_if_le x y =
  let c = Id.genid "phi_cond" in
  ((c, Type.Int), IfLE(x, y, Int(1), Int(0)), c)

let merge_keys m1 m2 m3 =
  let add_keys m acc =
    IdMap.fold (fun k _ s -> IdSet.add k s) m acc
  in
  add_keys m3 (add_keys m2 (add_keys m1 IdSet.empty))

let find_type_default env x =
  match IdMap.find_opt x env with
  | Some t -> t
  | None -> Type.Int

let rec has_assign_array = function
  | Assign(_, _, _, AssignArray) -> true
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | While(e1, e2) ->
      has_assign_array e1 || has_assign_array e2
  | LetRec({ body; _ }, e2) -> has_assign_array body || has_assign_array e2
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> has_assign_array e
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _) | Sra(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_) | Var(_) | App(_, _)
  | Tuple(_) | Get(_, _) | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _) | Break(_)
  | TernPhi(_, _, _) ->
      false

let get_phi_threshold () =
  !phi_threshold

let use_fallback_join cont_size then_expr else_expr =
  if !ternphi_fallback_enabled then
    let s = cont_size + Inline.size then_expr + Inline.size else_expr in
    s >= get_phi_threshold ()
  else
    false

let rec may_fallthrough = function
  | Break(_) -> false
  | Let(_, _, e) | Assign(_, _, e, _) -> may_fallthrough e
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      may_fallthrough e1 || may_fallthrough e2
  | LetRec(_, _) | LetTuple(_, _, _) | While(_, _) ->
      true
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _) | Sra(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _) | Var(_)
  | App(_, _) | Tuple(_) | Get(_, _) | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _)
  | TernPhi(_, _, _) ->
      true

(* Collect all slot variables targeted by Assign(x, _, _, AssignArray) in an expression *)
let rec collect_assign_array_targets acc = function
  | Assign(x, _, _, AssignArray) -> IdSet.add x acc
  | Assign(_, _, e, _) -> collect_assign_array_targets acc e
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | While(e1, e2) ->
      collect_assign_array_targets (collect_assign_array_targets acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_assign_array_targets (collect_assign_array_targets acc body) e2
  | LetTuple(_, _, e) -> collect_assign_array_targets acc e
  | _ -> acc

let rec rewrite ?(cont_size=0) ?(in_while=false) env subst e =
  match e with
  | Unit -> { expr = Unit; subst_out = subst; post = [] }
  | Int(i) -> { expr = Int(i); subst_out = subst; post = [] }
  | Float(d) -> { expr = Float(d); subst_out = subst; post = [] }
  | Neg(x) -> { expr = Neg(lookup_subst subst x); subst_out = subst; post = [] }
  | Add(x, y) -> { expr = Add(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | Sub(x, y) -> { expr = Sub(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | Sll(x, y) -> { expr = Sll(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | Sra(x, y) -> { expr = Sra(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | FNeg(x) -> { expr = FNeg(lookup_subst subst x); subst_out = subst; post = [] }
  | FAdd(x, y) -> { expr = FAdd(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | FSub(x, y) -> { expr = FSub(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | FMul(x, y) -> { expr = FMul(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | FDiv(x, y) -> { expr = FDiv(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | Var(x) -> { expr = Var(lookup_subst subst x); subst_out = subst; post = [] }
  | App(f, ys) ->
      {
        expr = App(lookup_subst subst f, List.map (lookup_subst subst) ys);
        subst_out = subst;
        post = [];
      }
  | Tuple(xs) ->
      { expr = Tuple(List.map (lookup_subst subst) xs); subst_out = subst; post = [] }
  | Get(x, y) ->
      { expr = Get(lookup_subst subst x, lookup_subst subst y); subst_out = subst; post = [] }
  | Put(x, y, z) ->
      {
        expr = Put(lookup_subst subst x, lookup_subst subst y, lookup_subst subst z);
        subst_out = subst;
        post = [];
      }
  | ExtArray(x) -> { expr = ExtArray(x); subst_out = subst; post = [] }
  | ExtFunApp(f, ys) ->
      { expr = ExtFunApp(f, List.map (lookup_subst subst) ys); subst_out = subst; post = [] }
  | TernPhi(c, x, y) ->
      {
        expr = TernPhi(lookup_subst subst c, lookup_subst subst x, lookup_subst subst y);
        subst_out = subst;
        post = [];
      }
  | Let((x, t), e1, e2) ->
      let out1 = rewrite ~cont_size:(cont_size + Inline.size e2) ~in_while env subst e1 in
      let env2 = IdMap.add x t env in
      let subst2 = IdMap.remove x out1.subst_out in
      let out2 = rewrite ~cont_size ~in_while env2 subst2 e2 in
      let e2_scoped = append_post env2 out2.expr out2.post in
      let e2' = wrap_post_before out1.post e2_scoped in
      let scope_ids = IdSet.singleton x in
      {
        expr = Let((x, t), out1.expr, e2');
        subst_out = drop_scope_from_subst scope_ids out2.subst_out;
        post = [];
      }
  | LetRec({ name = (f, ft); args; body; tags }, e2) ->
      let env_body =
        List.fold_left (fun acc (a, t) -> IdMap.add a t acc) (IdMap.add f ft env) args
      in
      let out_body = rewrite ~in_while:false env_body IdMap.empty body in
      let body' = append_post env_body out_body.expr out_body.post in
      let fundef' = { name = (f, ft); args; body = body'; tags } in
      FunctionChecker.registerFunctionDef fundef';
      let out2 = rewrite ~cont_size ~in_while (IdMap.add f ft env) (IdMap.remove f subst) e2 in
      let e2_scoped = append_post (IdMap.add f ft env) out2.expr out2.post in
      let scope_ids = IdSet.singleton f in
      {
        expr = LetRec(fundef', e2_scoped);
        subst_out = drop_scope_from_subst scope_ids out2.subst_out;
        post = [];
      }
  | LetTuple(xts, y, e2) ->
      let env2 = List.fold_left (fun acc (x, t) -> IdMap.add x t acc) env xts in
      let out2 = rewrite ~cont_size ~in_while env2 subst e2 in
      let e2_scoped = append_post env2 out2.expr out2.post in
      let scope_ids =
        List.fold_left (fun acc (x, _) -> IdSet.add x acc) IdSet.empty xts
      in
      {
        expr = LetTuple(xts, lookup_subst subst y, e2_scoped);
        subst_out = drop_scope_from_subst scope_ids out2.subst_out;
        post = [];
      }
  | IfEq(x, y, e_then, e_else) ->
      let x' = lookup_subst subst x in
      let y' = lookup_subst subst y in
      let out_then = rewrite ~cont_size ~in_while env subst e_then in
      let out_else = rewrite ~cont_size ~in_while env subst e_else in
      let then_expr = append_post env out_then.expr out_then.post in
      let else_expr = append_post env out_else.expr out_else.post in
      let fall_then = may_fallthrough then_expr in
      let fall_else = may_fallthrough else_expr in
      if (not fall_then) && (not fall_else) then
        { expr = IfEq(x', y', then_expr, else_expr); subst_out = subst; post = [] }
      else if fall_then && (not fall_else) then
        { expr = IfEq(x', y', then_expr, else_expr); subst_out = out_then.subst_out; post = [] }
      else if (not fall_then) && fall_else then
        { expr = IfEq(x', y', then_expr, else_expr); subst_out = out_else.subst_out; post = [] }
      else
      let keys = merge_keys subst out_then.subst_out out_else.subst_out in
      let join_subst = ref subst in
      let phi_bindings_rev = ref [] in
      let branch_bindings_rev = ref [] in
      IdSet.iter
        (fun v ->
          let vt_raw = lookup_subst out_then.subst_out v in
          let ve_raw = lookup_subst out_else.subst_out v in
          let vt = vt_raw in
          let ve = ve_raw in
          if Id.compare vt ve = 0 then
            join_subst := add_subst !join_subst v vt
          else begin
            let tv = find_type_default env v in
            let nv = let (n, _) = Id.genid (Id.to_string v ^ "_phi") in (n, Id.Known(Id.Leakable, Id.None)) in
            trace_log
              (Printf.sprintf
                 "phi IfEq: v=%s new=%s then=%s else=%s"
                (Id.to_string v) (Id.to_string nv) (Id.to_string vt) (Id.to_string ve));
            join_subst := IdMap.add v nv !join_subst;
            phi_bindings_rev := ((nv, tv), TernPhi(("", Id.Unknown), vt, ve)) :: !phi_bindings_rev;
            branch_bindings_rev := (nv, tv, vt, ve) :: !branch_bindings_rev
          end)
        keys;
      if use_fallback_join cont_size then_expr else_expr then
        let branch_bindings = List.rev !branch_bindings_rev in
        let then_post =
          List.map
            (fun (nv, tv, vt, _) -> ((nv, tv), Var(vt)))
            branch_bindings
        in
        let else_post =
          List.map
            (fun (nv, tv, _, ve) -> ((nv, tv), Var(ve)))
            branch_bindings
        in
        let then_expr' = append_post env then_expr then_post in
        let else_expr' = append_post env else_expr else_post in
        trace_log
          (Printf.sprintf
             "fallback IfEq: threshold=%d size=%d bindings=%d"
             (get_phi_threshold ())
             (cont_size + Inline.size then_expr + Inline.size else_expr)
             (List.length branch_bindings));
        { expr = IfEq(x', y', then_expr', else_expr'); subst_out = !join_subst; post = [] }
      else
        let branch_bindings = List.rev !branch_bindings_rev in
        let prepared_bindings =
          List.map
            (fun (nv, tv, vt, ve) ->
              let then_v = let (n, _) = Id.genid (Id.to_string nv) in (n, Id.Known(Id.Leakable, Id.None)) in
              let else_v = let (n, _) = Id.genid (Id.to_string nv) in (n, Id.Known(Id.Leakable, Id.None)) in
              (nv, tv, vt, ve, then_v, else_v))
            branch_bindings
        in
        let then_post =
          List.map
            (fun (_, tv, vt, _, then_v, _) -> ((then_v, tv), Var(vt)))
            prepared_bindings
        in
        let else_post =
          List.map
            (fun (_, tv, _, ve, _, else_v) -> ((else_v, tv), Var(ve)))
            prepared_bindings
        in
        let then_expr' = append_post env then_expr then_post in
        let else_expr' = append_post env else_expr else_post in
        let post =
          match prepared_bindings with
          | [] -> []
          | _ ->
              let ((cond_xt, cond_e), cond_id) =
                let ((c, t), econd, cid) = make_cond_var_if_eq x' y' in
                (((c, t), econd), cid)
              in
              let phi_bindings =
                List.map
                  (fun (nv, tv, _vt, _ve, then_v, else_v) ->
                    ((nv, tv), TernPhi(cond_id, then_v, else_v)))
                  prepared_bindings
              in
              (cond_xt, cond_e) :: phi_bindings
        in
        { expr = IfEq(x', y', then_expr', else_expr'); subst_out = !join_subst; post }
  | IfLE(x, y, e_then, e_else) ->
      let x' = lookup_subst subst x in
      let y' = lookup_subst subst y in
      let out_then = rewrite ~cont_size ~in_while env subst e_then in
      let out_else = rewrite ~cont_size ~in_while env subst e_else in
      let then_expr = append_post env out_then.expr out_then.post in
      let else_expr = append_post env out_else.expr out_else.post in
      let fall_then = may_fallthrough then_expr in
      let fall_else = may_fallthrough else_expr in
      if (not fall_then) && (not fall_else) then
        { expr = IfLE(x', y', then_expr, else_expr); subst_out = subst; post = [] }
      else if fall_then && (not fall_else) then
        { expr = IfLE(x', y', then_expr, else_expr); subst_out = out_then.subst_out; post = [] }
      else if (not fall_then) && fall_else then
        { expr = IfLE(x', y', then_expr, else_expr); subst_out = out_else.subst_out; post = [] }
      else
      let keys = merge_keys subst out_then.subst_out out_else.subst_out in
      let join_subst = ref subst in
      let phi_bindings_rev = ref [] in
      let branch_bindings_rev = ref [] in
      IdSet.iter
        (fun v ->
          let vt_raw = lookup_subst out_then.subst_out v in
          let ve_raw = lookup_subst out_else.subst_out v in
          let vt = vt_raw in
          let ve = ve_raw in
          if Id.compare vt ve = 0 then
            join_subst := add_subst !join_subst v vt
          else begin
            let tv = find_type_default env v in
            let nv = let (n, _) = Id.genid (Id.to_string v ^ "_phi") in (n, Id.Known(Id.Leakable, Id.None)) in
            trace_log
              (Printf.sprintf
                 "phi IfLE: v=%s new=%s then=%s else=%s"
                (Id.to_string v) (Id.to_string nv) (Id.to_string vt) (Id.to_string ve));
            join_subst := IdMap.add v nv !join_subst;
            phi_bindings_rev := ((nv, tv), TernPhi(("", Id.Unknown), vt, ve)) :: !phi_bindings_rev;
            branch_bindings_rev := (nv, tv, vt, ve) :: !branch_bindings_rev
          end)
        keys;
      if use_fallback_join cont_size then_expr else_expr then
        let branch_bindings = List.rev !branch_bindings_rev in
        let then_post =
          List.map
            (fun (nv, tv, vt, _) -> ((nv, tv), Var(vt)))
            branch_bindings
        in
        let else_post =
          List.map
            (fun (nv, tv, _, ve) -> ((nv, tv), Var(ve)))
            branch_bindings
        in
        let then_expr' = append_post env then_expr then_post in
        let else_expr' = append_post env else_expr else_post in
        trace_log
          (Printf.sprintf
             "fallback IfLE: threshold=%d size=%d bindings=%d"
             (get_phi_threshold ())
             (cont_size + Inline.size then_expr + Inline.size else_expr)
             (List.length branch_bindings));
        { expr = IfLE(x', y', then_expr', else_expr'); subst_out = !join_subst; post = [] }
      else
        let branch_bindings = List.rev !branch_bindings_rev in
        let prepared_bindings =
          List.map
            (fun (nv, tv, vt, ve) ->
              let then_v = let (n, _) = Id.genid (Id.to_string nv) in (n, Id.Known(Id.Leakable, Id.None)) in
              let else_v = let (n, _) = Id.genid (Id.to_string nv) in (n, Id.Known(Id.Leakable, Id.None)) in
              (nv, tv, vt, ve, then_v, else_v))
            branch_bindings
        in
        let then_post =
          List.map
            (fun (_, tv, vt, _, then_v, _) -> ((then_v, tv), Var(vt)))
            prepared_bindings
        in
        let else_post =
          List.map
            (fun (_, tv, _, ve, _, else_v) -> ((else_v, tv), Var(ve)))
            prepared_bindings
        in
        let then_expr' = append_post env then_expr then_post in
        let else_expr' = append_post env else_expr else_post in
        let post =
          match prepared_bindings with
          | [] -> []
          | _ ->
              let ((cond_xt, cond_e), cond_id) =
                let ((c, t), econd, cid) = make_cond_var_if_le x' y' in
                (((c, t), econd), cid)
              in
              let phi_bindings =
                List.map
                  (fun (nv, tv, _vt, _ve, then_v, else_v) ->
                    ((nv, tv), TernPhi(cond_id, then_v, else_v)))
                  prepared_bindings
              in
              (cond_xt, cond_e) :: phi_bindings
        in
        { expr = IfLE(x', y', then_expr', else_expr'); subst_out = !join_subst; post }
  | Assign(x, y, Unit, AssignArray) ->
      let rhs = lookup_subst subst y in
      if in_while then begin
        (* Inside while: keep mutable semantics only, no SSA rename.
           The mutable slot is updated directly, and subsequent Var(x)
           reads from the mutable variable (loop-carried dependency). *)
        trace_log
          (Printf.sprintf
             "assignarray(while): x=%s rhs=%s"
             (Id.to_string x)
             (Id.to_string rhs));
        {
          expr = Assign(x, rhs, Unit, AssignWhile);
          subst_out = subst;
          post = [];
        }
      end else begin
        (* Outside while: create both mutable write and SSA phi alias. *)
        let rhs_t = find_type_default env rhs in
        let rhs_alias = let (n, _) = Id.genid (Id.to_string x ^ "_phi") in (n, Id.Known(Id.Leakable, Id.None)) in
        trace_log
          (Printf.sprintf
             "assignarray: x=%s rhs=%s alias=%s"
             (Id.to_string x)
             (Id.to_string rhs)
             (Id.to_string rhs_alias));
        {
          expr = Assign(x, rhs, Unit, AssignWhile);
          subst_out = add_subst subst x rhs_alias;
          post = [((rhs_alias, rhs_t), Var(rhs))];
        }
      end
  | Assign(_, _, _, AssignArray) ->
      failwith "ternPhiInsert: AssignArray with non-Unit tail is not supported"
  | Assign(x, y, e_tail, AssignWhile) ->
      let y' = lookup_subst subst y in
      let out_tail = rewrite ~cont_size ~in_while env (IdMap.remove x subst) e_tail in
      {
        expr = Assign(x, y', out_tail.expr, AssignWhile);
        subst_out = IdMap.remove x out_tail.subst_out;
        post = out_tail.post;
      }
  | While(e1, e2) ->
      (* Collect scalarized slots modified inside the while body. *)
      let modified_slots = collect_assign_array_targets IdSet.empty e2 in
      (* Remove modified slots from subst so that Var(slot) inside the
         condition and body reads from the mutable variable, not from
         a stale pre-loop SSA alias. *)
      let subst_clean =
        IdSet.fold (fun slot s -> IdMap.remove slot s) modified_slots subst
      in
      let out1 = rewrite ~cont_size:0 ~in_while env subst_clean e1 in
      (* Process body with in_while=true so that AssignArray uses
         mutable-only semantics for loop-carried dependencies. *)
      let out2 = rewrite ~cont_size:0 ~in_while:true env subst_clean e2 in
      let body' = append_post env out2.expr out2.post in
      {
        expr = While(append_post env out1.expr out1.post, body');
        subst_out = subst_clean;
        post = [];
      }
  | Break(x) ->
      { expr = Break(lookup_subst subst x); subst_out = subst; post = [] }

let rewrite_fundef ({ name = (f, ft); args; body; tags } as fundef) =
  let env0 =
    List.fold_left (fun acc (x, t) -> IdMap.add x t acc) IdMap.empty args
  in
  let out = rewrite env0 IdMap.empty body in
  let body' = append_post env0 out.expr out.post in
  let fundef' = { name = (f, ft); args; body = body'; tags } in
  if has_assign_array body' then
    failwith (Printf.sprintf "ternPhiInsert: AssignArray remained in %s" (Id.to_string f));
  fundef'

let rec transform = function
  | LetRec(fundef, e2) ->
      let fundef' = rewrite_fundef fundef in
      FunctionChecker.registerFunctionDef fundef';
      LetRec(fundef', transform e2)
  | Let(xt, e1, e2) -> Let(xt, transform e1, transform e2)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, transform e1, transform e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, transform e1, transform e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, transform e)
  | Assign(x, y, e, tag) -> Assign(x, y, transform e, tag)
  | While(e1, e2) -> While(transform e1, transform e2)
  | e -> e

let f e =
  trace_events := [];
  trace_event_count := 0;
  let e' =
    match transform e with
    | e1 -> e1
  in
  let out = rewrite IdMap.empty IdMap.empty e' in
  let e'' = append_post IdMap.empty out.expr out.post in
  trace_flush ();
  if has_assign_array e'' then failwith "ternPhiInsert: AssignArray remained in main";
  e''
