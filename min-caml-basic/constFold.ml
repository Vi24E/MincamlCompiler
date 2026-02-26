open KNormal

let max_interp_steps = ref 30000
let interp_steps = ref 0

type memo_res = Ok of t | Error of string

module ArgList = struct
  type t = KNormal.t list
  let compare = compare
end
module MemoKey = struct
  type t = string * ArgList.t
  let compare = compare
end
module MemoTable = Map.Make(MemoKey)

let memo_table : memo_res MemoTable.t ref = ref MemoTable.empty

module M = Map.Make(struct
  type t = Id.t
  let compare = Id.compare
end)

let memi x env =
  try (match M.find x env with Int(_) -> true | _ -> false)
  with Not_found -> 
    match snd x with
    | Id.Known(_, Id.ConstInt _) -> true
    | _ -> false
let memf x env =
  try (match M.find x env with Float(_) -> true | _ -> false)
  with Not_found -> 
    match snd x with
    | Id.Known(_, Id.ConstFloat _) -> true
    | _ -> false
let memt x env =
  try (match M.find x env with Tuple(_) -> true | _ -> false)
  with Not_found -> false

let findi x env = 
  try (match M.find x env with Int(i) -> i | _ -> raise Not_found)
  with Not_found -> 
    match snd x with
    | Id.Known(_, Id.ConstInt i) -> i
    | _ -> raise Not_found
let findf x env = 
  try (match M.find x env with Float(d) -> d | _ -> raise Not_found)
  with Not_found -> 
    match snd x with
    | Id.Known(_, Id.ConstFloat d) -> d
    | _ -> raise Not_found
let findt x env = (match M.find x env with Tuple(ys) -> ys | _ -> raise Not_found)

let get_const_value env = function
  | Int(i) -> Some (Int i)
  | Float(f) -> Some (Float f)
  | Var(x) when memi x env -> Some (Int (findi x env))
  | Var(x) when memf x env -> Some (Float (findf x env))
  | _ -> None

let rec interpret env expr =
  if !interp_steps > !max_interp_steps then raise (Failure "interpreter step limit exceeded")
  else 
    interp_steps := !interp_steps + 1;
    match expr with
    | Unit -> Unit
    | Int(i) -> Int(i)
    | Float(f) -> Float(f)
    | Var(x) ->
        (match get_const_value env (Var(x)) with
        | Some v -> v
        | None -> raise (Failure ("variable not in const env: " ^ (Id.to_string x))))
    | Neg(x) ->
        if memi x env then Int(-(findi x env))
        else raise (Failure "neg: not a const")
    | Add(x, y) ->
        if memi x env && memi y env then Int(findi x env + findi y env)
        else raise (Failure "add: not consts")
    | Sub(x, y) ->
        if memi x env && memi y env then Int(findi x env - findi y env)
        else raise (Failure "sub: not consts")
    | FNeg(x) ->
        if memf x env then Float(-.(findf x env))
        else raise (Failure "fneg: not a const")
    | FAdd(x, y) ->
        if memf x env && memf y env then Float(findf x env +. findf y env)
        else raise (Failure "fadd: not consts")
    | FSub(x, y) ->
        if memf x env && memf y env then Float(findf x env -. findf y env)
        else raise (Failure "fsub: not consts")
    | FMul(x, y) ->
        if memf x env && memf y env then Float(findf x env *. findf y env)
        else raise (Failure "fmul: not consts")
    | FDiv(x, y) ->
        if memf x env && memf y env then Float(findf x env /. findf y env)
        else raise (Failure "fdiv: not consts")
    | IfEq(x, y, e1, e2) ->
        if memi x env && memi y env then
          if findi x env = findi y env then interpret env e1 else interpret env e2
        else if memf x env && memf y env then
          if findf x env = findf y env then interpret env e1 else interpret env e2
        else raise (Failure "ifeq: not consts")
    | IfLE(x, y, e1, e2) ->
        if memi x env && memi y env then
          if findi x env <= findi y env then interpret env e1 else interpret env e2
        else if memf x env && memf y env then
          if findf x env <= findf y env then interpret env e1 else interpret env e2
        else raise (Failure "ifle: not consts")
    | Let((x, _t), e1, e2) ->
        let v1 = interpret env e1 in
        interpret (M.add x v1 env) e2
    | Assign(_, _, _) | While(_, _) | Break(_) ->
        raise (Failure "unsupported control expression in interpreter")
    | App(f, args) ->
        (try
          let fundef = FunctionChecker.findFunction (Id.L(Id.to_string f)) in 
          match fundef with 
            | None -> raise (Failure ("function " ^ (Id.to_string f) ^ " not found"))
            | Some(fundef) ->
              let pure = FunctionChecker.checkFunctionPurity fundef in
              if not pure then raise (Failure ("function " ^ (Id.to_string f) ^ " is not pure"));
              let arg_values = List.map (fun arg ->
                if memi arg env then Int (findi arg env)
                else if memf arg env then Float (findf arg env)
                else raise (Failure ("arg " ^ (Id.to_string arg) ^ " is not const"))
              ) args in
              let memo_key = (Id.to_string f, arg_values) in
              (match MemoTable.find_opt memo_key !memo_table with
              | Some (Ok result) ->
                  result
              | Some (Error msg) ->
                  raise (Failure msg)
              | None ->
                  let env' = List.fold_left2 (fun acc (param, _) value ->
                    M.add param value acc
                  ) M.empty fundef.args arg_values in

                  try
                    let result = interpret env' fundef.body in
                    memo_table := MemoTable.add memo_key (Ok result) !memo_table;
                    result
                  with
                  | Failure msg as e ->
                      memo_table := MemoTable.add memo_key (Error msg) !memo_table;
                      raise e)
        with
        | Failure msg -> raise (Failure msg))
    | _ -> raise (Failure "unsupported expression in interpreter")

let rec g env = function (* 定数畳み込みルーチン本体 *)
  | Var(x) when memi x env -> Int(findi x env)
  (* | Var(x) when memf x env -> Float(findf x env) *)
  (* | Var(x) when memt x env -> Tuple(findt x env) *)
  | Neg(x) when memi x env -> Int(-(findi x env))
  | Add(x, y) when memi x env && memi y env -> Int(findi x env + findi y env)
  | Sub(x, y) when memi x env && memi y env -> Int(findi x env - findi y env)
  | FNeg(x) when memf x env -> Float(-.(findf x env))
  | FAdd(x, y) when memf x env && memf y env -> Float(findf x env +. findf y env)
  | FSub(x, y) when memf x env && memf y env -> Float(findf x env -. findf y env)
  | FMul(x, y) when memf x env && memf y env -> Float(findf x env *. findf y env)
  | FDiv(x, y) when memf x env && memf y env -> Float(findf x env /. findf y env)
  | IfEq(x, y, e1, e2) when memi x env && memi y env -> if findi x env = findi y env then g env e1 else g env e2
  | IfEq(x, y, e1, e2) when memf x env && memf y env -> if findf x env = findf y env then g env e1 else g env e2
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g env e1, g env e2)
  | IfLE(x, y, e1, e2) when memi x env && memi y env -> if findi x env <= findi y env then g env e1 else g env e2
  | IfLE(x, y, e1, e2) when memf x env && memf y env -> if findf x env <= findf y env then g env e1 else g env e2
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g env e1, g env e2)
  | Let((x, t), e1, e2) ->
      let e1' = g env e1 in
      let e2' = g (M.add x e1' env) e2 in
      Let((x, t), e1', e2')
  | LetRec({ name = x; args = ys; body = e1; tags = tags }, e2) ->
      let fundef = { name = x; args = ys; body = g env e1; tags = tags } in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, g env e2)
  | LetTuple(xts, y, e) when memt y env ->
      List.fold_left2
        (fun e' xt z -> Let(xt, Var(z), e'))
        (g env e)
        xts
        (findt y env)
  | LetTuple(xts, y, e) -> LetTuple(xts, y, g env e)
  | Assign(x, y, e) ->
      let env' =
        if memi y env then M.add x (Int(findi y env)) env
        else if memf y env then M.add x (Float(findf y env)) env
        else M.remove x env
      in
      Assign(x, y, g env' e)
  | While(e1, e2) ->
      While(g env e1, g M.empty e2)
  | Break(x) -> Break(x)
  | App(f, args) as app -> 
      (try
        let fundef = FunctionChecker.findFunction (Id.L(Id.to_string f)) in
        match fundef with
        | None -> app
        | Some(fundef) ->
          let pure = FunctionChecker.checkFunctionPurity fundef in
          if not pure then app else
          let arg_values = List.map (fun arg ->
            if memi arg env then Int (findi arg env)
            else if memf arg env then Float (findf arg env)
            else raise Not_found
          ) args in
          interp_steps := 0;
          Format.eprintf "const-folding %s@." (Id.to_string f);
          let memo_key = (Id.to_string f, arg_values) in
          let result = match MemoTable.find_opt memo_key !memo_table with
            | Some (Ok cached_result) ->
                cached_result
            | Some (Error msg) ->
                raise (Failure msg)
            | None ->
                interpret env app in
          result
      with
      | Not_found -> app
      | Failure msg ->
          Format.eprintf "  failed to const-fold %s: %s@." (Id.to_string f) msg;
          app)
  | e -> e

let f = g M.empty
