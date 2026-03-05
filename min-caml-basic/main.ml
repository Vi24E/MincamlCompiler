let limit = ref 10
let enable_loop_insert = ref true
let dump_base = ref "test/minrt"

let dump_stages_enabled () =
  match Sys.getenv_opt "DUMP_OPT_STAGES" with
  | Some("1") | Some("true") | Some("TRUE") -> true
  | _ -> false

let dump_stage filename stage e =
  if dump_stages_enabled () then
    Debug.print_anormal (Printf.sprintf "%s.%s" filename stage) e

let apply_constfold e =
  match Sys.getenv_opt "DISABLE_CONSTFOLD" with
  | Some("1") | Some("true") | Some("TRUE") -> e
  | _ -> ConstFold.f e

let stop_after_pass () =
  match Sys.getenv_opt "STOP_AFTER_PASS" with
  | Some s -> (try Some(int_of_string s) with _ -> None)
  | None -> None

let stop_at_iter () =
  match Sys.getenv_opt "STOP_AT_ITER" with
  | Some s -> (try Some(int_of_string s) with _ -> None)
  | None -> None

let rec iter n e =
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let stop = match stop_at_iter () with
    | Some target when n = target -> stop_after_pass ()
    | _ -> None in
  let e1 = VariableChecker.f e in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.01_variableChecker" n) e1 in
  if stop = Some 1 then e1 else
  let e2 = ArrayScalarize.f e1 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.02_arrayScalarize" n) e2 in
  if stop = Some 2 then e2 else
  let e3 = TupleElim.f e2 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.03_tupleElim" n) e3 in
  if stop = Some 3 then e3 else
  let e4 = ArrayElim.f e3 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.04_arrayElim" n) e4 in
  if stop = Some 4 then e4 else
  let e5 = Elim.f e4 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.05_elim" n) e5 in
  if stop = Some 5 then e5 else
  (* ConstFold disabled: If枝内のAssignで更新された定数envが枝外に漏れ、
     phi条件変数がInt(1)/Int(0)で誤って畳み込まれTernPhiが壊れるバグ。
     envマージの安全性が確保されるまで無効化。 *)
  let e6 = e5 (* apply_constfold e5 *) in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.06_constFold" n) e6 in
  if stop = Some 6 then e6 else
  let e7 = CommonExpElim.f e6 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.07_commonExpElim" n) e7 in
  if stop = Some 7 then e7 else
  let e8 = Inline.f e7 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.08_inline" n) e8 in
  if stop = Some 8 then e8 else
  let e9 = Assoc.f e8 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.09_assoc" n) e9 in
  if stop = Some 9 then e9 else
  let e10 = Beta.f e9 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.10_beta" n) e10 in
  if stop = Some 10 then e10 else
  let e' = LoopInvariant.f e10 in
  let () = dump_stage !dump_base (Printf.sprintf "iter%d.11_loopInvariant" n) e' in
  if e = e' then e else
  iter (n - 1) e'

let lexbuf filename outchan l =
  Id.counter := 0;
  Typing.extenv := M.empty;
  dump_base := filename;
  let syntax = Parser.exp Lexer.token l in
  Debug.print_syntax (filename ^ ".syntax") syntax;
  let anormal = syntax |> Typing.f
                       |> KNormal.f
                       |> ANormal.f in
  let alpha = anormal |> Alpha.f 
                      |> FunctionChecker.f 
                      |> Elim.f in
  Debug.print_anormal (filename ^ ".anormal") alpha;
  let optimize_input =
    if !enable_loop_insert then
      let p1 = TupleElim.f alpha in
      let () = dump_stage filename "pre.01_tupleElim" p1 in
      (* ConstFold disabled: 同上 *)
      let p2 = p1 (* apply_constfold p1 *) in
      let () = dump_stage filename "pre.02_constFold" p2 in
      let p3 = Assoc.f p2 in
      let () = dump_stage filename "pre.03_assoc" p3 in
      let p4 = Beta.f p3 in
      let () = dump_stage filename "pre.04_beta" p4 in
      let p5 = Elim.f p4 in
      let () = dump_stage filename "pre.05_elim" p5 in
      let p6 = LoopInsert.f p5 in
      let () = dump_stage filename "pre.06_loopInsert" p6 in
      let p7 = LoopInvariant.f ~peel:false p6 in
      let () = dump_stage filename "pre.07_loopInvariant" p7 in
      let p8 = Inline.f p7 in
      let () = dump_stage filename "pre.08_inline" p8 in
      (* |> LoopUnroll.f  *)
      let p9 = FunctionChecker.f p8 in
      let () = dump_stage filename "pre.09_functionChecker" p9 in
      p9
    else
      alpha
  in
  let optimized = iter !limit optimize_input |> VariableChecker.f in
  Debug.print_anormal (filename ^ ".optimized") optimized;
  let closure = Closure.f optimized in
  ClosureChecker.f closure;
  Debug.print_closure (filename ^ ".closure") closure;
  let virtual_asm = Virtual.f closure in
  let simm_asm = Simm.f virtual_asm in
  let alloc_asm = 
    if !Asm.virtual_mode then AllocVirtual.f simm_asm 
    else RegAlloc.f simm_asm in
  Emit.f outchan alloc_asm

let string s = lexbuf "string" stdout (Lexing.from_string s)

let file f =
  let inchan = open_in (f ^ ".ml") in
  let libchan = open_in "Lib/library.ml" in
  let liblen = in_channel_length libchan in
  let libstr = really_input_string libchan liblen in
  close_in libchan;
  let len = in_channel_length inchan in
  let str = really_input_string inchan len in
  close_in inchan;
  let outchan = open_out (f ^ ".s") in
  try
    lexbuf f outchan (Lexing.from_string (libstr ^ str));
    let asmchan = open_in "TKA/libmincaml.S" in
    let asmlen = in_channel_length asmchan in
    let asmstr = really_input_string asmchan asmlen in
    close_in asmchan;
    output_string outchan asmstr;
    close_out outchan;
  with e -> (close_out outchan; raise e)

let () =
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated");
     ("-loop-insert", Arg.Unit(fun () -> enable_loop_insert := true), "enable loop insertion before optimize iterations");
     ("-no-loop-insert", Arg.Unit(fun () -> enable_loop_insert := false), "disable loop insertion before optimize iterations");
     ("-unroll", Arg.Int(fun i -> LoopUnroll.threshold := max 0 i), "loop unroll size threshold for loop-inserted while(1)");
     ("-virtual", Arg.Unit(fun () -> Asm.virtual_mode := true), "enable virtual register mode (infinite registers)")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files
