open KNormal

let has_side_effect e = (* 副作用の有無 (caml2html: elim_effect) *)
  not (FunctionChecker.checkExpPurity e)

let should_keep_leakable_binding x =
  Id.is_leakable x && VariableChecker.is_leakable_defined x

let is_live_non_leakable x live =
  (not (Id.is_leakable x)) && S.mem x live

let rec g = function (* 不要定義削除ルーチン本体 (caml2html: elim_f) *)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g e1, g e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g e1, g e2)
  | Let((x, t), e1, e2) -> (* letの場合 (caml2html: elim_let) *)
      let e1' = g e1 in
      let e2' = g e2 in
      if has_side_effect e1'
         || is_live_non_leakable x (fv e2')
         || should_keep_leakable_binding x
      then Let((x, t), e1', e2') else
      e2'
  | LetRec({ name = (x, t); args = yts; body = e1; tags = tags }, e2) -> (* let recの場合 (caml2html: elim_letrec) *)
      let e2' = g e2 in
      if S.mem x (fv e2') then
        LetRec({ name = (x, t); args = yts; body = g e1; tags = tags }, e2')
      else
        e2'
  | LetTuple(xts, y, e) ->
      let xs = List.map fst xts in
      let e' = g e in
      let live = fv e' in
      if List.exists (fun x -> is_live_non_leakable x live || should_keep_leakable_binding x) xs
      then LetTuple(xts, y, e') else
      e'
  | Assign(x, y, e, tag) -> Assign(x, y, g e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(e1, e2) -> While(g e1, g e2)
  | e -> e

let f e =
  VariableChecker.recompute_leakable_env e;
  g e
