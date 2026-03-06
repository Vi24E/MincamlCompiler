module Main : sig
  val iter_limit : int ref
  val enable_loop_insert : bool ref
  val inline_debug : bool ref
end

module Inline : sig
  val threshold : int ref
  val debug_trace_enabled : bool ref
  val debug_map_path : string
end

module ConstFold : sig
  val max_interp_steps : int ref
end

module TupleElim : sig
  val threshold : int ref
end

module ArrayOfTupleElim : sig
  val threshold : int ref
end

module IfFold : sig
  val threshold : int ref
end

module LoopUnroll : sig
  val threshold : int ref
end

module ArrayScalarize : sig
  val max_indices : int ref
end

module ArrayElim : sig
  val max_size : int ref
  val dump_assignarray_ir : bool ref
end

module TernPhiInsert : sig
  val phi_threshold : int ref
  val small_if_threshold : int ref
  val trace_enabled : bool ref
  val fallback_enabled : bool ref
end

module TKA : sig
  module Virtual : sig
    val enable_if_simplify : bool ref
  end

  module Emit : sig
    val create_array_unroll_threshold : int ref
  end
end
