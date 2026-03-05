open KNormal

(* 型を再帰的にflattenする *)
let rec flatten_type_recursive t =
  match t with
  | Type.Tuple(ts) ->
      let flattened = List.concat_map flatten_type_list ts in
      Type.Tuple(flattened)
  | Type.Fun(arg_types, ret_type) ->
      let arg_types' = List.map flatten_type_recursive arg_types in
      let ret_type' = flatten_type_recursive ret_type in
      Type.Fun(arg_types', ret_type')
  | Type.Array(Type.Tuple(ts)) ->
      Type.Array(Type.Tuple(List.concat_map flatten_type_list ts))
  | Type.Array(t) ->
      Type.Array(flatten_type_recursive t)
  | Type.Var(t) -> (* 必要? *)
    (match !t with
    | Some(t') -> Type.Var(ref (Some(flatten_type_recursive t')))
    | None -> Type.Var(ref None))
  | _ -> t
and flatten_type_list t =
  match t with
  | Type.Tuple(ts) -> List.concat_map flatten_type_list ts
  | _ -> [flatten_type_recursive t]

(* タプル型のリストをflattenする *)
and flatten_type ts = 
  List.concat_map flatten_type_list ts

(* 式から最終的に返されるTupleの要素変数リストを抽出 *)
let rec extract_final_tuple e =
  match e with
  | Tuple(vars) -> Some(vars)
  | Let(_, _, e2) -> extract_final_tuple e2
  | IfEq(_, _, e1, _) -> extract_final_tuple e1
  | IfLE(_, _, e1, _) -> extract_final_tuple e1
  | _ -> None

let rec g_out_tuple env e =
  match e with
    | Unit -> (Unit, env)
    | Int(i) -> (Int(i), env)
    | Float(f) -> (Float(f), env)
    | ExtArray(l) -> (ExtArray(l), env)
    | Neg(x) -> (Neg(x), env)
    | FNeg(x) -> (FNeg(x), env)
    | Add(x, y) -> (Add(x, y), env)
    | Sub(x, y) -> (Sub(x, y), env)
    | FAdd(x, y) -> (FAdd(x, y), env)
    | FSub(x, y) -> (FSub(x, y), env)
    | FMul(x, y) -> (FMul(x, y), env)
    | FDiv(x, y) -> (FDiv(x, y), env)
    | Var(x) -> (Var(x), env)
    | Get(x, y) -> (Get(x, y), env)
    | Put(x, y, z) -> (Put(x, y, z), env)
    
    | IfEq(x, y, e1, e2) ->
        let (e1', _) = g_out_tuple env e1 in
        let (e2', _) = g_out_tuple env e2 in
        (IfEq(x, y, e1', e2'), env)
    | IfLE(x, y, e1, e2) ->
        let (e1', _) = g_out_tuple env e1 in
        let (e2', _) = g_out_tuple env e2 in
        (IfLE(x, y, e1', e2'), env)
    | Let((x, Type.Tuple(t)), e1, e2) ->
        let t' = flatten_type t in
        let (e1', env1) = g_out_tuple env e1 in
        (match extract_final_tuple e1' with
          | Some(vars) ->
              (* e1がTupleの場合、環境に登録 *)
              let env' = M.add x vars env1 in
              let (e2', env2) = g_out_tuple env' e2 in
              (Let((x, Type.Tuple(t')), e1', e2'), env2)
          | None ->
              (* e1が関数呼び出しなどの場合、LetTupleで分解して環境に登録 *)
              let elem_vars = List.map (fun ty -> (Id.genid (Id.to_string x), ty)) t' in
              let env' = M.add x (List.map fst elem_vars) env1 in
              let (e2', env2) = g_out_tuple env' e2 in
              let e2_with_lettuple = LetTuple(elem_vars, x, e2') in
              (Let((x, Type.Tuple(t')), e1', e2_with_lettuple), env2))
    | Let((x, t), e1, e2) ->
        let (e1', env1) = g_out_tuple env e1 in
        let (e2', env2) = g_out_tuple env1 e2 in
        (* 型をflattenする *)
        let t' = flatten_type_recursive t in
        (Let((x, t'), e1', e2'), env2)
        
    | LetTuple(xts, y, e1) ->
      (* まず各要素の型をflatten *)
      let xts_flattened = List.map (fun (x, t) -> (x, flatten_type_recursive t)) xts in
      if List.for_all (fun (_, t) -> match t with Type.Tuple(_) -> false | _ -> true) xts_flattened then
        let (e1', env1) = g_out_tuple env e1 in
        (LetTuple(xts_flattened, y, e1'), env1)
      else
        (* 
        xtsにtupleが含まれる場合は、一度適当な変数をおいて、tupleを再構成
        eg. 
        let (a, b) = x in
        let (c, d) = b in ...
        は、
        let (a, t1, t2) = x in
        let b = (t1, t2) in
        let (c, d) = b in ...
        となるようにする
        *)
        let rec build_args xts env =
          match xts with
          | [] -> ([], [], env)
          | (x, Type.Tuple(t))::xts_rest -> 
            let new_xts = List.map (fun t -> (Id.genid (Id.to_string x), flatten_type_recursive t)) t in
            let new_xs = List.map fst new_xts in
            let (rest_args, map_vars, env1) = build_args xts_rest env in
            (new_xts @ rest_args,
              ((x, Type.Tuple(t)), new_xs) :: map_vars,
              M.add x (List.map fst new_xts) env1)
          | (x, t) :: xts_rest ->
            let (rest_args, map_vars, env1) = build_args xts_rest env in
            ((x, flatten_type_recursive t) :: rest_args, map_vars, env1)
          in
        let (new_xts, map_vars, _) = build_args xts_flattened env in
        let new_expr' = List.fold_left (fun e1 map -> Let(fst map, Tuple(snd map), e1)) e1 map_vars in
        let new_expr = LetTuple(new_xts, y, new_expr') in
        g_out_tuple env new_expr

    | Tuple(xs) ->
        let expanded = List.concat_map (fun x ->
            match M.find_opt x env with
            | Some(vars) -> vars
            | None -> [x]
        ) xs in
        (Tuple(expanded), env)

    | LetRec(fundef, e) ->
        (* タプル型の引数を持つ場合の情報を収集し、環境を構築 *)
        let (args_flat, body_env) = List.fold_left (fun (acc_args, acc_env) (arg_name, arg_type) ->
          match arg_type with
          | Type.Tuple(ts) ->
              let ts_flat = flatten_type ts in
              (* 展開後の個別の変数を生成 *)
              let elem_vars = List.map (fun t -> (Id.genid (Id.to_string arg_name), t)) ts_flat in
              let elem_var_names = List.map fst elem_vars in
              (* 引数はタプルのまま受け取る *)
              (acc_args @ [(arg_name, Type.Tuple(ts_flat))],
               M.add arg_name elem_var_names acc_env)
          | _ -> (acc_args @ [(arg_name, arg_type)], acc_env)
        ) ([], env) fundef.args in
        
        (* 関数本体を環境付きで処理（タプル引数が展開される） *)
        let (body', _) = g_out_tuple body_env fundef.body in
        
        (* タプル引数を関数本体の先頭でLetTupleを使って分解 *)
        let body'' = List.fold_left (fun body (arg_name, arg_type) ->
          match arg_type with
          | Type.Tuple(_) ->
              (match M.find_opt arg_name body_env with
               | Some(elem_var_names) ->
                   let elem_vars = List.map2 (fun var_name t ->
                     (var_name, t)
                   ) elem_var_names (match arg_type with Type.Tuple(ts) -> ts | _ -> []) in
                   LetTuple(elem_vars, arg_name, body)
               | None -> body)
          | _ -> body
        ) body' args_flat in
        
        let (fname, ftype) = fundef.name in
        let ftype_flat = match ftype with
          | Type.Fun(arg_types, ret_type) ->
              let arg_types_flat = List.map (fun t ->
                match t with
                | Type.Tuple(ts) -> Type.Tuple(flatten_type ts)
                | _ -> t
              ) arg_types in
              let ret_type_flat = match ret_type with
                | Type.Tuple(ts) -> Type.Tuple(flatten_type ts)
                | _ -> ret_type
              in
              Type.Fun(arg_types_flat, ret_type_flat)
          | _ -> ftype
        in
        
        let fundef' = { 
          name = (fname, ftype_flat); 
          args = args_flat; 
          body = body'';
          tags = fundef.tags
        } in
        
        let (e', env1) = g_out_tuple env e in
        (LetRec(fundef', e'), env1)

    | App(f, args) ->
        (App(f, args), env)

    | ExtFunApp(fname, args) ->
        (ExtFunApp(fname, args), env)
    | Assign(x, y, e1, tag) ->
        let (e1', env1) = g_out_tuple env e1 in
        (Assign(x, y, e1', tag), env1)
    | TernPhi(c, x, y) ->
        (TernPhi(c, x, y), env)
    | While(e1, e2) ->
        let (e1', _) = g_out_tuple env e1 in
        let (e2', _) = g_out_tuple env e2 in
        (While(e1', e2'), env)
    | Break(x) ->
        (Break(x), env)
    
    | _ -> (e, env)

let f e =
  (* extenvの型をflattenする *)
  Typing.extenv := M.map flatten_type_recursive !Typing.extenv;
  let (e', _env) = g_out_tuple M.empty e in
  e'
