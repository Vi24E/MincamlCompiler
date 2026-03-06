open KNormal

(* インライン展開する関数の最大サイズ (caml2html: inline_threshold) *)
let threshold = Config.Inline.threshold (* Mainで-inlineオプションによりセットされる *)

let same_id x y = Id.compare x y = 0
let uses_id = same_id

let inline_debug_trace_enabled = Config.Inline.debug_trace_enabled

let set_debug_trace b =
  inline_debug_trace_enabled := b

module SM = Map.Make(String)

let debug_id_map : int SM.t ref = ref SM.empty
let debug_id_entries : (int * string) list ref = ref []
let next_debug_id = ref 1

let inline_debug_map_path () =
  Config.Inline.debug_map_path

let get_or_assign_debug_id f =
  let name = Id.to_string f in
  match SM.find_opt name !debug_id_map with
  | Some id -> id
  | None ->
      let id = !next_debug_id in
      incr next_debug_id;
      debug_id_map := SM.add name id !debug_id_map;
      debug_id_entries := (id, name) :: !debug_id_entries;
      id

let make_inline_debug_marker f body =
  if not !inline_debug_trace_enabled then body
  else
    let marker_fn = (Printf.sprintf "print_debug.%d" (get_or_assign_debug_id f), Id.Unknown) in
    let dbg_tmp = Id.gentmp Type.Unit in
    Let((dbg_tmp, Type.Unit), ExtFunApp(marker_fn, []), body)

let dump_inline_debug_map () =
  if !inline_debug_trace_enabled then begin
    let path = inline_debug_map_path () in
    let oc = open_out path in
    List.rev !debug_id_entries
    |> List.iter (fun (id, name) -> Printf.fprintf oc "%d %s\n" id name);
    close_out oc
  end

let rec size = function
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2)
  | LetRec({ body = e1; tags = _; _ }, e2)
  | While(e1, e2) -> 1 + size e1 + size e2
  | Let(_, e1, e2) -> 
    (match e1 with
    | Int(_) -> size e2
    | _ -> 1 + size e1 + size e2)
  | Assign(_, _, e1, _) -> 1 + size e1
  | LetTuple(_, _, e) -> 1 + size e
  | TernPhi(_, _, _) -> 1
  | _ -> 1

(* true if function [name] has a self-recursive call in non-tail position. *)
let rec has_non_tail_self_call name tail_pos = function
  | App(f, _) when same_id f name -> not tail_pos
  | App(_, _) -> false
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) ->
      has_non_tail_self_call name tail_pos e1
      || has_non_tail_self_call name tail_pos e2
  | Let((x, _), e1, e2) ->
      let e1_tail =
        tail_pos
        &&
        match e2 with
        | Var(y) when same_id x y -> true
        | _ -> false
      in
      has_non_tail_self_call name e1_tail e1
      || has_non_tail_self_call name tail_pos e2
  | LetRec({ name = (f, _); body; tags = _; args = _ }, e2) ->
      if same_id f name then
        has_non_tail_self_call name tail_pos e2
      else
        has_non_tail_self_call name false body
        || has_non_tail_self_call name tail_pos e2
  | LetTuple(_, _, e) ->
      has_non_tail_self_call name tail_pos e
  | Assign(_, _, e, _) ->
      has_non_tail_self_call name tail_pos e
  | TernPhi(c, x, y) ->
      uses_id name c || uses_id name x || uses_id name y
  | While(e1, e2) ->
      has_non_tail_self_call name false e1
      || has_non_tail_self_call name false e2
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _) | Sll(_, _) | Sra(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _) | Var(_) | Tuple(_)
  | Get(_, _) | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _) | Break(_) ->
      false

let rec g env = function (* インライン展開ルーチン本体 (caml2html: inline_g) *)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g env e1, g env e2)
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g env e1, g env e2)
  | Let(xt, e1, e2) -> Let(xt, g env e1, g env e2)
  | LetRec({ name = (x, t); args = yts; body = e1; tags = _ }, e2) -> (* 関数定義の場合 (caml2html: inline_letrec) *)
      let can_inline =
        size e1 <= !threshold
        && not (has_non_tail_self_call x true e1)
      in
      let env = if can_inline then M.add x (yts, e1) env else env in
      let fundef = { name = (x, t); args = yts; body = g env e1; tags = KNormal.default_tag() } in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, g env e2)
  | App(x, ys) when M.mem x env -> (* 関数適用の場合 (caml2html: inline_app) *)
      let (zs, e) = M.find x env in
      (* Format.eprintf "inlining %s@." x; *)
      let params' =
        List.map
          (fun (z, t) -> (Id.genid (Id.to_string z), t))
          zs
      in
      let alpha_env =
        List.fold_left2
          (fun env' (z, _t) (z', _t') -> M.add z z' env')
          M.empty
          zs
          params'
      in
      let (body', _) = Alpha.g alpha_env e in
      let inlined =
        List.fold_right2
          (fun (z', t) y acc -> Let((z', t), Var(y), acc))
          params'
          ys
          body'
      in
      make_inline_debug_marker x inlined
  | LetTuple(xts, y, e) -> LetTuple(xts, y, g env e)
  | Assign(x, y, e, tag) -> Assign(x, y, g env e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | While(e1, e2) -> While(g env e1, g env e2)
  | e -> e

let f e =
  let e' = g M.empty e in
  dump_inline_debug_map ();
  e'
