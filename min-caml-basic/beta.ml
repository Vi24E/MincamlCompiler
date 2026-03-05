open KNormal

let find x env = try M.find x env with Not_found -> x (* 置換のための関数 (caml2html: beta_find) *)

module S = Set.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

let rec collect_mutable acc = function
  | Assign(x, _, e, _) -> collect_mutable (S.add x acc) e
  | Let(_, e1, e2) -> collect_mutable (collect_mutable acc e1) e2
  | LetRec({ body; _ }, e2) -> collect_mutable (collect_mutable acc body) e2
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_mutable (collect_mutable acc e1) e2
  | LetTuple(_, _, e) -> collect_mutable acc e
  | While(e1, e2) -> collect_mutable (collect_mutable acc e1) e2
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _)
  | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_,_)
  | Var(_) | Tuple(_) | Get(_, _) | Put(_, _, _) | App(_, _) | ExtArray(_)
  | ExtFunApp(_, _) | TernPhi(_, _, _) | Break(_) ->
      acc

let contains_sub s sub =
  let ls = String.length s in
  let lsub = String.length sub in
  let rec go i =
    if i + lsub > ls then false
    else if String.sub s i lsub = sub then true
    else go (i + 1)
  in
  go 0

let should_keep_binding x =
  let s = Id.to_string x in
  contains_sub s "_as." || contains_sub s "_phi."

let kill_aliases_of x env =
  M.filter (fun _ v -> Id.compare v x <> 0) env

(* alias_env: Id.t M.t
   alias_env[x] = r  は「変数 x は現在 r と同じ値を持つ」ことを表す (r は代表値)。
   代表値は常に直接格納する（推移的に辿る必要がないよう、常に find_rep した値を入れる）。
   immutable 変数は env で置換されるので alias_env はミュータブル変数のみを対象とする。 *)
let find_rep x alias_env =
  try M.find x alias_env with Not_found -> x

(* x に y_rep を代入するとき alias_env を更新する:
   - x の古いエントリを削除
   - x を代表値として持っていた他の変数のエントリも削除（x の値が変わったため）
   - x -> y_rep を追加 *)
let assign_alias x y_rep alias_env =
  let ae = M.remove x alias_env in
  let ae = M.filter (fun _ r -> Id.compare r x <> 0) ae in
  if Id.compare y_rep x = 0 then ae
  else M.add x y_rep ae

(* 式の中で Assign される変数をすべて収集する。
   Let の e1 処理後に e2 用の alias_env を無効化するために使用する。 *)
let rec collect_assigned acc = function
  | Assign(x, _, e, _) -> collect_assigned (S.add x acc) e
  | Let(_, e1, e2) -> collect_assigned (collect_assigned acc e1) e2
  | LetRec({ body; _ }, e2) -> collect_assigned (collect_assigned acc body) e2
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_assigned (collect_assigned acc e1) e2
  | LetTuple(_, _, e) | While(_, e) -> collect_assigned acc e
  | _ -> acc

(* e1 内で Assign される可能性のある変数を alias_env から無効化する *)
let invalidate_assigned alias_env e1 =
  let assigned = collect_assigned S.empty e1 in
  S.fold (fun x ae ->
    let ae = M.remove x ae in
    M.filter (fun _ r -> Id.compare r x <> 0) ae
  ) assigned alias_env

let rec g mutable_set env alias_env = function (* β簡約ルーチン本体 (caml2html: beta_g) *)
  | Unit -> Unit
  | Int(i) -> Int(i)
  | Float(d) -> Float(d)
  | Neg(x) -> Neg(find x env)
  | Add(x, y) -> Add(find x env, find y env)
  | Sub(x, y) -> Sub(find x env, find y env)
  | Sll(x, y) -> Sll(find x env, find y env)
  | Sra(x, y) -> Sra(find x env, find y env)
  | FNeg(x) -> FNeg(find x env)
  | FAdd(x, y) -> FAdd(find x env, find y env)
  | FSub(x, y) -> FSub(find x env, find y env)
  | FMul(x, y) -> FMul(find x env, find y env)
  | FDiv(x, y) -> FDiv(find x env, find y env)
  | IfEq(x, y, e1, e2) ->
      IfEq(find x env, find y env, g mutable_set env alias_env e1, g mutable_set env alias_env e2)
  | IfLE(x, y, e1, e2) ->
      IfLE(find x env, find y env, g mutable_set env alias_env e1, g mutable_set env alias_env e2)
  | Let((x, t), e1, e2) -> (* letのβ簡約 (caml2html: beta_let) *)
      (* e1 内で Assign されうる変数を alias_env から無効化してから e2 用の alias_env を作る *)
      let alias_env_base = invalidate_assigned alias_env e1 in
      (match g mutable_set env alias_env e1 with
      | Var(y) ->
          (* y を env で解決し、さらに alias_env_base で代表値を求める *)
          let y' = find y env in
          let y_rep = find_rep y' alias_env_base in
          if should_keep_binding x then
            let alias_env' = M.add x y_rep alias_env_base in
            Let((x, t), Var(y'), g mutable_set env alias_env' e2)
          else if S.mem x mutable_set || S.mem y' mutable_set then
            (* x か y のどちらかがミュータブル → let バインディングを保持する。
               x が immutable (Td8144 のような一時変数) でも y がミュータブル (q0) なら
               alias_env[x] = y_rep を記録しておく必要がある。
               後続で Assign(q0, Td8144) が来たとき find_rep(Td8144) = q0 で消去できる。 *)
            let alias_env' = M.add x y_rep alias_env_base in
            Let((x, t), Var(y'), g mutable_set env alias_env' e2)
          else
            (* 両方 immutable → env に追加して x を消す *)
            g mutable_set (M.add x y' env) alias_env_base e2
      | e1' ->
          (* e1 が Var でない場合、x は何かの計算結果 → alias_env からは除外 *)
          let alias_env' =
            if S.mem x mutable_set then
              let ae = M.remove x alias_env_base in
              M.filter (fun _ r -> Id.compare r x <> 0) ae
            else alias_env_base
          in
          Let((x, t), e1', g mutable_set env alias_env' e2))
  | LetRec({ name = xt; args = yts; body = e1; tags = _ }, e2) ->
      let fundef = { name = xt; args = yts; body = g mutable_set env M.empty e1; tags = KNormal.default_tag() } in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, g mutable_set env alias_env e2)
  | Var(x) -> Var(find x env) (* 変数を置換 (caml2html: beta_var) *)
  | Tuple(xs) -> Tuple(List.map (fun x -> find x env) xs)
  | LetTuple(xts, y, e) -> LetTuple(xts, find y env, g mutable_set env alias_env e)
  | Get(x, y) -> Get(find x env, find y env)
  | Put(x, y, z) -> Put(find x env, find y env, find z env)
  | App(g, xs) -> App(find g env, List.map (fun x -> find x env) xs)
  | ExtArray(x) -> ExtArray(x)
  | ExtFunApp(x, ys) -> ExtFunApp(x, List.map (fun y -> find y env) ys)
  | TernPhi(c, x, y) -> TernPhi(find c env, find x env, find y env)
  | Assign(x, y, e, tag) ->
      let y' = find y env in
      (* x と y' それぞれの代表値を求め、一致すれば冗長な代入を除去 *)
      let x_rep = find_rep x alias_env in
      let y_rep = find_rep y' alias_env in
      let env' = env |> M.remove x |> kill_aliases_of x in
      let alias_env' = assign_alias x y_rep alias_env in
      if Id.compare x_rep y_rep = 0 then
        (* x はすでに y_rep と等価 → Assign を消去 *)
        g mutable_set env' alias_env' e
      else
        Assign(x, y', g mutable_set env' alias_env' e, tag)
  (* While ボディは前イテレーションの alias_env を引き継がない *)
  | While(e1, e2) -> While(g mutable_set env M.empty e1, g mutable_set env M.empty e2)
  | Break(x) -> Break(find x env)

let f e =
  let mutable_set = collect_mutable S.empty e in
  g mutable_set M.empty M.empty e
