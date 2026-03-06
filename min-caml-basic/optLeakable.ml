module K = KNormal
module A = Asm

module KIdMap = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

module KIdSet = Set.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

let to_leakable_id ((name, tag) : Id.t) : Id.t =
  match tag with
  | Id.Known(_, c) -> (name, Id.Known(Id.Leakable, c))
  | Id.Unknown -> (name, Id.Known(Id.Leakable, Id.None))

let promote_if_needed promoted x =
  if KIdSet.mem x promoted then to_leakable_id x else x

let resolve_alias alias promoted x =
  let rec aux seen v =
    let v = promote_if_needed promoted v in
    if KIdSet.mem v seen then
      v
    else
      match KIdMap.find_opt v alias with
      | Some v' when Id.compare v v' <> 0 ->
          aux (KIdSet.add v seen) v'
      | _ ->
          v
  in
  aux KIdSet.empty x

let add_alias alias promoted from_id to_id =
  let src = resolve_alias alias promoted from_id in
  let dst = resolve_alias alias promoted to_id in
  if Id.compare src dst = 0 then alias else KIdMap.add src dst alias

let rec collect_alias_rules (pairs, promoted) = function
  | K.Unit | K.Int(_) | K.Float(_) | K.Neg(_) | K.Add(_, _) | K.Sub(_, _)
  | K.Sll(_, _) | K.Sra(_, _) | K.FNeg(_) | K.FAdd(_, _) | K.FSub(_, _)
  | K.FMul(_, _) | K.FDiv(_, _) | K.Var(_) | K.App(_, _) | K.Tuple(_)
  | K.Get(_, _) | K.Put(_, _, _) | K.ExtArray(_) | K.ExtFunApp(_, _)
  | K.TernPhi(_, _, _) | K.Break(_) ->
      (pairs, promoted)
  | K.Let((x, _), e1, e2) ->
      let pairs1, promoted1 = collect_alias_rules (pairs, promoted) e1 in
      let pairs2, promoted2 = collect_alias_rules (pairs1, promoted1) e2 in
      begin match e1 with
      | K.Var(y) when Id.is_leakable x ->
          (* i, iii: let x[Leakable] = y  /  let x[Leakable] = y[Leakable] *)
          ((x, to_leakable_id y) :: pairs2, KIdSet.add y promoted2)
      | K.Var(y) when Id.is_leakable y ->
          (* ii: let x = y[Leakable] *)
          ((x, y) :: pairs2, promoted2)
      | _ ->
          (pairs2, promoted2)
      end
  | K.LetRec({ K.body; _ }, e2) ->
      let pairs1, promoted1 = collect_alias_rules (pairs, promoted) body in
      collect_alias_rules (pairs1, promoted1) e2
  | K.LetTuple(_, _, e) ->
      collect_alias_rules (pairs, promoted) e
  | K.Assign(_, _, e, _) ->
      collect_alias_rules (pairs, promoted) e
  | K.While(e1, e2) ->
      let pairs1, promoted1 = collect_alias_rules (pairs, promoted) e1 in
      collect_alias_rules (pairs1, promoted1) e2
  | K.IfEq(_, _, e1, e2) | K.IfLE(_, _, e1, e2) ->
      let pairs1, promoted1 = collect_alias_rules (pairs, promoted) e1 in
      collect_alias_rules (pairs1, promoted1) e2

let build_alias_map pairs promoted =
  List.fold_left
    (fun acc (x, y) ->
      add_alias acc promoted (promote_if_needed promoted x) (promote_if_needed promoted y))
    KIdMap.empty
    pairs

let rec rewrite_leakable_alias alias promoted = function
  | K.Unit -> K.Unit
  | K.Int(i) -> K.Int(i)
  | K.Float(d) -> K.Float(d)
  | K.Neg(x) -> K.Neg(resolve_alias alias promoted x)
  | K.Add(x, y) -> K.Add(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.Sub(x, y) -> K.Sub(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.Sll(x, y) -> K.Sll(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.Sra(x, y) -> K.Sra(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.FNeg(x) -> K.FNeg(resolve_alias alias promoted x)
  | K.FAdd(x, y) -> K.FAdd(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.FSub(x, y) -> K.FSub(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.FMul(x, y) -> K.FMul(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.FDiv(x, y) -> K.FDiv(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.IfEq(x, y, e1, e2) ->
      K.IfEq(
        resolve_alias alias promoted x,
        resolve_alias alias promoted y,
        rewrite_leakable_alias alias promoted e1,
        rewrite_leakable_alias alias promoted e2)
  | K.IfLE(x, y, e1, e2) ->
      K.IfLE(
        resolve_alias alias promoted x,
        resolve_alias alias promoted y,
        rewrite_leakable_alias alias promoted e1,
        rewrite_leakable_alias alias promoted e2)
  | K.Let((x, t), e1, e2) ->
      let x' = promote_if_needed promoted x in
      let e1' = rewrite_leakable_alias alias promoted e1 in
      K.Let((x', t), e1', rewrite_leakable_alias alias promoted e2)
  | K.Var(x) ->
      K.Var(resolve_alias alias promoted x)
  | K.LetRec({ K.name; args; body; tags }, e2) ->
      let (f, ft) = name in
      let name' = (promote_if_needed promoted f, ft) in
      let args' = List.map (fun (x, t) -> (promote_if_needed promoted x, t)) args in
      K.LetRec(
        { K.name = name'; args = args'; body = rewrite_leakable_alias alias promoted body; tags },
        rewrite_leakable_alias alias promoted e2)
  | K.App(f, ys) ->
      K.App(resolve_alias alias promoted f, List.map (resolve_alias alias promoted) ys)
  | K.Tuple(xs) ->
      K.Tuple(List.map (resolve_alias alias promoted) xs)
  | K.LetTuple(xts, y, e) ->
      let xts' = List.map (fun (x, t) -> (promote_if_needed promoted x, t)) xts in
      K.LetTuple(xts', resolve_alias alias promoted y, rewrite_leakable_alias alias promoted e)
  | K.Get(x, y) ->
      K.Get(resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.Put(x, y, z) ->
      K.Put(resolve_alias alias promoted x, resolve_alias alias promoted y, resolve_alias alias promoted z)
  | K.ExtArray(x) -> K.ExtArray(x)
  | K.ExtFunApp(f, ys) ->
      K.ExtFunApp(f, List.map (resolve_alias alias promoted) ys)
  | K.TernPhi(c, x, y) ->
      K.TernPhi(resolve_alias alias promoted c, resolve_alias alias promoted x, resolve_alias alias promoted y)
  | K.Assign(x, y, e, tag) ->
      K.Assign(promote_if_needed promoted x, resolve_alias alias promoted y, rewrite_leakable_alias alias promoted e, tag)
  | K.While(e1, e2) ->
      K.While(rewrite_leakable_alias alias promoted e1, rewrite_leakable_alias alias promoted e2)
  | K.Break(x) ->
      K.Break(resolve_alias alias promoted x)

let beta_optimize e =
  let pairs, promoted = collect_alias_rules ([], KIdSet.empty) e in
  let alias = build_alias_map pairs promoted in
  rewrite_leakable_alias alias promoted e

let should_drop_leakable x =
  Id.is_leakable x && (not (VariableChecker.is_leakable_defined x))

let rec pure_asm_exp = function
  | A.Nop | A.SetInt(_) | A.SetFloat(_) | A.SetLabel(_) | A.Mov(_) | A.Neg(_)
  | A.Add(_, _) | A.Sub(_, _) | A.Sll(_, _) | A.Sra(_, _)
  | A.FMov(_) | A.FNeg(_) | A.FAdd(_, _) | A.FSub(_, _) | A.FMul(_, _)
  | A.FDiv(_, _) | A.FInv(_) | A.CmpEq(_, _) | A.CmpLE(_, _) | A.CmpLT(_, _)
  | A.CmpFEq(_, _) | A.CmpFLE(_, _) | A.CmpFLT(_, _)
  | A.Tern(_, _, _) | A.TernF(_, _, _) ->
      true
  | A.IfEq(_, _, e1, e2) | A.IfLE(_, _, e1, e2)
  | A.IfFEq(_, _, e1, e2) | A.IfFLE(_, _, e1, e2) ->
      pure_asm_t e1 && pure_asm_t e2
  | A.Loop(_, _, e) ->
      pure_asm_t e
  | A.Ld(_, _) | A.LdF(_, _) | A.St(_, _, _) | A.StF(_, _, _)
  | A.Assign(_, _) | A.Break(_, _, _)
  | A.CallCls(_, _, _) | A.CallDir(_, _, _)
  | A.Save(_, _) | A.Restore(_) ->
      false

and pure_asm_t = function
  | A.Ans(exp) -> pure_asm_exp exp
  | A.Let(_, exp, e) -> pure_asm_exp exp && pure_asm_t e

let rec prune_emit_t = function
  | A.Ans(exp) -> A.Ans(prune_emit_exp exp)
  | A.Let((x, t), exp, e) ->
      let exp' = prune_emit_exp exp in
      let e' = prune_emit_t e in
      if should_drop_leakable x && pure_asm_exp exp' then e'
      else A.Let((x, t), exp', e')

and prune_emit_exp = function
  | A.IfEq(x, y', e1, e2) ->
      A.IfEq(x, y', prune_emit_t e1, prune_emit_t e2)
  | A.IfLE(x, y', e1, e2) ->
      A.IfLE(x, y', prune_emit_t e1, prune_emit_t e2)
  | A.IfFEq(x, y, e1, e2) ->
      A.IfFEq(x, y, prune_emit_t e1, prune_emit_t e2)
  | A.IfFLE(x, y, e1, e2) ->
      A.IfFLE(x, y, prune_emit_t e1, prune_emit_t e2)
  | A.Loop(l_start, l_end, e) ->
      A.Loop(l_start, l_end, prune_emit_t e)
  | exp -> exp

let prune_emit (A.Prog(data, fundefs, e)) =
  let fundefs' =
    List.map
      (fun ({ A.name; args; fargs; body; ret } : A.fundef) ->
        { A.name; args; fargs; body = prune_emit_t body; ret })
      fundefs
  in
  A.Prog(data, fundefs', prune_emit_t e)
