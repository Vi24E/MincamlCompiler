let rec type_to_string = function
  | Type.Unit -> "Unit"
  | Type.Bool -> "Bool"  
  | Type.Int -> "Int"
  | Type.Float -> "Float"
  | Type.Fun (args, ret) -> 
      let args_str = String.concat ", " (List.map type_to_string args) in
      "Fun([" ^ args_str ^ "], " ^ type_to_string ret ^ ")"
  | Type.Tuple ts ->
      let elems_str = String.concat ", " (List.map type_to_string ts) in
      "Tuple([" ^ elems_str ^ "])"
  | Type.Array t -> "Array(" ^ type_to_string t ^ ")"
  | Type.Var r ->
      match !r with
      | Some t -> type_to_string t
      | None -> "Var(?)"

let rec syntax_to_string = function
  | Syntax.Unit -> "Unit"
  | Syntax.Bool b -> "Bool(" ^ string_of_bool b ^ ")"
  | Syntax.Int i -> "Int(" ^ string_of_int i ^ ")"
  | Syntax.Float d -> "Float(" ^ string_of_float d ^ ")"
  | Syntax.Not t -> "Not(" ^ syntax_to_string t ^ ")"
  | Syntax.Neg t -> "Neg(" ^ syntax_to_string t ^ ")"
  | Syntax.Add (t1, t2) -> "Add(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Sub (t1, t2) -> "Sub(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Mul (t1, t2) -> "Mul(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Div (t1, t2) -> "Div(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.FNeg t -> "FNeg(" ^ syntax_to_string t ^ ")"

  | Syntax.FAdd (t1, t2) -> "FAdd(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.FSub (t1, t2) -> "FSub(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.FMul (t1, t2) -> "FMul(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.FDiv (t1, t2) -> "FDiv(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Eq (t1, t2) -> "Eq(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.LE (t1, t2) -> "LE(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.If (t1, t2, t3) -> "If(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ "," ^ syntax_to_string t3 ^ ")"
  | Syntax.Let ((id, ty), t1, t2) -> "Let((" ^ (Id.to_string id) ^ "," ^ type_to_string ty ^ ")," ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Var id -> "Var(" ^ (Id.to_string id) ^ ")"
  | Syntax.LetRec (fundef, t) ->
      let args_str = String.concat "," (List.map (fun (id, ty) -> "(" ^ (Id.to_string id) ^ "," ^ type_to_string ty ^ ")") fundef.args) in
      "LetRec({name=(" ^ (Id.to_string (fst fundef.name)) ^ "," ^ type_to_string (snd fundef.name) ^ ");args=[" ^ args_str ^ "];body=" ^ syntax_to_string fundef.body ^ "}," ^ syntax_to_string t ^ ")"
  | Syntax.App (t, ts) ->
      let args_str = String.concat "," (List.map syntax_to_string ts) in
      "App(" ^ syntax_to_string t ^ ",[" ^ args_str ^ "])"
  | Syntax.Tuple ts ->
      let elems_str = String.concat "," (List.map syntax_to_string ts) in
      "Tuple([" ^ elems_str ^ "])"
  | Syntax.LetTuple (xts, t1, t2) ->
      let vars_str = String.concat "," (List.map (fun (id, ty) -> "(" ^ (Id.to_string id) ^ "," ^ type_to_string ty ^ ")") xts) in
      "LetTuple([" ^ vars_str ^ "]," ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Array (t1, t2) -> "Array(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Get (t1, t2) -> "Get(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ ")"
  | Syntax.Put (t1, t2, t3) -> "Put(" ^ syntax_to_string t1 ^ "," ^ syntax_to_string t2 ^ "," ^ syntax_to_string t3 ^ ")"

let rec knormal_to_string = function
  | KNormal.Unit -> "Unit"
  | KNormal.Int i -> string_of_int i
  | KNormal.Float d -> string_of_float d 
  | KNormal.Neg id -> "-" ^ (Id.to_string id)
  | KNormal.Add (id1, id2) -> (Id.to_string id1) ^ " + " ^ (Id.to_string id2)
  | KNormal.Sub (id1, id2) -> (Id.to_string id1) ^ " - " ^ (Id.to_string id2)
  | KNormal.Sll (id1, id2) -> (Id.to_string id1) ^ " << " ^ (Id.to_string id2)
  | KNormal.Sra (id1, id2) -> (Id.to_string id1) ^ " >> " ^ (Id.to_string id2)
  | KNormal.FNeg id -> "-" ^ (Id.to_string id)
  | KNormal.FAdd (id1, id2) -> (Id.to_string id1) ^ " + " ^ (Id.to_string id2)
  | KNormal.FSub (id1, id2) -> (Id.to_string id1) ^ " - " ^ (Id.to_string id2)
  | KNormal.FMul (id1, id2) -> (Id.to_string id1) ^ " * " ^ (Id.to_string id2)
  | KNormal.FDiv (id1, id2) -> (Id.to_string id1) ^ " / " ^ (Id.to_string id2)
  | KNormal.IfEq (id1, id2, t1, t2) -> "If (" ^ (Id.to_string id1) ^ " = " ^ (Id.to_string id2) ^ ") {\n" ^ knormal_to_string t1 ^ "\n}\nelse {\n" ^ knormal_to_string t2 ^ "\n}"
  | KNormal.IfLE (id1, id2, t1, t2) -> "If (" ^ (Id.to_string id1) ^ " <= " ^ (Id.to_string id2) ^ ") {\n" ^ knormal_to_string t1 ^ "\n}\nelse {\n" ^ knormal_to_string t2 ^ "\n}"
  | KNormal.Let ((id, ty), t1, t2) -> type_to_string ty ^ " " ^ (Id.to_string id) ^ " = " ^ knormal_to_string t1 ^ ";\n" ^ knormal_to_string t2
  | KNormal.Var id -> (Id.to_string id)
  | KNormal.LetRec (fundef, t) ->
      let tag =
        if FunctionChecker.checkFunctionPurity fundef then "Pure" else "Impure"
      in
      let args_str = String.concat ", " (List.map (fun (id, ty) -> "(" ^ (Id.to_string id) ^ ", " ^ type_to_string ty ^ ")") fundef.args) in
      "LetRec{\nname: (" ^ (Id.to_string (fst fundef.name)) ^ ", " ^ type_to_string (snd fundef.name) ^ ");\nargs: [" ^ args_str ^ "];\ntag: " ^ tag ^ ";\nbody: \n" ^ knormal_to_string fundef.body ^ "\n}\n" ^ knormal_to_string t
  | KNormal.App (id, ids) ->
      let args_str = String.concat ", " (List.map Id.to_string ids) in
      (Id.to_string id) ^ "(" ^ args_str ^ ")"
  | KNormal.Tuple ids ->
      let elems_str = String.concat ", " (List.map Id.to_string ids) in
      "(" ^ elems_str ^ ")"
  | KNormal.LetTuple (xts, id, t) ->
      let vars_str = String.concat ", " (List.map (fun (id, ty) -> "(" ^ (Id.to_string id) ^ ", " ^ type_to_string ty ^ ")") xts) in
      "(" ^ vars_str ^ ") = " ^ (Id.to_string id) ^ ";\n" ^ knormal_to_string t
  | KNormal.Get (id1, id2) -> (Id.to_string id1) ^ "[" ^ (Id.to_string id2) ^ "]"
  | KNormal.Put (id1, id2, id3) -> (Id.to_string id1) ^ "[" ^ (Id.to_string id2) ^ "] = " ^ (Id.to_string id3) ^ ";\n"
  | KNormal.ExtArray id -> "ExtArray(" ^ (Id.to_string id) ^ ")"
  | KNormal.ExtFunApp (id, ids) ->
      let args_str = String.concat ", " (List.map Id.to_string ids) in
      "__Ext__ " ^ (Id.to_string id) ^ "(" ^ args_str ^ ")"
  | KNormal.TernPhi (c, x, y) ->
      "TernPhi(" ^ Id.to_string c ^ ", " ^ Id.to_string x ^ ", " ^ Id.to_string y ^ ")"
  | KNormal.Assign (x, y, e, tag) ->
      let tag_s =
        match tag with
        | KNormal.AssignWhile -> "while"
        | KNormal.AssignArray -> "array"
      in
      (Id.to_string x) ^ " <- " ^ (Id.to_string y) ^ " {" ^ tag_s ^ "};\n" ^ knormal_to_string e
  | KNormal.While (cond, body) ->
      "while (" ^ knormal_to_string cond ^ ") {\n" ^ knormal_to_string body ^ "\n}"
  | KNormal.Break x ->
      "break " ^ (Id.to_string x)

let line_separator s =
  let len = String.length s in
  let tab_num = ref 0 in
  let closed_paren_flag = ref false in
  let is_open_paren c = (c = '(' || c = '[' || c = '{') in
  let is_close_paren c = (c = ')' || c = ']' || c = '}') in
  let is_separator c = (c = ',' || c = ';') in
  let rec tabs n = if n <= 0 then "" else "    " ^ tabs (n - 1) in
  let f s i =
    let c0 = s.[i] in
    let c1 = if i + 1 < len then s.[i + 1] else char_of_int(0) in
    match (c0, c1) with
    | (c, c') when is_close_paren c && is_separator c' -> 
      tab_num := max 0 (!tab_num - 1);
      if c <> ']' then closed_paren_flag := true; 
      String.make 1 c
    | (c, _) when is_open_paren c ->
      tab_num := !tab_num + 1;
      if c = '{' then
        (closed_paren_flag := false;
        (String.make 1 c) ^ "\n" ^ (tabs !tab_num))
      else
        (String.make 1 c)
    | (c, c') when is_close_paren c && not (is_close_paren c') ->
      tab_num := max 0 (!tab_num - 1);
      closed_paren_flag := false;
      (String.make 1 c) ^ "\n" ^ (tabs !tab_num)
    | (c, _) when is_close_paren c ->
      tab_num := max 0 (!tab_num - 1);
      String.make 1 c
    | (c, _) when !closed_paren_flag && is_separator c -> 
      closed_paren_flag := false; 
      String.make 1 c ^ "\n" ^ (tabs !tab_num)
    | (';', _) -> 
      closed_paren_flag := false; 
      ";\n" ^ (tabs !tab_num)
    | (',', _) ->  
      ", "
    | ('=', _) ->  
      " = "
    | _ -> String.make 1 c0
  in
  let result = String.concat "" (List.init len (f s)) in
  String.split_on_char '\n' result
  |> List.map (fun line ->
    let rec count_leading_spaces s i acc =
      if i >= String.length s then acc
      else if s.[i] = ' ' then count_leading_spaces s (i + 1) (acc + 1)
      else acc
    in
    let spaces = count_leading_spaces line 0 0 in
    let content = String.sub line spaces (String.length line - spaces) in
    if spaces = 0 then line
    else String.make (spaces / 4 * 2) ' ' ^ content)
  |> String.concat "\n"

let indent str =
  let lines = String.split_on_char '\n' str in
  let depth = ref 0 in
  let count_char str c =
    String.fold_left (fun acc x -> if x = c then acc + 1 else acc) 0 str
  in
  let rec helper ls =
    match ls with
    | [] -> []
    | line :: rest -> 
      depth := !depth - (count_char line '}');
      let indented = ((String.make (max 0 !depth) '\t') ^ line) in
      depth := !depth + (count_char line '{');
      indented :: helper rest
  in
  String.concat "\n" (helper lines)

let anormal_to_string = knormal_to_string

let rec closure_to_string = function
  | Closure.Unit -> "Unit"
  | Closure.Int i -> string_of_int i
  | Closure.Float d -> string_of_float d
  | Closure.Neg id -> "-" ^ (Id.to_string id)
  | Closure.Add (id1, id2) -> (Id.to_string id1) ^ " + " ^ (Id.to_string id2)
  | Closure.Sub (id1, id2) -> (Id.to_string id1) ^ " - " ^ (Id.to_string id2)
  | Closure.Sll (id1, id2) -> (Id.to_string id1) ^ " << " ^ (Id.to_string id2)
  | Closure.Sra (id1, id2) -> (Id.to_string id1) ^ " >> " ^ (Id.to_string id2)
  | Closure.FNeg id -> "-" ^ (Id.to_string id)
  | Closure.FAdd (id1, id2) -> (Id.to_string id1) ^ " + " ^ (Id.to_string id2)
  | Closure.FSub (id1, id2) -> (Id.to_string id1) ^ " - " ^ (Id.to_string id2)
  | Closure.FMul (id1, id2) -> (Id.to_string id1) ^ " * " ^ (Id.to_string id2)
  | Closure.FDiv (id1, id2) -> (Id.to_string id1) ^ " / " ^ (Id.to_string id2)
  | Closure.IfEq (id1, id2, t1, t2) -> "If (" ^ (Id.to_string id1) ^ " = " ^ (Id.to_string id2) ^ ") {\n" ^ closure_to_string t1 ^ "\n}\nelse {\n" ^ closure_to_string t2 ^ "\n}"
  | Closure.IfLE (id1, id2, t1, t2) -> "If (" ^ (Id.to_string id1) ^ " <= " ^ (Id.to_string id2) ^ ") {\n" ^ closure_to_string t1 ^ "\n}\nelse {\n" ^ closure_to_string t2 ^ "\n}"
  | Closure.Let ((id, ty), t1, t2) -> type_to_string ty ^ " " ^ (Id.to_string id) ^ " = " ^ closure_to_string t1 ^ ";\n" ^ closure_to_string t2
  | Closure.Var id -> (Id.to_string id)
  | Closure.MakeCls ((id, ty), { Closure.entry = l; actual_fv = ys }, t) ->
      let closure_label = match l with Id.L(s) -> s in
      let actual_fv_str = String.concat ", " (List.map Id.to_string ys) in
      type_to_string ty ^ " " ^ (Id.to_string id) ^ " = MakeCls(" ^ closure_label ^ ", [" ^ actual_fv_str ^ "]);\n" ^ closure_to_string t
  | Closure.AppCls (id, ids) ->
      let args_str = String.concat ", " (List.map Id.to_string ids) in
      (Id.to_string id) ^ "[[Cls]](" ^ args_str ^ ")"
  | Closure.AppDir (label, ids) ->
      let label_str = match label with Id.L(s) -> s in
      let args_str = String.concat ", " (List.map Id.to_string ids) in
      label_str ^ "[[Dir]](" ^ args_str ^ ")"
  | Closure.Tuple ids ->
      let elems_str = String.concat ", " (List.map Id.to_string ids) in
      "(" ^ elems_str ^ ")"
  | Closure.LetTuple (xts, id, t) ->
      let vars_str = String.concat ", " (List.map (fun (id, ty) -> "(" ^ (Id.to_string id) ^ ", " ^ type_to_string ty ^ ")") xts) in
      "(" ^ vars_str ^ ") = " ^ (Id.to_string id) ^ ";\n" ^ closure_to_string t
  | Closure.Get (id1, id2) -> (Id.to_string id1) ^ "[" ^ (Id.to_string id2) ^ "]"
  | Closure.Put (id1, id2, id3) -> (Id.to_string id1) ^ "[" ^ (Id.to_string id2) ^ "] = " ^ (Id.to_string id3) ^ ";\n"
  | Closure.ExtArray label -> 
      let label_str = match label with Id.L(s) -> s in
      "ExtArray(" ^ label_str ^ ")"
  | Closure.TernPhi (c, x, y) ->
      "TernPhi(" ^ Id.to_string c ^ ", " ^ Id.to_string x ^ ", " ^ Id.to_string y ^ ")"
  | Closure.Loop e ->
      "loop {\n" ^ closure_to_string e ^ "\n}"
  | Closure.Assign (x, y, e) ->
      (Id.to_string x) ^ " <- " ^ (Id.to_string y) ^ ";\n" ^ closure_to_string e
  | Closure.Break x ->
      "break " ^ (Id.to_string x)

let print_syntax filename code =
  let code_str = syntax_to_string code in
  let code_str = line_separator code_str in
  let outchan = open_out filename in
  Printf.fprintf outchan "%s\n" code_str;
  close_out outchan

let print_knormal filename code =
  let code_str = knormal_to_string code in
  let code_str = indent code_str in
  let outchan = open_out filename in
  Printf.fprintf outchan "%s\n" code_str;
  close_out outchan

let print_anormal filename code =
  let code_str = anormal_to_string code in
  let code_str = indent code_str in
  let outchan = open_out filename in
  Printf.fprintf outchan "%s\n" code_str;
  close_out outchan

let closure_fundef_to_string (fundef : Closure.fundef) =
  let (Id.L(name), ty) = fundef.Closure.name in
  let args_str = String.concat ", " (List.map (fun (id, ty) -> "(" ^ (Id.to_string id) ^ ", " ^ type_to_string ty ^ ")") fundef.Closure.args) in
  let body_str = closure_to_string fundef.Closure.body in
  "LetRec{\nname: (" ^ name ^ ", " ^ type_to_string ty ^ ");\nargs: [" ^ args_str ^ "];\nbody: \n" ^ body_str ^ "\n}\n"

let print_closure filename prog =
  let Closure.Prog (fundefs, main_expr) = prog in
  let code_str = 
    String.concat "" (List.map closure_fundef_to_string fundefs) ^
    closure_to_string main_expr
  in
  let code_str = indent code_str in
  let outchan = open_out filename in
  Printf.fprintf outchan "%s\n" code_str;
  close_out outchan
