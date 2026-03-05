open KNormal

let function_env = ref(Hashtbl.create 100)

(* 関数定義を登録 *)
let registerFunctionDef (fundef : fundef) =
  let (name, _) = fundef.name in
  let label = Id.L(Id.to_string name) in
  Hashtbl.add !function_env label fundef

(* 式中の関数定義をすべて登録 *)
let rec registerFunction e =
  match e with
  | LetRec(fundef, e2) ->
      registerFunctionDef fundef;
      registerFunction fundef.body;
      registerFunction e2
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      registerFunction e1;
      registerFunction e2
  | While(e1, e2) ->
      registerFunction e1;
      registerFunction e2
  | Assign(_, _, e, _) -> registerFunction e
  | LetTuple(_, _, e) -> registerFunction e
  | TernPhi(_, _, _) -> ()
  | _ -> ()

(* 関数定義を検索 *)
let findFunction (l : Id.l) =
  Hashtbl.find_opt !function_env l

(* 式eの純粋性判定 *)
let rec checkExpPurity e =
  match e with 
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) -> checkExpPurity e1 && checkExpPurity e2
  | LetRec(_, e) | LetTuple(_, _, e) -> checkExpPurity e
  | TernPhi(_, _, _) -> false
  | While(_, _) | Assign(_, _, _, _) | Break(_) -> false
  | Put(_, _, _) | Get(_, _) -> false
  | ExtFunApp(f, _) -> 
    (match f with
    | ("floor", _) | ("rsqrt", _) | ("int_of_float", _) | ("float_of_int", _) -> true
    | _ -> false)
  | App(f, _) -> 
    let fundef_opt = findFunction (Id.L(Id.to_string f)) in
    (match fundef_opt with
    | Some fundef -> checkFunctionPurity fundef
    | None -> false)
  | _ -> true

(* 関数fの純粋性判定 *)
and checkFunctionPurity f =
  match f with
  | { name = (_, _); args = _; body = e; tags = tag } ->
    match !tag with
    | Pure -> true
    | Impure -> false
    | Unknown -> 
      tag := Pure;
      let res = checkExpPurity e in
      if not res then tag := Impure;
      res

let dump_all_functions () =
  !function_env |> Hashtbl.iter (fun _ fundef -> Format.eprintf "function %s is %s@." (Id.to_string (fst fundef.name)) (if checkFunctionPurity fundef then "pure" else "impure"))
let f e = 
  function_env := Hashtbl.create 100;
  registerFunction e;
  let _ = checkExpPurity e in
  (* dump_all_functions(); *)
  e
