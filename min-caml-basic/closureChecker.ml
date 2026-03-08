open Closure

module M = M

let builtin_types = 
  let open Type in
  M.empty
  |> M.add ("create_array", Id.Unknown) (Fun([Int; Int], Array(Int))) (* 仮の定義 *)
  |> M.add ("create_float_array", Id.Unknown) (Fun([Int; Float], Array(Float)))
  |> M.add ("rsqrt", Id.Unknown) (Fun([Float], Float))
  |> M.add ("floor", Id.Unknown) (Fun([Float], Float))
  |> M.add ("fabs", Id.Unknown) (Fun([Float], Float))
  |> M.add ("int_of_float", Id.Unknown) (Fun([Float], Int))
  |> M.add ("float_of_int", Id.Unknown) (Fun([Int], Float))
  |> M.add ("print_char", Id.Unknown) (Fun([Int], Unit))
  |> M.add ("print_newline", Id.Unknown) (Fun([Unit], Unit))

module Map_var = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

module Map_fundef = Map.Make(struct
  type t = Id.l
  let compare = compare
end)

let global_var_types = ref Map_var.empty

let starts_with s prefix =
  let ls = String.length s and lp = String.length prefix in
  ls >= lp && String.sub s 0 lp = prefix

let infer_type_from_id x =
  let s = Id.to_string x in
  if starts_with s "Ti" then Some(Type.Int)
  else if starts_with s "Td" then Some(Type.Float)
  else if starts_with s "Tb" then Some(Type.Bool)
  else if starts_with s "Tu" then Some(Type.Unit)
  else if starts_with s "Ta" then Some(Type.Array(Type.Int))
  else None

let find_var_opt env_var x =
  match Map_var.find_opt x env_var with
  | Some t -> Some t
  | None ->
      (match Map_var.find_opt x !global_var_types with
      | Some t -> Some t
      | None -> infer_type_from_id x)

let add_var_type acc (x, t) =
  if Map_var.mem x acc then acc else Map_var.add x t acc

let rec collect_var_types acc e =
  match e with
  | Let((x, t), e1, e2) ->
      let acc' = add_var_type acc (x, t) in
      collect_var_types (collect_var_types acc' e1) e2
  | LetTuple(vs, _, e1) ->
      let acc' = List.fold_left add_var_type acc vs in
      collect_var_types acc' e1
  | MakeCls((x, t), _, e1) ->
      collect_var_types (add_var_type acc (x, t)) e1
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      collect_var_types (collect_var_types acc e1) e2
  | Loop(e1) ->
      collect_var_types acc e1
  | Assign(_, _, e1) ->
      collect_var_types acc e1
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _)
  | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | Var(_) | AppCls(_, _) | AppDir(_, _) | Tuple(_) | Get(_, _) | Put(_, _, _)
  | ExtArray(_) | TernPhi(_, _, _) | Break(_) ->
      acc

let rec collect_loop_break_types env_var e =
  match e with
  | Break(x) ->
      (match find_var_opt env_var x with
      | Some(t) -> [t]
      | None ->
          failwith
            (Printf.sprintf "closureChecker: Break variable %s not found"
               (Id.to_string x)))
  | Loop(_) ->
      []
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      (collect_loop_break_types env_var e1) @ (collect_loop_break_types env_var e2)
  | Let((x, t), e1, e2) ->
      (collect_loop_break_types env_var e1)
      @ (collect_loop_break_types (Map_var.add x t env_var) e2)
  | MakeCls((x, t), _, e) ->
      collect_loop_break_types (Map_var.add x t env_var) e
  | LetTuple(vs, _, e) ->
      let env_var' =
        List.fold_left (fun env (v, t) -> Map_var.add v t env) env_var vs
      in
      collect_loop_break_types env_var' e
  | Assign(_, _, e) ->
      collect_loop_break_types env_var e
  | TernPhi(_, _, _) ->
      []
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _)
  | Sra(_, _) | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | Var(_) | AppCls(_, _) | AppDir(_, _) | Tuple(_) | Get(_, _) | Put(_, _, _)
  | ExtArray(_) ->
      []

let infer_loop_type env_var e =
  match collect_loop_break_types env_var e with
  | [] -> Type.Unit
  | t :: ts ->
      if List.for_all (fun t' -> Type.equal t t') ts then t
      else failwith "closureChecker: Loop has mixed break value types"

let rec g env_var env_fundef e =
  match e with
  | Unit -> Type.Unit
  | Int(_) -> Type.Int
  | Float(_) -> Type.Float
  | Neg(x) ->
    (match find_var_opt env_var x with
    | Some(Type.Int) -> Type.Int
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on Neg(%s)" (Id.to_string x)))
  | Add(x, y) | Sub(x, y) ->
    (match (find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(t1), Some(t2)) when (Type.equal t1 t2) && (Type.equal t1 Type.Int) -> Type.Int
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on Add/Sub(%s,%s)" (Id.to_string x) (Id.to_string y)))
  | Sll(x, y) | Sra(x, y) ->
    (match (find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(Type.Int), Some(Type.Int)) -> Type.Int
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on Sll/Sra(%s,%s)" (Id.to_string x) (Id.to_string y)))
  | FNeg(x) -> 
    (match find_var_opt env_var x with
    | Some(Type.Float) -> Type.Float
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on FNeg(%s)" (Id.to_string x)))
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) ->
    (match (find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(Type.Float), Some(Type.Float)) -> Type.Float
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on FOp(%s,%s)" (Id.to_string x) (Id.to_string y)))
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) -> 
    (match (find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(t1), Some(t2)) when (Type.equal t1 t2) ->
      let t1 = g env_var env_fundef e1 in
      let t2 = g env_var env_fundef e2 in
      if Type.equal t1 t2 then t1 else failwith (Printf.sprintf "closureChecker: IfEq/IfLE branch type mismatch for vars %s and %s" (Id.to_string x) (Id.to_string y))
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on IfEq/IfLE(%s,%s)" (Id.to_string x) (Id.to_string y)))
  | Let((x, t), e1, e2) -> 
    let t' = g env_var env_fundef e1 in
    if Type.equal t t' then
      g (Map_var.add x t env_var) env_fundef e2
    else
      failwith (Printf.sprintf "closureChecker: Unexpected TypeError on Let for %s" (Id.to_string x))
  | Var(x) -> 
    (match find_var_opt env_var x with 
    | Some(t) -> t 
    | None -> failwith (Printf.sprintf "Unexpected Free Variable %s in closureChecker" (Id.to_string x)))
  | MakeCls((x, t), { entry = l; actual_fv = fvs }, e) -> 
    List.iter (fun fv ->
      match find_var_opt env_var fv with
      | Some(_) -> ()
      | None -> failwith ("closureChecker: Free variable " ^ (Id.to_string fv) ^ " not found in MakeCls")
    ) fvs;
    (match Map_fundef.find_opt l env_fundef with
    | Some(ft) when Type.equal ft t -> ()
    | Some(_) ->
      let Id.L(lname) = l in
      failwith (Printf.sprintf "closureChecker: MakeCls type mismatch for %s" lname)
    | None ->
      let Id.L(lname) = l in
      failwith (Printf.sprintf "closureChecker: MakeCls entry not found (%s)" lname));
    g (Map_var.add x t env_var) env_fundef e
  | AppCls(x, args) -> 
    (match find_var_opt env_var x with 
      | Some(Type.Fun(arg_types, ret_type)) ->
          if List.length args <> List.length arg_types then
            failwith (Printf.sprintf "closureChecker: AppCls argument count mismatch for %s" (Id.to_string x));
          List.iter2 (fun arg expected_type ->
            match find_var_opt env_var arg with
            | Some(actual_type) when Type.equal actual_type expected_type -> ()
            | Some(_) -> failwith (Printf.sprintf "closureChecker: AppCls argument type mismatch for %s" (Id.to_string arg))
            | None -> failwith (Printf.sprintf "closureChecker: AppCls argument %s not found" (Id.to_string arg))
          ) args arg_types;
          ret_type
    | Some(_) -> failwith (Printf.sprintf "closureChecker: AppCls on non-function type (%s)" (Id.to_string x))
    | None -> failwith (Printf.sprintf "closureChecker: AppCls function %s not found" (Id.to_string x)))
  | AppDir(l, args) -> 
    (let Id.L(lname) = l in
    (* create_arrayは特別に扱う *)
    let name =
      if String.length lname > 9 && String.sub lname 0 9 = "min_caml_" then
        String.sub lname 9 (String.length lname - 9)
      else
        lname
    in
    if name = "create_array" && List.length args = 2 then
      let arg_types = List.map (fun arg -> 
        match find_var_opt env_var arg with
        | Some(t) -> t
        | None -> failwith ("closureChecker: AppDir argument " ^ (Id.to_string arg) ^ " not found")
      ) args in
      (match arg_types with
      | [Type.Int; elem_type] -> Type.Array(elem_type)
      | _ -> failwith (Printf.sprintf "closureChecker: create_array expects (Int, 'a) but got different types"))
    else if starts_with name "print_debug." then
      if List.length args = 0 then Type.Unit
      else failwith (Printf.sprintf "closureChecker: print_debug expects 0 args (%s)" lname)
    else
      let func_type = 
        match Map_fundef.find_opt l env_fundef with
        | Some(t) -> Some(t)
        | None -> 
            match M.find_opt (name, Id.Unknown) builtin_types with
            | Some(_) as r -> r
            | None -> M.find_opt (name, Id.Unknown) !Typing.extenv
      in
      match func_type with 
      | Some(Type.Fun(ts', t)) when List.length args = List.length ts' ->
        let ts = List.map (fun arg -> 
          (match find_var_opt env_var arg with
          | Some(t) -> t
          | None -> 
              let keys = Map_var.bindings env_var |> List.map (fun (k, _) -> Id.to_string k) |> String.concat ", " in
              failwith ("closureChecker: AppDir argument " ^ (Id.to_string arg) ^ " not found. Env: " ^ keys))
        ) args in
        if List.equal Type.equal ts ts' then t 
        else failwith (Printf.sprintf "closureChecker: Unexpected TypeError on AppDir(%s)" lname)
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on AppDir(%s)" lname))
  | Tuple(xs) -> 
    let ts = List.map (fun x -> 
      (match find_var_opt env_var x with
      | Some(t) -> t
      | None -> failwith (Printf.sprintf "Unexpected Free Variable %s in closureChecker" (Id.to_string x)))
    ) xs in
    Type.Tuple(ts)
  | LetTuple(vs, x, e) -> 
    let ts = List.map snd vs in
    (match find_var_opt env_var x with
    | Some(Type.Tuple(ts')) when List.equal Type.equal ts ts' ->
      let env_var' = List.fold_left2 
      (fun env_var (v, t) t' ->
        if Type.equal t t' then Map_var.add v t env_var
        else failwith (Printf.sprintf "closureChecker: Unexpected TypeError on LetTuple(%s)" (Id.to_string v))
      ) env_var vs ts in
      g env_var' env_fundef e
    | _ -> failwith (Printf.sprintf "closureChecker: Unexpected TypeError on LetTuple(%s)" (Id.to_string x)) ;)
  | Get(x, y) -> 
    (match (find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(Type.Array(elem_type)), Some(Type.Int)) -> elem_type
    | (Some(Type.Array(_)), Some(_)) -> failwith (Printf.sprintf "closureChecker: Get index must be Int (array=%s index=%s)" (Id.to_string x) (Id.to_string y))
    | (Some(Type.Array(_)), None) -> failwith (Printf.sprintf "closureChecker: Get index not found (array=%s index=%s)" (Id.to_string x) (Id.to_string y))
    | (Some(_), _) -> failwith (Printf.sprintf "closureChecker: Get on non-array type (%s)" (Id.to_string x))
    | (None, _) -> failwith (Printf.sprintf "closureChecker: Get array not found (%s)" (Id.to_string x)))
  | Put(x, y, z) -> 
    (match (find_var_opt env_var x, find_var_opt env_var y, find_var_opt env_var z) with
    | (None, _, _) -> failwith (Printf.sprintf "closureChecker: Put array not found (%s)" (Id.to_string x))
    | (_, None, _) -> failwith (Printf.sprintf "closureChecker: Put index not found (array=%s index=%s)" (Id.to_string x) (Id.to_string y))
    | (_, _, None) -> failwith (Printf.sprintf "closureChecker: Put value not found (array=%s index=%s value=%s)" (Id.to_string x) (Id.to_string y) (Id.to_string z))
    | (Some(Type.Array(elem_type)), Some(Type.Int), Some(val_type)) when Type.equal elem_type val_type -> Type.Unit
    | (Some(Type.Array(_)), Some(Type.Int), Some(_)) -> failwith (Printf.sprintf "closureChecker: Put value type mismatch (array=%s index=%s)" (Id.to_string x) (Id.to_string y))
    | (Some(Type.Array(_)), Some(_), _) -> failwith (Printf.sprintf "closureChecker: Put index must be Int (array=%s index=%s)" (Id.to_string x) (Id.to_string y))
    | (Some(_), _, _) -> failwith (Printf.sprintf "closureChecker: Put on non-array type (%s)" (Id.to_string x)))
  | ExtArray(Id.L(name)) -> 
    (match M.find_opt (name, Id.Unknown) !Typing.extenv with
    | Some(arr_type) -> arr_type
    | None -> Type.Array(Type.Int))
  | TernPhi(c, x, y) ->
    (match (find_var_opt env_var c, find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(Type.Int), Some(tx), Some(ty)) when Type.equal tx ty -> tx
    | (Some(Type.Bool), Some(tx), Some(ty)) when Type.equal tx ty -> tx
    | (Some(_), Some(_), Some(_)) ->
        failwith
          (Printf.sprintf
             "closureChecker: TernPhi type mismatch (%s ? %s : %s)"
             (Id.to_string c) (Id.to_string x) (Id.to_string y))
    | (None, _, _) ->
        failwith
          (Printf.sprintf "closureChecker: TernPhi cond not found (%s)"
             (Id.to_string c))
    | (_, None, _) ->
        failwith
          (Printf.sprintf "closureChecker: TernPhi then not found (%s)"
             (Id.to_string x))
    | (_, _, None) ->
        failwith
          (Printf.sprintf "closureChecker: TernPhi else not found (%s)"
             (Id.to_string y)))
  | Loop(e) ->
    let _ = g env_var env_fundef e in
    infer_loop_type env_var e
  | Assign(x, y, e) ->
    (match (find_var_opt env_var x, find_var_opt env_var y) with
    | (Some(tx), Some(ty)) when Type.equal tx ty -> g env_var env_fundef e
    | (Some(_), Some(_)) ->
        failwith
          (Printf.sprintf
             "closureChecker: Assign type mismatch (%s <- %s)"
             (Id.to_string x) (Id.to_string y))
    | (None, _) ->
        failwith
          (Printf.sprintf "closureChecker: Assign lhs not found (%s)"
             (Id.to_string x))
    | (_, None) ->
        failwith
          (Printf.sprintf "closureChecker: Assign rhs not found (%s)"
             (Id.to_string y)))
  | Break(x) ->
    (match find_var_opt env_var x with
    | Some(_) -> Type.Unit
    | None ->
        failwith
          (Printf.sprintf "closureChecker: Break variable not found (%s)"
             (Id.to_string x)))

let f (Prog(fundefs, e)) = 
  let rec helper fs =
    match fs with
    | [] -> Map_fundef.empty
    | { name; args = _; formal_fv = _; body = _ } :: rest ->
      let (id, t) = name in
      Map_fundef.add id t (helper rest)
    in
  let collected =
    List.fold_left
      (fun acc { args; formal_fv; body; _ } ->
        let acc' = List.fold_left add_var_type acc args in
        let acc'' = List.fold_left add_var_type acc' formal_fv in
        collect_var_types acc'' body)
      Map_var.empty
      fundefs
    |> fun acc -> collect_var_types acc e
  in
  global_var_types := collected;
  let _ = g Map_var.empty (helper fundefs) e in
  ()
