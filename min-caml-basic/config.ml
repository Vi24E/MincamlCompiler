(* Centralized compiler/runtime settings.
   This file is the single source of truth for tunables used in OCaml frontend
   and TKA backend pipeline. *)

module Main = struct
  (* Maximum number of iterative optimization rounds. (-iter) *)
  let iter_limit = ref 10

  (* Run LoopInsert pre-pass before iterative optimization. *)
  let enable_loop_insert = ref true

  (* Insert inline debug markers and dump inline-id map. (-debug/--debug) *)
  let inline_debug = ref false
end

module Inline = struct
  (* Maximum function size that can be inlined. (-inline) *)
  let threshold = ref 50000

  (* Whether inline debug markers are emitted. *)
  let debug_trace_enabled = ref false

  (* Output file path for inline debug id map. *)
  let debug_map_path = "test/inline_debug_map.txt"
end

module ConstFold = struct
  (* Interpreter step cap for partial evaluation in ConstFold. *)
  let max_interp_steps = ref 30000
end

module TupleElim = struct
  (* Maximum tuple arity handled by TupleElim. *)
  let threshold = ref 30
end

module ArrayOfTupleElim = struct
  (* Maximum tuple arity handled by ArrayOfTupleElim. *)
  let threshold = ref 6
end

module IfFold = struct
  (* Continuation-size threshold for IfFold transformation. *)
  let threshold = ref 30
end

module LoopUnroll = struct
  (* Maximum loop body size after unroll expansion. (-unroll) *)
  let threshold = ref 500
end

module ArrayScalarize = struct
  (* Maximum number of constant indices to scalarize per array argument. *)
  let max_indices = ref 8
end

module ArrayElim = struct
  (* Maximum constant array size eligible for scalar replacement. *)
  let max_size = ref 8

  (* Dump AssignArray pre-phi IR summaries for debugging. *)
  let dump_assignarray_ir = ref false
end

module TernPhiInsert = struct
  (* Size threshold used by TernPhi fallback heuristic. *)
  let phi_threshold = ref 20

  (* Maximum branch size for if-to-TernPhi conversion. *)
  let small_if_threshold = ref 6

  (* Dump detailed TernPhiInsert trace logs. *)
  let trace_enabled = ref false

  (* Enable fallback join path for large if-joins. *)
  let fallback_enabled = ref false
end

module TKA = struct
  module Virtual = struct
    (* Enable if-simplify lowering in TKA virtual instruction selection. *)
    let enable_if_simplify = ref true
  end

  module Emit = struct
    (* Const-size create_array/create_float_array full-unroll upper bound. *)
    let create_array_unroll_threshold = ref 8
  end
end
