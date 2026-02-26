open KNormal

let rec not_including_array t = 
	match t with
	| Type.Array(_) -> false
	| Type.Tuple(ts) -> List.for_all not_including_array ts
	| _ -> true
  

let rec not_shown e alias_env =
	match e with
	| Var(id) -> not (List.mem (Id.to_string id) alias_env)
	| Let((_, _), e1, e2) ->
		not_shown e1 alias_env && not_shown e2 alias_env
	| LetRec({ name = (_, _); args = _; body = e1; tags = _ }, e2) ->
		not_shown e1 alias_env && not_shown e2 alias_env
	| IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
		not_shown e1 alias_env && not_shown e2 alias_env
		| LetTuple(_, _, e) ->
			not_shown e alias_env
		| While(e1, e2) ->
			not_shown e1 alias_env && not_shown e2 alias_env
		| Assign(x, y, e) ->
			not (List.mem (Id.to_string x) alias_env)
			&& not (List.mem (Id.to_string y) alias_env)
			&& not_shown e alias_env
		| Break(x) -> not (List.mem (Id.to_string x) alias_env)
		| Put(x, _, _) -> not (List.mem (Id.to_string x) alias_env)
		| Get(x, _) -> not (List.mem (Id.to_string x) alias_env)
	| Tuple(xs) -> List.for_all (fun x -> not (List.mem (Id.to_string x) alias_env)) xs
	| App(_, xs) -> List.for_all (fun x -> not (List.mem (Id.to_string x) alias_env)) xs
	| ExtFunApp(_, xs) -> List.for_all (fun x -> not (List.mem (Id.to_string x) alias_env)) xs
	| _ -> true

let rec elimable target_id e alias_env is_branch is_tail =
	match e with
	| Var(id') when List.mem (Id.to_string id') alias_env -> not is_tail
	| Let((x, _), e1, e2) ->
		(match e1 with
		| Var(id') when List.mem (Id.to_string id') alias_env ->
			(* Alias tracking in eliminate() is not sound yet.
			   Reject elimination when array aliasing is introduced. *)
			false
		| _ ->
			let b1 = elimable target_id e1 alias_env is_branch false in
			let b2 = elimable target_id e2 alias_env is_branch is_tail in
			b1 && b2)
	| LetRec({ name = (x, _); args = _; body = e1; tags = _ }, e2) ->
		let new_alias_env = (Id.to_string x) :: alias_env in
		let b1 = not_shown e1 alias_env in
		let b2 = elimable target_id e2 new_alias_env is_branch is_tail in
		b1 && b2
	| IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
		let b1 = elimable target_id e1 alias_env true is_tail in
		let b2 = elimable target_id e2 alias_env true is_tail in
		b1 && b2
		| LetTuple(_, _, e) ->
			elimable target_id e alias_env is_branch is_tail
		| While(e1, e2) ->
			let b1 = elimable target_id e1 alias_env true false in
			let b2 = elimable target_id e2 alias_env true false in
			b1 && b2
		| Assign(x, y, e) ->
			if List.mem (Id.to_string x) alias_env || List.mem (Id.to_string y) alias_env then false
			else elimable target_id e alias_env is_branch is_tail
		| Break(x) -> not (List.mem (Id.to_string x) alias_env)
		| Put(_, _, z) when List.mem (Id.to_string z) alias_env -> false
	| Put(x, y, _) when List.mem (Id.to_string x) alias_env -> 
		if (not is_branch) then 
      match VariableChecker.find_const (Id.to_string y) with
      | Some(_) -> true
      | None -> false
		else false
	| Get(x, y) when List.mem (Id.to_string x) alias_env -> 
    (match VariableChecker.find_const (Id.to_string y) with
    | Some(_) -> true
    | None -> false)
	| Tuple(xs) -> List.for_all (fun x -> not (List.mem (Id.to_string x) alias_env)) xs
	| App(_, xs) -> List.for_all (fun x -> not (List.mem (Id.to_string x) alias_env)) xs
	| ExtFunApp(_, xs) -> List.for_all (fun x -> not (List.mem (Id.to_string x) alias_env)) xs
	| _ -> true

let rec eliminate target_x t_elem e env =
	match e with
	| Let((x', t_bind), e1, e2) when Id.to_string x' = Id.to_string target_x ->
		let init_val = (match e1 with 
		| ExtFunApp(("create_array", _), [_; v]) | ExtFunApp(("create_float_array", _), [_; v]) -> v
		| _ -> failwith "ArrayElim: Not Array")
		in 
		let len = Array.length env in
		let rec loop i =
			if i = len then eliminate target_x t_elem e2 env
			else Let((env.(i), t_elem), Var(init_val), loop (i + 1))
		in loop 0
	| Let((x, t_bind), e1, e2) ->
		let e1' = eliminate target_x t_elem e1 env in
		let e2' = eliminate target_x t_elem e2 env in
		Let((x, t_bind), e1', e2')
	| LetRec(fundef, e2) ->
		let e2' = eliminate target_x t_elem e2 env in
		LetRec(fundef, e2')
	| IfEq(x, y, e1, e2) ->
		let e1' = eliminate target_x t_elem e1 env in
		let e2' = eliminate target_x t_elem e2 env in
		IfEq(x, y, e1', e2')
	| IfLE(x, y, e1, e2) ->
		let e1' = eliminate target_x t_elem e1 env in
		let e2' = eliminate target_x t_elem e2 env in
		IfLE(x, y, e1', e2')
		| LetTuple(xts, y, e) ->
			let e' = eliminate target_x t_elem e env in
			LetTuple(xts, y, e')
		| Assign(x, y, e) ->
			Assign(x, y, eliminate target_x t_elem e env)
		| While(e1, e2) ->
			While(eliminate target_x t_elem e1 env, eliminate target_x t_elem e2 env)
		| Put(arr, y, z) when Id.to_string arr = Id.to_string target_x -> 
    (match VariableChecker.find_const (Id.to_string y) with
    | Some(offset) ->
      let new_id = Id.genid "ArrayElim" in
      Array.set env offset new_id;
      Let((new_id, t_elem), Var(z), Unit)
    | None -> assert false)
	| Get(arr, y) when Id.to_string arr = Id.to_string target_x -> 
    (match VariableChecker.find_const (Id.to_string y) with
    | Some(offset) -> Var(Array.get env offset)
    | None -> assert false)
	| _ -> e

let rec g e = 
	match e with
	| Let((x, t), e1, e2) -> 
		(match e1 with
		| ExtFunApp(("create_array", _), [c; _]) | ExtFunApp(("create_float_array", _), [c; _]) -> 
      (match VariableChecker.find_const (Id.to_string c) with
      | Some(size) ->
        let t' = match t with Array(t) -> t | _ -> assert false in
        if not_including_array t' && elimable x e2 [Id.to_string x] false true then
          (Format.eprintf "ElimArray! %s @\n" (Id.to_string x);
          let init_env = Array.init size (fun _ -> Id.genid "ArrayElim") in
          eliminate x t' e init_env)
        else
          let e1' = g e1 in
          let e2' = g e2 in
          Let((x, t), e1', e2')
      | None ->
        let e1' = g e1 in
        let e2' = g e2 in
        Let((x, t), e1', e2'))
		| _ -> 
			let e1' = g e1 in
			let e2' = g e2 in
			Let((x, t), e1', e2'))
	| LetRec({ name = (x, t); args = yts; body = e1; tags = tg }, e2) -> 
		let e1' = g e1 in
		let e2' = g e2 in
		let fundef' = { name = (x, t); args = yts; body = e1'; tags = tg } in
		FunctionChecker.registerFunctionDef fundef';
		LetRec(fundef', e2')
	| IfEq(x, y, e1, e2) -> 
		let e1' = g e1 in
		let e2' = g e2 in
		IfEq(x, y, e1', e2')
	| IfLE(x, y, e1, e2) -> 
		let e1' = g e1 in
		let e2' = g e2 in
		IfLE(x, y, e1', e2')
		| LetTuple(xts, y, e) -> 
			let e' = g e in
			LetTuple(xts, y, e')
		| Assign(x, y, e) ->
			Assign(x, y, g e)
		| While(e1, e2) ->
			While(g e1, g e2)
		| _ -> e


(* 使われないかも *)
let f e = g e
