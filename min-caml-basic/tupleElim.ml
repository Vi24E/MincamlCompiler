open KNormal

(* M は Id.t → Id.t listの写像 *)
let threshold = Config.TupleElim.threshold

module M = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end) 

let stab e = e

let rec tupleEliminator e env = 
  match e with
  | Let((x, Type.Tuple(ts)), e1, e2) when List.length ts <= !threshold ->
      (match e1 with
      | Tuple(es) ->
          let env' = M.add x es env in
          let e2' = tupleEliminator e2 env' in
          Let((x, Type.Tuple(ts)), e1, e2')
      | _ -> 
          let e1' = tupleEliminator e1 env in
          let e2' = tupleEliminator e2 env in
          Let((x, Type.Tuple(ts)), e1', e2'))
  
  |   Let((x, t), e1, e2) ->
      let e1' = tupleEliminator e1 env in
      let e2' = tupleEliminator e2 env in
      Let((x, t), e1', e2')
  
  | LetRec({ name = (x, t); args = yts; body = e1; tags = tg}, e2) ->
      let (yts', env', bindings) = List.fold_left (fun (acc_yts, acc_env, acc_bindings) ((y, ty) as yt) ->
        match ty with
        | Type.Tuple(tys) when List.length tys <= !threshold ->
            let y_elems = List.mapi (fun _ ty -> (Id.genid (Id.to_string y), ty)) tys in
            (acc_yts @ y_elems, M.add y (List.map fst y_elems) acc_env, acc_bindings @ [(y, ty, y_elems)])
        | _ -> (acc_yts @ [yt], acc_env, acc_bindings)
      ) ([], env, []) yts in
      
      let t' = match t with
        | Type.Fun(_, ret_t) -> Type.Fun(List.map snd yts', ret_t)
        | _ -> t
      in
      
      let e1' = List.fold_right (fun (y, ty, y_elems) body ->
        Let((y, ty), Tuple(List.map fst y_elems), body)
      ) bindings e1 in
      let e1'' = tupleEliminator e1' env' in
      let e2' = tupleEliminator e2 env in
      let fundef' = { name = (x, t'); args = yts'; body = e1''; tags = tg } in
      FunctionChecker.registerFunctionDef fundef';
      LetRec(fundef', e2')

  | App(f, args) ->
      let args' = List.flatten (List.map (fun arg ->
        match M.find_opt arg env with
        | Some(xs) -> xs
        | None -> [arg]
      ) args) in
      App(f, args')
    
  | LetTuple(xts, y, e2) when List.length xts <= !threshold ->
      (match M.find_opt y env with
      | Some(es) when List.length xts = List.length es ->
          let env' = List.fold_left2 (fun acc_env (x, _) e ->
            M.add x [e] acc_env
          ) (M.add y es env) xts es in
          let e2' = tupleEliminator e2 env' in
          List.fold_right2 (fun (x, t) e acc ->
            Let((x, t), Var(e), acc)
          ) xts es e2'
      | _ ->
          let xs = List.map fst xts in
          let env' = M.add y xs env in
          LetTuple(xts, y, tupleEliminator e2 env'))
  
  | LetTuple(xts, y, e2) -> LetTuple(xts, y, tupleEliminator e2 env)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, tupleEliminator e1 env, tupleEliminator e2 env)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, tupleEliminator e1 env, tupleEliminator e2 env)  
  | Assign(x, y, e, tag) -> Assign(x, y, tupleEliminator e env, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(e1, e2) -> While(tupleEliminator e1 env, tupleEliminator e2 env)
  | e -> e

(* call after tuple flatten *)
let f e =
  let e' = TupleFlatten.f e in
  tupleEliminator e' M.empty
