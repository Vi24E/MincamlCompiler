open KNormal

let max_interp_steps = Config.ConstFold.max_interp_steps
let interp_steps = ref 0

(* Collect all Assign target variables in an expression (for While env cleanup) *)
let rec collect_assign_targets acc = function
  | Assign(x, _, e, _) -> collect_assign_targets (S.add x acc) e
  | Let(_, e1, e2) | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | While(e1, e2) ->
      collect_assign_targets (collect_assign_targets acc e1) e2
  | LetRec({ body; _ }, e2) ->
      collect_assign_targets (collect_assign_targets acc body) e2
  | LetTuple(_, _, e) -> collect_assign_targets acc e
  | _ -> acc

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
    | Assign(_, _, _, _) | While(_, _) | Break(_) ->
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
  | Var(x) when memi x env -> (Int(findi x env), env)
  (* | Var(x) when memf x env -> Float(findf x env) *)
  (* | Var(x) when memt x env -> Tuple(findt x env) *)
  | Neg(x) when memi x env -> (Int(-(findi x env)), env)
  | Add(x, y) when memi x env && memi y env -> (Int(findi x env + findi y env), env)
  | Sub(x, y) when memi x env && memi y env -> (Int(findi x env - findi y env), env)
  | FNeg(x) when memf x env -> (Float(-.(findf x env)), env)
  | FAdd(x, y) when memf x env && memf y env -> (Float(findf x env +. findf y env), env)
  | FSub(x, y) when memf x env && memf y env -> (Float(findf x env -. findf y env), env)
  | FMul(x, y) when memf x env && memf y env -> (Float(findf x env *. findf y env), env)
  | FDiv(x, y) when memf x env && memf y env -> (Float(findf x env /. findf y env), env)
  | IfEq(x, y, e1, e2) when memi x env && memi y env -> if findi x env = findi y env then g env e1 else g env e2
  | IfEq(x, y, e1, e2) when memf x env && memf y env -> if findf x env = findf y env then g env e1 else g env e2
  | IfEq(x, y, e1, e2) ->
      let (e1', env1) = g env e1 in
      let (e2', env2) = g env e2 in
      let merged = M.fold (fun k v acc -> M.add k v acc) env2 env1 in
      (IfEq(x, y, e1', e2'), merged)
  | IfLE(x, y, e1, e2) when memi x env && memi y env -> if findi x env <= findi y env then g env e1 else g env e2
  | IfLE(x, y, e1, e2) when memf x env && memf y env -> if findf x env <= findf y env then g env e1 else g env e2
  | IfLE(x, y, e1, e2) ->
      let (e1', env1) = g env e1 in
      let (e2', env2) = g env e2 in
      let merged = M.fold (fun k v acc -> M.add k v acc) env2 env1 in
      (IfLE(x, y, e1', e2'), merged)
  | Let((x, t), e1, e2) ->
      let (e1', env1) = g env e1 in
      let (e2', env2) = g (M.add x e1' env1) e2 in
      (Let((x, t), e1', e2'), env2)
  | LetRec({ name = x; args = ys; body = e1; tags = tags }, e2) ->
      let (body', _) = g env e1 in
      let fundef = { name = x; args = ys; body = body'; tags = tags } in
      FunctionChecker.registerFunctionDef fundef;
      let (e2', env2) = g env e2 in
      (LetRec(fundef, e2'), env2)
  | LetTuple(xts, y, e) when memt y env ->
      let (e', env') = g env e in
      (List.fold_left2
        (fun e' xt z -> Let(xt, Var(z), e'))
        e'
        xts
        (findt y env), env')
  | LetTuple(xts, y, e) ->
      let (e', env') = g env e in
      (LetTuple(xts, y, e'), env')
  | Assign(x, y, e, tag) ->
      let env' =
        if memi y env then M.add x (Int(findi y env)) env
        else if memf y env then M.add x (Float(findf y env)) env
        else M.remove x env
      in
      let (e', env_out) = g env' e in
      (Assign(x, y, e', tag), env_out)
  | TernPhi(c, x, y) ->
      (match findi c env with
      | 0 -> (Var(y), env)
      | _ -> (Var(x), env)
      | exception Not_found -> (TernPhi(c, x, y), env))
  | While(e1, e2) ->
      (* Remove mutable variables (Assign targets in body) from env
         for the condition, so loop counters are not folded to their
         initial constants.  The body already uses M.empty. *)
      let mutable_in_body = collect_assign_targets S.empty e2 in
      let safe_env = M.fold (fun k v acc ->
        if S.mem k mutable_in_body then acc else M.add k v acc
      ) env M.empty in
      let (e1', _) = g safe_env e1 in
      let (e2', _) = g M.empty e2 in
      (While(e1', e2'), safe_env)
  | Break(x) -> (Break(x), env)
  | App(f, args) as app -> 
      (try
        let fundef = FunctionChecker.findFunction (Id.L(Id.to_string f)) in
        match fundef with
        | None -> (app, env)
        | Some(fundef) ->
          let pure = FunctionChecker.checkFunctionPurity fundef in
          if not pure then (app, env) else
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
          (result, env)
      with
      | Not_found -> (app, env)
      | Failure msg ->
          Format.eprintf "  failed to const-fold %s: %s@." (Id.to_string f) msg;
          (app, env))
  | e -> (e, env)

let f e = fst (g M.empty e)
