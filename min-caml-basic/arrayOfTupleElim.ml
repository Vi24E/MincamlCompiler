open KNormal

(* Array<Tuple<T1, T2, ...>> a を
   Array<T1> a1, Array<T2> a2, ... に分解する最適化。
   
   create_array(n, t)  ->  let (t1,t2,...) = t in
                           let a1 = create_array(n, t1) in
                           let a2 = create_array(n, t2) in ...
   Get(a, i)           ->  let v1 = Get(a1, i) in
                           let v2 = Get(a2, i) in ...
                           Tuple([v1; v2; ...])
   Put(a, i, t)        ->  let (t1,t2,...) = t in
                           Put(a1, i, t1);
                           Put(a2, i, t2); ...
*)

let threshold = Config.ArrayOfTupleElim.threshold

module M = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

(* alias_env: 変換対象の配列またはそのエイリアスの名前の集合 *)

(* is_tail=true かつ alias が return される → 変換不可 *)
(* App/ExtFunApp/Tuple の引数に alias が含まれる → 変換不可 *)
(* Put(_, _, z) で z が alias → 変換不可 (配列が別の配列のelemに格納) *)
let rec eliminable target_id e alias_env is_branch is_tail =
  let mem x = List.mem (Id.to_string x) alias_env in
  match e with
  | Var(x) when mem x -> not is_tail
  | Let((x, _), e1, e2) ->
      (* e1 が alias の別名束縛なら alias_env を拡張 *)
      let alias_env' = match e1 with
        | Var(x') when mem x' -> (Id.to_string x) :: alias_env
        | _ -> alias_env
      in
      eliminable target_id e1 alias_env' is_branch false
      && eliminable target_id e2 alias_env' is_branch is_tail
  | LetRec({ name = (x, _); args = _; body = e1; tags = _ }, e2) ->
      (* 関数定義の内側でも、不正な使い方(引数に渡す等)が無ければ変換可能 *)
      let alias_env' = (Id.to_string x) :: alias_env in
      eliminable target_id e1 alias_env true false
      && eliminable target_id e2 alias_env' is_branch is_tail
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      eliminable target_id e1 alias_env true is_tail
      && eliminable target_id e2 alias_env true is_tail
  | LetTuple(_, _, e2) ->
      eliminable target_id e2 alias_env is_branch is_tail
  | While(e1, e2) ->
      eliminable target_id e1 alias_env true false
      && eliminable target_id e2 alias_env true false
  | Assign(x, y, e2, _) ->
      if mem x || mem y then false
      else eliminable target_id e2 alias_env is_branch is_tail
  | Break(x) -> not (mem x)
  (* alias の配列が Put の値として渡される → 別の配列のelemになる → 不可 *)
  | Put(_, _, z) when mem z -> false
  (* alias の Get/Put は変換するので OK *)
  | Get(x, _) when mem x -> true
  | Put(x, _, _) when mem x -> true
  (* alias が App / ExtFunApp / Tuple の引数に含まれる → 不可 *)
  | App(_, xs) | ExtFunApp(_, xs) ->
      List.for_all (fun x -> not (mem x)) xs
  | Tuple(xs) ->
      List.for_all (fun x -> not (mem x)) xs
  | _ -> true

(* alias_env 内に x が出現するか調べる（関数定義本体の非表示チェック） *)
and not_shown e alias_env =
  let mem x = List.mem (Id.to_string x) alias_env in
  match e with
  | Var(x) -> not (mem x)
  | Let((_, _), e1, e2) -> not_shown e1 alias_env && not_shown e2 alias_env
  | LetRec({ body = e1; _ }, e2) -> not_shown e1 alias_env && not_shown e2 alias_env
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      not_shown e1 alias_env && not_shown e2 alias_env
  | LetTuple(_, _, e) -> not_shown e alias_env
  | While(e1, e2) -> not_shown e1 alias_env && not_shown e2 alias_env
  | Assign(x, y, e, _) ->
      not (mem x) && not (mem y) && not_shown e alias_env
  | Break(x) -> not (mem x)
  | Put(x, _, _) | Get(x, _) -> not (mem x)
  | Tuple(xs) | App(_, xs) | ExtFunApp(_, xs) ->
      List.for_all (fun x -> not (mem x)) xs
  | _ -> true

(* sub_arrays: タプルの各要素に対応するサブ配列の Id.t リスト
   elem_types: タプルの各要素の型リスト
   target_x:   分解対象の配列変数 *)
let rec eliminate target_x elem_types e sub_arrays =
  let mem x = Id.to_string x = Id.to_string target_x in
  match e with

  (* create_array の定義点: ここでサブ配列の宣言を生成する *)
  | Let((x, _), ExtFunApp((("create_array" | "create_float_array"), _), [sz; init_val]), e2)
    when mem x ->
      Format.eprintf "ArrayOfTupleElim: eliminate で create_array(x=%s) の Let にマッチ！@." (Id.to_string x);
      let init_elems = List.map (fun t -> (Id.genid "aot_init", t)) elem_types in
      let e2' = eliminate target_x elem_types e2 sub_arrays in
      let create_sub =
        List.fold_right2 (fun sub_id (init_elem, elem_t) acc ->
          let fname = match elem_t with
            | Type.Float -> "create_float_array"
            | _ -> "create_array"
          in
          Let((sub_id, Type.Array(elem_t)),
              ExtFunApp((fname, Id.Unknown), [sz; init_elem]),
              acc)
        ) sub_arrays init_elems e2'
      in
      LetTuple(init_elems, init_val, create_sub)

  (* Get(target, i) → Tuple([Get(a1,i); Get(a2,i); ...]) *)
  | Get(arr, idx) when mem arr ->
      (* let v1 = Get(a1, i) in let v2 = Get(a2, i) in ... Tuple([v1;v2;...]) *)
      let vs = List.map (fun t -> (Id.genid "aot_get", t)) elem_types in
      List.fold_right2 (fun sub_id (v, t) acc ->
        Let((v, t), Get(sub_id, idx), acc)
      ) sub_arrays vs
        (Tuple(List.map fst vs))

  (* Put(target, i, val) → let (t1,t2,...) = val in Put(a1,i,t1); Put(a2,i,t2); ... *)
  | Put(arr, idx, tup_val) when mem arr ->
      let put_elems = List.mapi (fun _ t -> (Id.genid "aot_put", t)) elem_types in
      (* LetTuple でタプル変数を分解 *)
      let puts =
        List.fold_right2 (fun sub_id (put_elem, _) acc ->
          Let((Id.genid "aot_unit", Type.Unit),
              Put(sub_id, idx, put_elem),
              acc)
        ) sub_arrays put_elems Unit
      in
      LetTuple(put_elems, tup_val, puts)

  (* 以下は再帰的に走査するだけ *)
  | Let((x, t), e1, e2) ->
      if mem x then Format.eprintf "ArrayOfTupleElim: WARNING - target_x_Let にマッチしたが eliminate の特化ケースに落ちなかった: %s@." (Id.to_string x);
      Let((x, t), eliminate target_x elem_types e1 sub_arrays,
                  eliminate target_x elem_types e2 sub_arrays)
  | LetRec({ name; args; body; tags }, e2) ->
      let body' = eliminate target_x elem_types body sub_arrays in
      let fundef' = { name; args; body = body'; tags } in
      FunctionChecker.registerFunctionDef fundef';
      LetRec(fundef', eliminate target_x elem_types e2 sub_arrays)
  | IfEq(x, y, e1, e2) ->
      IfEq(x, y, eliminate target_x elem_types e1 sub_arrays,
                 eliminate target_x elem_types e2 sub_arrays)
  | IfLE(x, y, e1, e2) ->
      IfLE(x, y, eliminate target_x elem_types e1 sub_arrays,
                 eliminate target_x elem_types e2 sub_arrays)
  | LetTuple(xts, y, e2) ->
      LetTuple(xts, y, eliminate target_x elem_types e2 sub_arrays)
  | Assign(x, y, e2, tag) ->
      Assign(x, y, eliminate target_x elem_types e2 sub_arrays, tag)
  | While(e1, e2) ->
      While(eliminate target_x elem_types e1 sub_arrays,
            eliminate target_x elem_types e2 sub_arrays)
  | _ -> e

(* トップレベル走査 *)
let rec g e =
  match e with
  | Let((x, t), (ExtFunApp((("create_array" | "create_float_array") as fname, _), [_; _]) as e1_app), e2) ->
      (match t with
       | Type.Array(Type.Tuple ts) when List.length ts <= !threshold ->
           Format.eprintf "ArrayOfTupleElim: found array of tuple: %s@." (Id.to_string x);
           if eliminable x e2 [Id.to_string x] false true then
             begin
               Format.eprintf "ArrayOfTupleElim: %s を分解!@." (Id.to_string x);
               (* サブ配列の Id.t を生成 *)
               let sub_arrays = List.map (fun _ -> Id.genid "aot_arr") ts in
               eliminate x ts e sub_arrays
             end
           else
             begin
               Format.eprintf "ArrayOfTupleElim: %s は eliminable 判定で false@." (Id.to_string x);
               Let((x, t), g e1_app, g e2)
             end
       | _ -> 
           Let((x, t), g e1_app, g e2))
  | Let((x, t), e1, e2) ->
      Let((x, t), g e1, g e2)
  | LetRec({ name; args; body; tags }, e2) ->
      let body' = g body in
      let e2' = g e2 in
      let fundef' = { name; args; body = body'; tags } in
      FunctionChecker.registerFunctionDef fundef';
      LetRec(fundef', e2')
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g e1, g e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g e1, g e2)
  | LetTuple(xts, y, e2) -> LetTuple(xts, y, g e2)
  | Assign(x, y, e2, tag) -> Assign(x, y, g e2, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(e1, e2) -> While(g e1, g e2)
  | _ -> e

let f e = g e
