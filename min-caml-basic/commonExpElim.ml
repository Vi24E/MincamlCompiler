open KNormal

let rec expr_to_list t =
  let f2i f = Int32.to_int (Int32.bits_of_float f) in
  let s2i (s : string) : int = Hashtbl.hash s in
  match t with
  | Unit -> [0]
  | Int (x) -> [1; x]
  | Float (f) -> [2; f2i f]
  | Neg (x) -> [3; s2i (Id.to_string x)]
  | Add (x, y) -> [4; s2i (Id.to_string x); s2i (Id.to_string y)]
  | Sub (x, y) -> [5; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FNeg (x) -> [6; s2i (Id.to_string x)]
  | FAdd (x, y) -> [7; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FSub (x, y) -> [8; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FMul (x, y) -> [9; s2i (Id.to_string x); s2i (Id.to_string y)]
  | FDiv (x, y) -> [10; s2i (Id.to_string x); s2i (Id.to_string y)]
  | IfEq (x, y, e1, e2) -> [11; s2i (Id.to_string x); s2i (Id.to_string y)] @ (expr_to_list e1) @ (expr_to_list e2)
  | IfLE (x, y, e1, e2) -> [12; s2i (Id.to_string x); s2i (Id.to_string y)] @ (expr_to_list e1) @ (expr_to_list e2)
  | Let (x, e1, e2) -> [13; s2i (Id.to_string (fst x))] @ (expr_to_list e1) @ (expr_to_list e2)
  | Var (x) -> [14; s2i (Id.to_string x)]
  | LetRec (f, e) -> [15; s2i (Id.to_string (fst f.name))] @ (expr_to_list f.body) @ (expr_to_list e)
  | App (f, xs) -> [16; s2i (Id.to_string f); List.length xs] @ (List.map (fun x -> s2i (Id.to_string x)) xs)
  | Tuple (xs) -> [17; List.length xs] @ (List.map (fun x -> s2i (Id.to_string x)) xs)
  | LetTuple (xts, y, e) -> [18; List.length xts; s2i (Id.to_string y)] @ (expr_to_list e)
  | Put (x, y, z) -> [19; s2i (Id.to_string x); s2i (Id.to_string y); s2i (Id.to_string z)]
  | Get (x, y) -> [20; s2i (Id.to_string x); s2i (Id.to_string y)]
  | ExtArray x -> [21; s2i (Id.to_string x)]
  | ExtFunApp (f, xs) -> [22; s2i (Id.to_string f); List.length xs] @ (List.map (fun x -> s2i (Id.to_string x)) xs)
  | Sll (x, y) -> [23; s2i (Id.to_string x); s2i (Id.to_string y)]
  | Sra (x, y) -> [24; s2i (Id.to_string x); s2i (Id.to_string y)]
  | Assign (x, y, e) -> [25; s2i (Id.to_string x); s2i (Id.to_string y)] @ (expr_to_list e)
  | While (e1, e2) -> [26] @ (expr_to_list e1) @ (expr_to_list e2)
  | Break (x) -> [27; s2i (Id.to_string x)]

(* 位置情報を無視して式を比較する関数 *)
let compare_expr e1 e2 =
  let l1 = expr_to_list e1 in
  let l2 = expr_to_list e2 in
  compare l1 l2

module M = Map.Make(struct
  type t = KNormal.t
  let compare = compare_expr
end)

module IdMap = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

type const_val = Int of int | Float of float
type const_env_t = const_val IdMap.t

(* 変数名を”圧縮”する、すなわち最初に現れた変数から0, 1, ...とすることでalpha同値な式を同一視できるようにする *)
let simplify_expr (const_env : const_env_t) e =
  let counter = ref 0 in
  let fresh () =
    let n = !counter in
    counter := n + 1;
    (Printf.sprintf "v%d" n, Id.Unknown)
  in
  let rename env x =
    match IdMap.find_opt x const_env with
    | Some (Int i) -> (Printf.sprintf "CONST_INT_%d" i, Id.Unknown)
    | Some (Float f) -> (Printf.sprintf "CONST_FLOAT_%d" (Int32.to_int (Int32.bits_of_float f)), Id.Unknown)
    | _ ->
        match IdMap.find_opt x env with
        | Some x' -> x'
        | None -> x
  in
  let rec helper env e =
    match e with
    | Var x when IdMap.mem x const_env ->
      (match IdMap.find x const_env with
        | Int i -> KNormal.Int i
        | Float f -> KNormal.Float f)
    | _ ->
        (match e with
        | Unit -> Unit
        | Int i -> Int i
        | Float f -> Float f
        | Neg x -> Neg (rename env x)
        | Add (x, y) -> Add (rename env x, rename env y)
        | Sub (x, y) -> Sub (rename env x, rename env y)
        | Sll (x, y) -> Sll (rename env x, rename env y)
        | Sra (x, y) -> Sra (rename env x, rename env y)
        | FNeg x -> FNeg (rename env x)
        | FAdd (x, y) -> FAdd (rename env x, rename env y)
        | FSub (x, y) -> FSub (rename env x, rename env y)
        | FMul (x, y) -> FMul (rename env x, rename env y)
        | FDiv (x, y) -> FDiv (rename env x, rename env y)
        | Var x -> Var (rename env x)
        | IfEq (x, y, e1, e2) ->
            IfEq (rename env x, rename env y, helper env e1, helper env e2)
        | IfLE (x, y, e1, e2) ->
            IfLE (rename env x, rename env y, helper env e1, helper env e2)
        | Let ((x, t), e1, e2) ->
            let e1' = helper env e1 in
            let x' = fresh () in
            let env' = IdMap.add x x' env in
            Let ((x', t), e1', helper env' e2)
        | LetRec ({ name = (f, ft); args = yts; body = body; tags = tags }, e2) ->
            let f' = fresh () in
            let env' = IdMap.add f f' env in
            let (yts', env'') = List.fold_left (fun (acc, env) (y, yt) ->
              let y' = fresh () in
              (acc @ [(y', yt)], IdMap.add y y' env)
            ) ([], env') yts in
            let body' = helper env'' body in
            LetRec ({ name = (f', ft); args = yts'; body = body'; tags = tags }, helper env' e2)
        | App (f, xs) -> App (rename env f, List.map (rename env) xs)
        | Tuple xs -> Tuple (List.map (rename env) xs)
        | LetTuple (xts, y, e2) ->
            let (xts', env') = List.fold_left (fun (acc, env) (x, xt) ->
              let x' = fresh () in
              (acc @ [(x', xt)], IdMap.add x x' env)
            ) ([], env) xts in
            LetTuple (xts', rename env y, helper env' e2)
        | Get (x, y) -> Get (rename env x, rename env y)
        | Put (x, y, z) -> Put (rename env x, rename env y, rename env z)
        | ExtArray x -> ExtArray x
        | ExtFunApp (f, xs) -> ExtFunApp (f, List.map (rename env) xs)
        | Assign (x, y, e2) -> Assign (x, rename env y, helper env e2)
        | While (e1, e2) -> While (helper env e1, helper env e2)
        | Break x -> Break (rename env x)
        )
  in 
  helper IdMap.empty e

let is_simple_expr e = 
  match e with
  | Unit | Int _ | Var _ -> false
  | Float _ -> false
  | _ -> true

let rec g (const_env : const_env_t) e env =
  match e with 
  | Let((x, t), e1, e2) -> 
    let e1' = g const_env e1 env in
    let e1_simp' = simplify_expr const_env e1' in
    (match M.find_opt e1_simp' env with
    | Some(x') -> 
      Format.eprintf "CommonExpElim: Elim!@.";
       let const_env' = 
          match IdMap.find_opt x' const_env with
          | Some c -> IdMap.add x c const_env
          | None -> IdMap.remove x const_env
      in
      Let((x, t), Var(x'), g const_env' e2 env)
    | None ->
        if is_simple_expr e1' && FunctionChecker.checkExpPurity e1' then
          let env' = M.add e1_simp' x env in
          let const_env' = 
            match e1' with
            | Int i -> IdMap.add x (Int i) const_env
            | Float f -> IdMap.add x (Float f) const_env
            | Var y -> 
                (match IdMap.find_opt y const_env with
                 | Some c -> IdMap.add x c const_env
                 | None -> IdMap.remove x const_env)
            | _ -> IdMap.remove x const_env
          in
          Let((x, t), e1', g const_env' e2 env')
        else
          let const_env' = 
            match e1' with
            | Int i -> IdMap.add x (Int i) const_env
            | Float f -> IdMap.add x (Float f) const_env
            | Var y -> 
                (match IdMap.find_opt y const_env with
                 | Some c -> IdMap.add x c const_env
                 | None -> IdMap.remove x const_env)
            | _ -> IdMap.remove x const_env
          in
          Let((x, t), e1', g const_env' e2 env))
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g const_env e1 env, g const_env e2 env)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g const_env e1 env, g const_env e2 env)
  | LetTuple(xs, y, e2) -> 
      let const_env' = List.fold_left (fun acc (x, _) -> IdMap.remove x acc) const_env xs in
      LetTuple(xs, y, g const_env' e2 env)
  | LetRec({ name = (x, t); args = yts; body = e1; tags = _}, e2) -> 
    let inner_const_env = List.fold_left (fun acc (y, _) -> IdMap.remove y acc) const_env yts in
    let fundef' = { name = (x, t); args = yts; body = g inner_const_env e1 M.empty; tags = KNormal.default_tag()} in
    FunctionChecker.registerFunctionDef fundef';
    LetRec(fundef', g (IdMap.remove x const_env) e2 env)
  | Assign(x, y, e2) ->
      let const_env' = IdMap.remove x const_env in
      Assign(x, y, g const_env' e2 M.empty)
  | While(e1, e2) ->
      While(g const_env e1 M.empty, g IdMap.empty e2 M.empty)
  | Break(x) -> Break(x)
  | _ -> 
    let e_simp = simplify_expr const_env e in
    match M.find_opt e_simp env with
    | Some(x') -> Var(x')
    | None -> e

let f e = 
  g IdMap.empty e M.empty
