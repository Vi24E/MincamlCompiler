open KNormal

let add_rev_edge use def graph =
  let defs =
    try M.find use graph with
    | Not_found -> S.empty
  in
  M.add use (S.add def defs) graph

let rec collect_written_arrays acc = function
  | Put(a, _, _) -> S.add a acc
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_written_arrays (collect_written_arrays acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_written_arrays (collect_written_arrays acc body) e2
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> collect_written_arrays acc e
  | TernPhi(_, _, _) -> acc
  | While(e1, e2) -> collect_written_arrays (collect_written_arrays acc e1) e2
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _)
  | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | Var(_) | App(_, _) | Tuple(_) | Get(_, _) | ExtArray(_) | ExtFunApp(_, _)
  | Break(_) ->
      acc

let rec collect_read_arrays acc = function
  | Get(a, _) -> S.add a acc
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_read_arrays (collect_read_arrays acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_read_arrays (collect_read_arrays acc body) e2
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> collect_read_arrays acc e
  | TernPhi(_, _, _) -> acc
  | While(e1, e2) -> collect_read_arrays (collect_read_arrays acc e1) e2
  | Put(_, _, _) | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _)
  | FDiv(_, _) | Var(_) | App(_, _) | Tuple(_) | ExtArray(_) | ExtFunApp(_, _)
  | Break(_) ->
      acc

let rec collect_assign_lhs_arrays acc = function
  | Assign(x, _, e, _) -> collect_assign_lhs_arrays (S.add x acc) e
  | TernPhi(_, _, _) -> acc
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_assign_lhs_arrays (collect_assign_lhs_arrays acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_assign_lhs_arrays (collect_assign_lhs_arrays acc body) e2
  | LetTuple(_, _, e) -> collect_assign_lhs_arrays acc e
  | While(e1, e2) -> collect_assign_lhs_arrays (collect_assign_lhs_arrays acc e1) e2
  | Put(_, _, _) | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _)
  | FDiv(_, _) | Var(_) | App(_, _) | Tuple(_) | Get(_, _) | ExtArray(_)
  | ExtFunApp(_, _) | Break(_) ->
      acc

let rec collect_let_rhs_arrays acc = function
  (* let x : Array = y → x と y は相互エイリアス → 両方 non-const *)
  | Let((x, Type.Array(_)), Var(y), e2) ->
      collect_let_rhs_arrays (S.add x (S.add y acc)) e2
  (* let _ = Tuple([a; b; c; ...]) → タプルに入れた時点でエイリアスが生じうる →
     タプル要素として使われた変数はすべて non-const *)
  | Let(_, Tuple(vars), e2) ->
      let acc' = List.fold_left (fun a v -> S.add v a) acc vars in
      collect_let_rhs_arrays acc' e2
  | Let(_, e1, e2) ->
      collect_let_rhs_arrays (collect_let_rhs_arrays acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_let_rhs_arrays (collect_let_rhs_arrays acc body) e2
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_let_rhs_arrays (collect_let_rhs_arrays acc e1) e2
  (* LetTuple はタプルから取り出すだけなので、取り出した変数は non-const にしない。
     タプルに入れる側の Tuple([...]) を non-const にするだけで十分。 *)
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> collect_let_rhs_arrays acc e
  | TernPhi(_, _, _) -> acc
  | While(e1, e2) -> collect_let_rhs_arrays (collect_let_rhs_arrays acc e1) e2
  | Put(_, _, _) | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _)
  | FDiv(_, _) | Var(_) | App(_, _) | Tuple(_) | Get(_, _) | ExtArray(_)
  | ExtFunApp(_, _) | Break(_) ->
      acc

(* 不純な App() 呼び出しに渡された引数変数を収集する。
   不純関数は内部で配列を書き換える可能性があるため、
   引数として渡された変数は const_arrays から除外する必要がある。 *)
let rec collect_impure_app_args acc = function
  | App(f, args) ->
      (* FunctionChecker で不純と判定された App は引数を全て non-const 扱い *)
      let impure = not (FunctionChecker.checkExpPurity (App(f, args))) in
      if impure then
        List.fold_left (fun a v -> S.add v a) acc args
      else acc
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_impure_app_args (collect_impure_app_args acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_impure_app_args (collect_impure_app_args acc body) e2
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> collect_impure_app_args acc e
  | TernPhi(_, _, _) -> acc
  | While(e1, e2) ->
      collect_impure_app_args (collect_impure_app_args acc e1) e2
  | Put(_, _, _) | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _)
  | FDiv(_, _) | Var(_) | Tuple(_) | Get(_, _) | ExtArray(_)
  | ExtFunApp(_, _) | Break(_) ->
      acc

let collect_const_read_arrays body =
  let read_arrays = collect_read_arrays S.empty body in
  let assign_lhs_arrays = collect_assign_lhs_arrays S.empty body in
  let put_lhs_arrays = collect_written_arrays S.empty body in
  let let_rhs_arrays = collect_let_rhs_arrays S.empty body in
  (* 不純関数呼び出しの引数も non-const に含める（App越えの配列書き込みを保守的に処理） *)
  let impure_app_args = collect_impure_app_args S.empty body in
  let non_const =
    S.union impure_app_args
      (S.union assign_lhs_arrays (S.union put_lhs_arrays let_rhs_arrays))
  in
  S.diff read_arrays non_const

let rec collect_rev_edges graph = function
  | Let((x, _), e1, e2) ->
      let deps = fv e1 in
      let graph' = S.fold (fun d g -> add_rev_edge d x g) deps graph in
      collect_rev_edges (collect_rev_edges graph' e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_rev_edges (collect_rev_edges graph body) e2
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_rev_edges (collect_rev_edges graph e1) e2
  | LetTuple(xts, y, e) ->
      let graph' =
        List.fold_left
          (fun g (x, _) -> add_rev_edge y x g)
          graph
          xts
      in
      collect_rev_edges graph' e
  | Assign(x, y, e, _) ->
      let graph' = add_rev_edge y x graph in
      collect_rev_edges graph' e
  | TernPhi(_, _, _) ->
      graph
  | While(e1, e2) -> collect_rev_edges (collect_rev_edges graph e1) e2
  | Put(_, _, _) | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _)
  | FDiv(_, _) | Var(_) | App(_, _) | Tuple(_) | Get(_, _) | ExtArray(_)
  | ExtFunApp(_, _) | Break(_) ->
      graph

let closure_from_base base rev_graph =
  let rec dfs work visited =
    match work with
    | [] -> visited
    | x :: xs ->
        if S.mem x visited then dfs xs visited
        else
          let visited' = S.add x visited in
          let next =
            try S.elements (M.find x rev_graph) with
            | Not_found -> []
          in
          dfs (next @ xs) visited'
  in
  dfs (S.elements base) S.empty

let is_hoistable_exp const_arrays = function
  | Get(a, _) when S.mem a const_arrays -> true
  | e -> FunctionChecker.checkExpPurity e

let rec collect_impure_let_defs const_arrays acc = function
  | Let((x, _), e1, e2) ->
      let acc' = collect_impure_let_defs const_arrays acc e1 in
      let acc'' =
        if is_hoistable_exp const_arrays e1 then acc' else S.add x acc'
      in
      collect_impure_let_defs const_arrays acc'' e2
  | LetRec({ body; _ }, e2) ->
      collect_impure_let_defs const_arrays
        (collect_impure_let_defs const_arrays acc body) e2
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_impure_let_defs const_arrays
        (collect_impure_let_defs const_arrays acc e1) e2
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> collect_impure_let_defs const_arrays acc e
  | TernPhi(_, _, _) -> acc
  | While(e1, e2) ->
      collect_impure_let_defs const_arrays
        (collect_impure_let_defs const_arrays acc e1) e2
  | Put(_, _, _) | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _)
  | FDiv(_, _) | Var(_) | App(_, _) | Tuple(_) | Get(_, _) | ExtArray(_)
  | ExtFunApp(_, _) | Break(_) ->
      acc

let extract_hoistable_lets dep_set const_arrays body =
  let hoisted = ref [] in
  let rec go = function
    | Let((x, _) as xt, e1, e2) ->
        let hoistable =
          not (S.mem x dep_set) && is_hoistable_exp const_arrays e1
        in
        if hoistable then begin
          let already = List.exists (fun ((y, _), _) -> fst y = fst x) !hoisted in
          if not already then
            hoisted := (xt, e1) :: !hoisted;
          go e2
        end else
          Let(xt, e1, go e2)
    | e -> e
  in
  let body' = go body in
  (List.rev !hoisted, body')

let wrap_lets lets tail =
  List.fold_right (fun (xt, e1) acc -> Let(xt, e1, acc)) lets tail

(* while ボディのテール位置に Break が存在するか確認する。
   ネストした While 内の Break は対象外（その While 自体が処理する）。 *)
let rec contains_break = function
  | Break _ -> true
  | Let(_, _, e2) -> contains_break e2
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) -> contains_break e1 || contains_break e2
  | Assign(_, _, e, _) -> contains_break e
  | TernPhi(_, _, _) -> false
  | LetTuple(_, _, e) -> contains_break e
  | While(_, _) -> false
  | _ -> false

(* body_tail に While ノードが含まれるか確認する（ネストしたループの検出）。
   これが true の場合、外側の While はピールしない（一番内側のみピール対象）。 *)
let rec contains_while_node = function
  | While(_, _) -> true
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      contains_while_node e1 || contains_while_node e2
  | LetRec({ body; _ }, e2) ->
      contains_while_node body || contains_while_node e2
  | LetTuple(_, _, e) | Assign(_, _, e, _) -> contains_while_node e
  | TernPhi(_, _, _) -> false
  | _ -> false

(* テール位置の Unit（continue点）の個数を数える。rewrite_exits と同じパターンで再帰。 *)
let rec count_continue_exits = function
  | Unit -> 1
  | Break _ -> 0
  | Let(_, _, e2) -> count_continue_exits e2
  | Assign(_, _, e, _) -> count_continue_exits e
  | TernPhi(_, _, _) -> 0
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      count_continue_exits e1 + count_continue_exits e2
  | LetTuple(_, _, e) -> count_continue_exits e
  | _ -> 0

(* テール位置の Break(v) → Var(v)、Unit（continue点）→ replacement に書き換える。
   これにより while ループの「最初のイテレーション」を展開できる（ループピーリング）。 *)
let rec rewrite_exits replacement = function
  | Break(v) -> Var(v)
  | Unit -> replacement
  | Let(xt, e1, e2) -> Let(xt, e1, rewrite_exits replacement e2)
  | Assign(x, y, e, tag) -> Assign(x, y, rewrite_exits replacement e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | IfEq(x, y, e1, e2) ->
      IfEq(x, y, rewrite_exits replacement e1, rewrite_exits replacement e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(x, y, rewrite_exits replacement e1, rewrite_exits replacement e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, rewrite_exits replacement e)
  | e -> e

(* peel=false の場合はピールしない。iter ループ内では peel=false で呼び出すことで、
   既にピール済みの While が再度ピールされるのを防ぐ。
   各 While はボディを同じ peel フラグで再帰処理するが、ピールで生成した
   fresh_body は g を通さないため、同一 While が2回ピールされることはない。 *)
let rec g ~peel arg_set = function
  | Let(xt, e1, e2) -> Let(xt, g ~peel arg_set e1, g ~peel arg_set e2)
  | LetRec(({ args; body; _ } as fundef), e2) ->
      let fn_arg_set = List.fold_left (fun s (x, _) -> S.add x s) S.empty args in
      let body' = g ~peel fn_arg_set body in
      let e2' = g ~peel arg_set e2 in
      LetRec({ fundef with body = body' }, e2')
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g ~peel arg_set e1, g ~peel arg_set e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g ~peel arg_set e1, g ~peel arg_set e2)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, g ~peel arg_set e)
  | Assign(x, y, e, tag) -> Assign(x, y, g ~peel arg_set e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(cond, body) ->
      let cond' = g ~peel arg_set cond in
      (* ボディを同じ peel フラグで処理：内側 While も peel=true ならピール可能。
         ただし fresh_body = Alpha.f body_tail は g を通さないため、
         ピールで生成した While が再度ピールされることはない（停止性保証）。 *)
      let body' = g ~peel arg_set body in
      let const_arrays = collect_const_read_arrays body' in
      let impure_defs = collect_impure_let_defs const_arrays S.empty body' in
      let base =
        S.union arg_set (S.union (collect_written_arrays S.empty body')
                        (S.union (collect_assign_lhs_arrays S.empty body') impure_defs))
      in
      let rev_graph = collect_rev_edges M.empty body' in
      let dep_set = closure_from_base base rev_graph in
      let hoisted, body_tail = extract_hoistable_lets dep_set const_arrays body' in
      (* ループピーリング:
         peel=true かつ body_tail に Break がある場合、
         最初のイテレーションを while の外に展開する。
         rewrite_exits は IfEq/IfLE 両分岐を再帰的に書き換えるため、
         break がどちらのブランチにあっても正しく動作する：
           [break が else 側]
             while(1){ expr1; if c { expr2; Unit } else { expr3; break v } }
           →  expr1; if c { expr2; while(1){ ... } } else { expr3; v }
           [break が then 側]
             while(1){ expr1; if c { break v } else { expr2; Unit } }
           →  expr1; if c { v } else { expr2; while(1){ ... } }
         骨子は「break のない方のブランチに while を置く」こと。
         • peel=false の場合はピールしない（iter メインループ内での再帰防止）
         while ループのボディは Alpha.f で新鮮なコピーを作る。
         fresh_body は g を通さないため、同一 While が2回ピールされることはない。 *)
      let result =
        if peel && contains_break body_tail && count_continue_exits body_tail = 1
         && not (contains_while_node body_tail) then
          let fresh_body = Alpha.f body_tail in
          let while_expr = While(cond', fresh_body) in
          rewrite_exits while_expr body_tail
        else
          While(cond', body_tail)
      in
      wrap_lets hoisted result
  | e -> e

(* peel=true: 各 While の最初のイテレーションを展開（ループピーリング）
              各 While は1回だけピールされる（fresh_body は g を通さないため）
   peel=false: ピーリングなし（iter ループ内で使用） *)
let f ?(peel=false) e =
  ignore (FunctionChecker.f e);
  g ~peel S.empty e
