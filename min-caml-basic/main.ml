let limit = Config.Main.iter_limit
let enable_loop_insert = Config.Main.enable_loop_insert
let debug = Config.Main.inline_debug

let rec iter n e =
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = e |> VariableChecker.f
             |> ArrayScalarize.f
             |> TupleElim.f
             |> ArrayElim.f
             |> TernPhiInsert.f
             |> Elim.f
             |> ConstFold.f
             |> CommonExpElim.f
             |> Inline.f
             |> Assoc.f
             |> Beta.f
             |> LoopInvariant.f ~peel:false in
  if e = e' then e else
  iter (n - 1) e'

let lexbuf filename outchan l =
  Id.counter := 0;
  Typing.extenv := M.empty;
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
      alpha |> TupleElim.f
            |> ConstFold.f
            |> Assoc.f
            |> Beta.f
            |> Elim.f
            |> LoopInsert.f
            |> LoopInvariant.f ~peel:false
            |> Inline.f
            (* |> LoopUnroll.f  *)
            |> FunctionChecker.f
    else
      alpha
  in
  let optimized = (iter !limit optimize_input |> VariableChecker.f) |> LoopInvariant.f ~peel:true in
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
     ("-virtual", Arg.Unit(fun () -> Asm.virtual_mode := true), "enable virtual register mode (infinite registers)");
     ("-debug", Arg.Unit(fun () -> debug := true), "enable debug markers (print_debug insertion)");
     ("--debug", Arg.Unit(fun () -> debug := true), "enable debug markers (print_debug insertion)")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  Inline.set_debug_trace !debug;
  List.iter
    (fun f -> ignore (file f))
    !files
