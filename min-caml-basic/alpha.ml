(* rename identifiers to make them unique (alpha-conversion) *)

open KNormal

let find x env = try M.find x env with Not_found -> x

(* g env expr = (expr', leak)
   env : 完全なリネーム環境 (旧名 → 新名)
   leak: Leakable変数のリネームのみ。If枝内で定義されたphi変数が
         枝外のTernPhiから参照されるため、枝を跨いで伝搬する必要がある。
   If節では両branch のleakが矛盾しないことをassertionで確認する。 *)
let rec g env = function
  | Unit -> (Unit, M.empty)
  | Int(i) -> (Int(i), M.empty)
  | Float(d) -> (Float(d), M.empty)
  | Neg(x) -> (Neg(find x env), M.empty)
  | Add(x, y) -> (Add(find x env, find y env), M.empty)
  | Sub(x, y) -> (Sub(find x env, find y env), M.empty)
  | Sll(x, y) -> (Sll(find x env, find y env), M.empty)
  | Sra(x, y) -> (Sra(find x env, find y env), M.empty)
  | FNeg(x) -> (FNeg(find x env), M.empty)
  | FAdd(x, y) -> (FAdd(find x env, find y env), M.empty)
  | FSub(x, y) -> (FSub(find x env, find y env), M.empty)
  | FMul(x, y) -> (FMul(find x env, find y env), M.empty)
  | FDiv(x, y) -> (FDiv(find x env, find y env), M.empty)
  | IfEq(x, y, e1, e2) ->
      let (e1', leak1) = g env e1 in
      let (e2', leak2) = g env e2 in
      (* 両枝のLeakable envが矛盾しないことを確認:
         同一キーが異なる値にマップされていたらバグ *)
      M.iter (fun k v1 ->
        match M.find_opt k leak2 with
        | Some v2 when Id.compare v1 v2 <> 0 ->
            Format.eprintf
              "ALPHA ASSERT IfEq: conflicting Leakable for %s: %s vs %s@."
              (Id.to_string k) (Id.to_string v1) (Id.to_string v2);
            assert false
        | _ -> ()
      ) leak1;
      let merged = M.union (fun _ v1 _ -> Some v1) leak1 leak2 in
      (IfEq(find x env, find y env, e1', e2'), merged)
  | IfLE(x, y, e1, e2) ->
      let (e1', leak1) = g env e1 in
      let (e2', leak2) = g env e2 in
      M.iter (fun k v1 ->
        match M.find_opt k leak2 with
        | Some v2 when Id.compare v1 v2 <> 0 ->
            Format.eprintf
              "ALPHA ASSERT IfLE: conflicting Leakable for %s: %s vs %s@."
              (Id.to_string k) (Id.to_string v1) (Id.to_string v2);
            assert false
        | _ -> ()
      ) leak1;
      let merged = M.union (fun _ v1 _ -> Some v1) leak1 leak2 in
      (IfLE(find x env, find y env, e1', e2'), merged)
  | Let((x, t), e1, e2) ->
      let x' =
        let (name, _) = Id.genid (Id.to_string x) in
        if Id.is_leakable x then (name, Id.Known(Id.Leakable, Id.None))
        else (name, Id.Unknown)
      in
      let (e1', leak1) = g env e1 in
      (* leak1 (e1内のLeakable) をenvに加えてe2を処理 *)
      let env' = M.add x x' (M.fold (fun k v acc -> M.add k v acc) leak1 env) in
      let (e2', leak2) = g env' e2 in
      (* leak1はe2のenv経由で消費済み。leak2 + 自身のLeakableを伝搬 *)
      let out_leak =
        if Id.is_leakable x' then M.add x x' leak2
        else leak2
      in
      (Let((x', t), e1', e2'), out_leak)
  | Var(x) -> (Var(find x env), M.empty)
  | LetRec({ name = (x, t); args = yts; body = e1; tags = _ }, e2) ->
      let env = M.add x (Id.genid (Id.to_string x)) env in
      let ys = List.map fst yts in
      let env' = M.add_list2 ys (List.map (fun y -> Id.genid (Id.to_string y)) ys) env in
      let (body', _) = g env' e1 in
      let (e2', leak2) = g env e2 in
      (LetRec({ name = (find x env, t);
               args = List.map (fun (y, t) -> (find y env', t)) yts;
               body = body';
               tags = KNormal.default_tag() },
             e2'), leak2)
  | App(x, ys) -> (App(find x env, List.map (fun y -> find y env) ys), M.empty)
  | Tuple(xs) -> (Tuple(List.map (fun x -> find x env) xs), M.empty)
  | LetTuple(xts, y, e) ->
      let xs = List.map fst xts in
      let env' = M.add_list2 xs (List.map (fun x -> Id.genid (Id.to_string x)) xs) env in
      let (e', leak) = g env' e in
      (LetTuple(List.map (fun (x, t) -> (find x env', t)) xts,
               find y env,
               e'), leak)
  | Get(x, y) -> (Get(find x env, find y env), M.empty)
  | Put(x, y, z) -> (Put(find x env, find y env, find z env), M.empty)
  | ExtArray(x) -> (ExtArray(x), M.empty)
  | ExtFunApp(x, ys) -> (ExtFunApp(x, List.map (fun y -> find y env) ys), M.empty)
  | TernPhi(c, x, y) -> (TernPhi(find c env, find x env, find y env), M.empty)
  | Assign(x, y, e, tag) ->
      let (e', leak) = g env e in
      (Assign(find x env, find y env, e', tag), leak)
  | While(e1, e2) ->
      let (e1', _) = g env e1 in
      let (e2', _) = g env e2 in
      (While(e1', e2'), M.empty)
  | Break(x) -> (Break(find x env), M.empty)

let f e = fst (g M.empty e)
