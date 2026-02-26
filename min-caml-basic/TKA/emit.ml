open Asm

external get_single_bits : float -> int32 = "get_single_bits"

let stackset = ref S.empty
let stackmap = ref []
let save x =
  if Id.is_global x then () else begin
    stackset := S.add x !stackset;
    if not (List.mem x !stackmap) then
      stackmap := !stackmap @ [x]
  end
let savef x =
  if Id.is_global x then () else begin
    stackset := S.add x !stackset;
    if not (List.mem x !stackmap) then
      stackmap := !stackmap @ [x]
  end
let locate x =
  let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map (fun i -> i + 1) (loc zs)
    | _ :: zs -> List.map (fun i -> i + 1) (loc zs) in
  loc !stackmap
let offset x = 
  try 4 * List.hd (locate x)
  with Failure _ -> failwith ("offset: variable " ^ (Id.to_string x) ^ " not found in stack")
let stacksize () = align ((List.length !stackmap + 1) * 4)

let reg_zero = ("%i0", Id.Known(Id.Register, Id.None)) (* hardcoded as it is not exposed in asm.mli *)
let reg_fzero = ("%f0", Id.Known(Id.Register, Id.None)) (* hardcoded as it is not exposed in asm.mli *)

let check_imm i = -2048 <= i && i < 2048
let create_array_unroll_threshold = 8
let is_pos_zero_float f = Int64.bits_of_float f = 0L

let int_return_reg () =
  if !Asm.virtual_mode then regs.(0) else Asm.reg_cl

let float_return_reg () =
  if !Asm.virtual_mode then fregs.(0) else fregs.(Array.length fregs - 1)

let is_float_reg x =
  let s = Id.to_string x in
  String.length s >= 2 &&
  (String.sub s 0 2 = "%f" ||
   (String.length s >= 3 && String.sub s 0 3 = "%vf"))

let emit_movi oc r i =
  let r = Id.to_string r in
  if check_imm i then
    Printf.fprintf oc "\tmovi\t%s, %d\n" r i
  else begin
    let n = i in
    let lower = n land 0xFFF in
    let upper = (n lsr 12) land 0xFFFFF in
    if lower < 2048 then begin
      Printf.fprintf oc "\tmovui\t%s, %d\n" r upper;
      if lower <> 0 then Printf.fprintf oc "\taddi\t%s, %s, %d\n" r r lower
    end else begin
      Printf.fprintf oc "\tmovui\t%s, %d\n" r ((upper + 1) land 0xFFFFF);
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" r r (lower - 4096)
    end
  end

(* Helper to emit stack pointer adjustment with large immediate support *)
let emit_stack_op oc op_name reg_dst reg_src value =
  let reg_dst = Id.to_string reg_dst in
  let reg_src = Id.to_string reg_src in
  let reg_sw = Id.to_string reg_sw in
  if check_imm value then
    Printf.fprintf oc "\t%si\t%s, %s, %d\n" op_name reg_dst reg_src value
  else begin
    emit_movi oc Asm.reg_sw value;
    Printf.fprintf oc "\t%s\t%s, %s, %s\n" op_name reg_dst reg_src reg_sw
  end

let emit_addi oc reg_dst reg_src value = emit_stack_op oc "add" reg_dst reg_src value
let emit_subi oc reg_dst reg_src value = emit_stack_op oc "sub" reg_dst reg_src value

let check_word_imm_bytes off = off mod 4 = 0 && check_imm (off / 4)

let emit_word_mem oc op reg off base =
  let reg_sw = Id.to_string Asm.reg_sw in
  let enc_opt =
    if !Asm.virtual_mode then
      if check_imm off then Some off else None
    else if check_word_imm_bytes off then
      Some (off / 4)
    else
      None
  in
  match enc_opt with
  | Some(enc_off) ->
    Printf.fprintf oc "\t%s\t%s, %d(%s)\n" op reg enc_off base
  | None ->
    begin
      emit_movi oc Asm.reg_sw off;
      Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw base reg_sw;
      Printf.fprintf oc "\t%s\t%s, 0(%s)\n" op reg reg_sw
    end

let const_int_of_id = function
  | (_, Id.Known(_, Id.ConstInt i)) -> Some i
  | x when Id.to_string x = Id.to_string reg_zero -> Some 0
  | _ -> None

let const_float_of_id = function
  | (_, Id.Known(_, Id.ConstFloat f)) -> Some f
  | x when Id.to_string x = Id.to_string reg_fzero -> Some 0.0
  | _ -> None

let prepare_unrolled_int_fill oc y =
  match const_int_of_id y with
  | Some(0) -> Id.to_string reg_zero
  | Some(i) ->
      emit_movi oc Asm.reg_sw i;
      Id.to_string Asm.reg_sw
  | None -> Id.to_string y

let prepare_unrolled_float_fill oc z =
  match const_float_of_id z with
  | Some(f) when is_pos_zero_float f -> Id.to_string reg_fzero
  | Some(f) ->
      let bits = Int32.to_int (get_single_bits f) in
      emit_movi oc Asm.reg_sw bits;
      Printf.fprintf oc "\tmif\t%s, %s\n" (Id.to_string Asm.reg_fsw) (Id.to_string Asm.reg_sw);
      Id.to_string Asm.reg_fsw
  | None -> Id.to_string z

let small_const_count ys =
  match ys with
  | n :: _ ->
      (match const_int_of_id n with
      | Some c when 0 <= c && c <= create_array_unroll_threshold -> Some c
      | _ -> None)
  | [] -> None

let emit_unrolled_create_array oc ~is_float ~count ~ret_reg ~fill_reg =
  let hp = Id.to_string Asm.reg_hp in
  let op = if is_float then "sf" else "sw" in
  Printf.fprintf oc "\tmov\t%s, %s\n" ret_reg hp;
  for i = 0 to count - 1 do
    emit_word_mem oc op fill_reg (i * 4) hp
  done;
  emit_addi oc Asm.reg_hp Asm.reg_hp (count * 4)

let is_zero_int_fill y =
  match const_int_of_id y with
  | Some(0) -> true
  | _ -> false

let is_zero_float_fill z =
  match const_float_of_id z with
  | Some(f) when is_pos_zero_float f -> true
  | _ -> false

let emit_zero_filled_create_array_const oc ~count ~ret_reg =
  let hp = Id.to_string Asm.reg_hp in
  Printf.fprintf oc "\tmov\t%s, %s\n" ret_reg hp;
  emit_addi oc Asm.reg_hp Asm.reg_hp (count * 4)

let emit_zero_filled_create_array_dynamic oc ~count_reg ~ret_reg =
  let hp = Id.to_string Asm.reg_hp in
  let i15 = "%i15" in
  Printf.fprintf oc "\tmov\t%s, %s\n" i15 count_reg;
  Printf.fprintf oc "\tmov\t%s, %s\n" ret_reg hp;
  Printf.fprintf oc "\tslli\t%s, %s, 2\n" i15 i15;
  Printf.fprintf oc "\tadd\t%s, %s, %s\n" hp hp i15


(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
  (* remove identical moves *)
  let _, xys = List.partition (fun (x, y) -> Id.to_string x = Id.to_string y) xys in
  (* find acyclic moves *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | [], [] -> []
  | (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
      (y, sw) :: (x, y) :: shuffle sw (List.map (fun (y', z) -> (if y = y' then sw else y'), z) xys)
  | xys, acyc -> acyc @ shuffle sw xys

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)

(* Check if an expression is a no-op (unit value) *)
let is_nop = function Ans(Nop) -> true | _ -> false

(* True when control never falls through to the next instruction. *)
let rec must_terminate_t = function
  | Ans(exp) -> must_terminate_exp exp
  | Let((_, _), exp, e) ->
      if must_terminate_exp exp then true else must_terminate_t e
and must_terminate_exp = function
  | Break(_, _, _) -> true
  | IfEq(_, _, e1, e2)
  | IfLE(_, _, e1, e2)
  | IfFEq(_, _, e1, e2)
  | IfFLE(_, _, e1, e2) ->
      must_terminate_t e1 && must_terminate_t e2
  | _ -> false

(* Emit a direct conditional jump instruction (jeq/jleq/jlt) based on the given op.
   Loads the rhs into reg_sw if it's a constant or ConstInt variable.
   Returns the register string used as rhs. *)
let emit_cond_jump_op oc op lhs y' label =
  let reg_sw = Id.to_string Asm.reg_sw in
  let reg_zero_str = Id.to_string reg_zero in
  match y' with
  | V(y) ->
      (match y with
       | (_, Id.Known(_, Id.ConstInt 0)) ->
           Printf.fprintf oc "\t%s\t%s, %s, %s\n" op lhs reg_zero_str label
       | (_, Id.Known(_, Id.ConstInt i)) ->
           emit_movi oc Asm.reg_sw i;
           Printf.fprintf oc "\t%s\t%s, %s, %s\n" op lhs reg_sw label
       | _ ->
           let y_s = Id.to_string y in
           Printf.fprintf oc "\t%s\t%s, %s, %s\n" op lhs y_s label)
  | C(0) ->
      Printf.fprintf oc "\t%s\t%s, %s, %s\n" op lhs reg_zero_str label
  | C(i) ->
      emit_movi oc Asm.reg_sw i;
      Printf.fprintf oc "\t%s\t%s, %s, %s\n" op lhs reg_sw label

(* Emit a direct conditional jump for the negated version of IfLE:
   NOT(x <= y) = y < x, so emit jlt y, x, label.
   For C(i): NOT(x <= i) = i < x, load i into reg_sw then jlt reg_sw, x. *)
let emit_nle_jump oc lhs y' label =
  let reg_sw = Id.to_string Asm.reg_sw in
  let reg_zero_str = Id.to_string reg_zero in
  match y' with
  | V(y) ->
      (match y with
       | (_, Id.Known(_, Id.ConstInt 0)) ->
           Printf.fprintf oc "\tjlt\t%s, %s, %s\n" reg_zero_str lhs label
       | (_, Id.Known(_, Id.ConstInt i)) ->
           emit_movi oc Asm.reg_sw i;
           Printf.fprintf oc "\tjlt\t%s, %s, %s\n" reg_sw lhs label
       | _ ->
           let y_s = Id.to_string y in
           Printf.fprintf oc "\tjlt\t%s, %s, %s\n" y_s lhs label)
  | C(0) ->
      Printf.fprintf oc "\tjlt\t%s, %s, %s\n" reg_zero_str lhs label
  | C(i) ->
      emit_movi oc Asm.reg_sw i;
      Printf.fprintf oc "\tjlt\t%s, %s, %s\n" reg_sw lhs label

(* Pre-scan function to populate stackmap *)
let rec g_pre = function
  | Ans(exp) -> g_pre' exp
  | Let((_, _), exp, e) -> g_pre' exp; g_pre e
and g_pre' = function
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | IfFEq(_, _, e1, e2) | IfFLE(_, _, e1, e2) ->
      g_pre e1; g_pre e2
  | Loop(_, _, e) ->
      g_pre e
  | Save(x, y) when List.mem x allregs -> save y
  | Save(x, y) when List.mem x allfregs -> savef y
  | _ -> ()

let rec g oc ss = function (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc ss (dest, exp)
  | dest, Let((x, _), exp, e) ->
      g' oc ss (NonTail(x), exp);
      g oc ss (dest, e)
and g' oc ss = function (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
  (* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()
  | NonTail(x), SetInt(i) -> (* CE2025 Movi logic *)
      emit_movi oc x i
  | NonTail(x), SetFloat(f) -> 
      let i = Int32.to_int (get_single_bits f) in
      emit_movi oc Asm.reg_sw i;
      let x = Id.to_string x in
      let reg_sw = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tmif\t%s, %s\n" x reg_sw
  | NonTail(x), SetLabel(Id.L(y)) -> 
      let x = Id.to_string x in
      Printf.fprintf oc "\tset_label\t%s, %s\n" x y
  | NonTail(x), Mov(y) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      if x <> y then Printf.fprintf oc "\tmov\t%s, %s\n" x y
  | NonTail(x), Neg(y) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_zero = Id.to_string reg_zero in
      Printf.fprintf oc "\tsub\t%s, %s, %s\n" x reg_zero y
  | NonTail(x), Add(y, z') -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) ->
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\taddi\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 let reg_sw = Id.to_string Asm.reg_sw in
                 Printf.fprintf oc "\tadd\t%s, %s, %s\n" x y reg_sw))
  | NonTail(x), Sub(y, z') -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) ->
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tsubi\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tsub\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tsubi\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 let reg_sw = Id.to_string Asm.reg_sw in
                 Printf.fprintf oc "\tsub\t%s, %s, %s\n" x y reg_sw))
  | NonTail(x), Sll(y, z') ->  
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) -> 
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tslli\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tsll\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tslli\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 let reg_sw = Id.to_string Asm.reg_sw in
                 Printf.fprintf oc "\tsll\t%s, %s, %s\n" x y reg_sw))
  | NonTail(x), Sra(y, z') -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) -> 
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tsari\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tsar\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tsari\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 let reg_sw = Id.to_string Asm.reg_sw in
                 Printf.fprintf oc "\tsar\t%s, %s, %s\n" x y reg_sw))
  | NonTail(x), Ld(y, V(z)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z with
       | (_, Id.Known(_, Id.ConstInt i)) ->
           emit_word_mem oc "lw" x i y
       | _ ->
           let z = Id.to_string z in
           let reg_sw = Id.to_string Asm.reg_sw in
           Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw y z;
           Printf.fprintf oc "\tlw\t%s, 0(%s)\n" x reg_sw)
  | NonTail(x), Ld(y, C(i)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      emit_word_mem oc "lw" x i y
  | NonTail(_), St(x, y, V(z)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z with
       | (_, Id.Known(_, Id.ConstInt i)) ->
           emit_word_mem oc "sw" x i y
       | _ ->
           let z = Id.to_string z in
           let reg_sw = Id.to_string Asm.reg_sw in
           Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw y z;
           Printf.fprintf oc "\tsw\t%s, 0(%s)\n" x reg_sw)
  | NonTail(_), St(x, y, C(i)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      emit_word_mem oc "sw" x i y
  | NonTail(x), FMov(y) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      if x <> y then Printf.fprintf oc "\tfmov\t%s, %s\n" x y
  | NonTail(x), FNeg(y) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      Printf.fprintf oc "\tfneg\t%s, %s\n" x y
  | NonTail(x), FAdd(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tfadd\t%s, %s, %s\n" x y z
  | NonTail(x), FSub(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tfsub\t%s, %s, %s\n" x y z
  | NonTail(x), FMul(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tfmul\t%s, %s, %s\n" x y z
  | NonTail(x), FDiv(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" x y z
  | NonTail(x), FInv(y) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      Printf.fprintf oc "\tfinv\t%s, %s\n" x y
  | NonTail(x), CmpEq(y, z') ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) ->
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tceqi\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tceq\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tceqi\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 Printf.fprintf oc "\tceq\t%s, %s, %s\n" x y (Id.to_string Asm.reg_sw)))
  | NonTail(x), CmpLE(y, z') ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) ->
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tcleqi\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tcleq\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tcleqi\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 Printf.fprintf oc "\tcleq\t%s, %s, %s\n" x y (Id.to_string Asm.reg_sw)))
  | NonTail(x), CmpFEq(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tfeq\t%s, %s, %s\n" x y z
  | NonTail(x), CmpFLE(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tfleq\t%s, %s, %s\n" x y z
  | NonTail(x), CmpFLT(y, z) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\tflt\t%s, %s, %s\n" x y z
  | NonTail(x), CmpLT(y, z') ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z' with
       | V(z) ->
           (match z with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tclti\t%s, %s, %d\n" x y i
            | _ ->
                let z = Id.to_string z in
                Printf.fprintf oc "\tclt\t%s, %s, %s\n" x y z)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tclti\t%s, %s, %d\n" x y i
           else (emit_movi oc Asm.reg_sw i;
                 Printf.fprintf oc "\tclt\t%s, %s, %s\n" x y (Id.to_string Asm.reg_sw)))
  | NonTail(x), LdF(y, V(z)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z with
       | (_, Id.Known(_, Id.ConstInt i)) ->
           emit_word_mem oc "lf" x i y
       | _ ->
           let z = Id.to_string z in
           let reg_sw = Id.to_string Asm.reg_sw in
           Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw y z;
           Printf.fprintf oc "\tlf\t%s, 0(%s)\n" x reg_sw)
  | NonTail(x), LdF(y, C(i)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      emit_word_mem oc "lf" x i y
  | NonTail(_), StF(x, y, V(z)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      (match z with
       | (_, Id.Known(_, Id.ConstInt i)) ->
           emit_word_mem oc "sf" x i y
       | _ ->
           let z = Id.to_string z in
           let reg_sw = Id.to_string Asm.reg_sw in
           Printf.fprintf oc "\tadd\t%s, %s, %s\n" reg_sw y z;
           Printf.fprintf oc "\tsf\t%s, 0(%s)\n" x reg_sw)
  | NonTail(_), StF(x, y, C(i)) -> 
      let x = Id.to_string x in
      let y = Id.to_string y in
      emit_word_mem oc "sf" x i y
  | NonTail(_), Save(x, y) when Id.is_global y ->
      let off = Id.offset y in
      let reg_zero = Id.to_string reg_zero in
      let op = if is_float_reg x then "sf" else "sw" in
      emit_word_mem oc op (Id.to_string x) off reg_zero
  | NonTail(_), Save(x, y) when List.mem x allregs ->
      if not (S.mem y !stackset) then save y;
      let off = offset y in
      let x = Id.to_string x in
      let reg_sp = Id.to_string Asm.reg_sp in
      emit_word_mem oc "sw" x off reg_sp
  | NonTail(_), Save(x, y) when List.mem x allfregs ->
      if not (S.mem y !stackset) then savef y;
      let off = offset y in
      let x = Id.to_string x in
      let reg_sp = Id.to_string Asm.reg_sp in
      emit_word_mem oc "sf" x off reg_sp
  | NonTail(_), Save(_, _) -> ()
  | NonTail(x), Restore(y) when Id.is_global y ->
      let off = Id.offset y in
      let reg_zero = Id.to_string reg_zero in
      let op = if is_float_reg x then "lf" else "lw" in
      emit_word_mem oc op (Id.to_string x) off reg_zero
  | NonTail(x), Restore(y) when List.mem x allregs ->
      let off = offset y in
      let x = Id.to_string x in
      let reg_sp = Id.to_string Asm.reg_sp in
      emit_word_mem oc "lw" x off reg_sp
  | NonTail(x), Restore(y) when List.mem x allfregs ->
      let off = offset y in
      let x = Id.to_string x in
      let reg_sp = Id.to_string Asm.reg_sp in
      emit_word_mem oc "lf" x off reg_sp
  | NonTail(_), Restore(_) -> ()
  | NonTail(_), Assign(x, y) ->
      let x_s = Id.to_string x in
      let y_s = Id.to_string y in
      if is_float_reg x then (
        if x_s <> y_s then Printf.fprintf oc "\tfmov\t%s, %s\n" x_s y_s
      ) else if x_s <> y_s then
        Printf.fprintf oc "\tmov\t%s, %s\n" x_s y_s
  | NonTail(dest), Loop(Id.L(l_start), Id.L(l_end), e) ->
      Printf.fprintf oc "%s:\n" l_start;
      g oc ss (NonTail(Id.gentmp Type.Unit), e);
      g' oc ss (NonTail(Asm.reg_cl), SetLabel(Id.L(l_start)));
      Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" (Id.to_string reg_zero) (Id.to_string Asm.reg_cl);
      Printf.fprintf oc "%s:\n" l_end;
      let dest_s = Id.to_string dest in
      if is_float_reg dest then (
        let fsw = Id.to_string Asm.reg_fsw in
        if dest_s <> fsw then Printf.fprintf oc "\tfmov\t%s, %s\n" dest_s fsw
      ) else if dest_s <> "%unit" then (
        let sw = Id.to_string Asm.reg_sw in
        if dest_s <> sw then Printf.fprintf oc "\tmov\t%s, %s\n" dest_s sw
      )
  | NonTail(_), Break(x, t, Id.L(l)) ->
      (match t with
      | Type.Float ->
          let x = Id.to_string x in
          let fsw = Id.to_string Asm.reg_fsw in
          if x <> fsw then Printf.fprintf oc "\tfmov\t%s, %s\n" fsw x
      | _ ->
          let x = Id.to_string x in
          let sw = Id.to_string Asm.reg_sw in
          if x <> "%unit" && x <> sw then Printf.fprintf oc "\tmov\t%s, %s\n" sw x);
      g' oc ss (NonTail(Asm.reg_cl), SetLabel(Id.L(l)));
      Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" (Id.to_string reg_zero) (Id.to_string Asm.reg_cl)
  (* 末尾だったら計算結果をレジスタにセットしてリターン (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StF _ | Save _ as exp) ->
      g' oc ss (NonTail(Id.gentmp Type.Unit), exp);
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, (SetInt _ | SetLabel _ | Mov _ | Neg _ | Add _ | Sub _ | Sll _ | Sra _ | Ld _ | CmpEq _ | CmpLE _ | CmpLT _ | CmpFEq _ | CmpFLE _ | CmpFLT _ as exp) ->
      g' oc ss (NonTail(int_return_reg ()), exp);
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, (SetFloat _ | FMov _ | FNeg _ | FAdd _ | FSub _ | FMul _ | FDiv _ | FInv _ | LdF _ as exp) ->
      g' oc ss (NonTail(float_return_reg ()), exp);
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, (Restore(x) as exp) ->
      (match locate x with
       | [_] -> g' oc ss (NonTail(int_return_reg ()), exp)
       | [i; j] when i + 1 = j -> g' oc ss (NonTail(float_return_reg ()), exp)
       | _ -> g' oc ss (NonTail(float_return_reg ()), exp)); 
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, Assign(x, y) ->
      let x_s = Id.to_string x in
      let y_s = Id.to_string y in
      if is_float_reg x then (
        if x_s <> y_s then Printf.fprintf oc "\tfmov\t%s, %s\n" x_s y_s
      ) else if x_s <> y_s then
        Printf.fprintf oc "\tmov\t%s, %s\n" x_s y_s;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, Loop(Id.L(l_start), Id.L(l_end), e) ->
      Printf.fprintf oc "%s:\n" l_start;
      g oc ss (NonTail(Id.gentmp Type.Unit), e);
      g' oc ss (NonTail(Asm.reg_cl), SetLabel(Id.L(l_start)));
      Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" (Id.to_string reg_zero) (Id.to_string Asm.reg_cl);
      Printf.fprintf oc "%s:\n" l_end;
      Printf.fprintf oc "\tmov\t%s, %s\n" (Id.to_string (int_return_reg ())) (Id.to_string Asm.reg_sw);
      Printf.fprintf oc "\tfmov\t%s, %s\n" (Id.to_string (float_return_reg ())) (Id.to_string Asm.reg_fsw);
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, Break(x, t, Id.L(l)) ->
      (match t with
      | Type.Float ->
          let x = Id.to_string x in
          let fsw = Id.to_string Asm.reg_fsw in
          if x <> fsw then Printf.fprintf oc "\tfmov\t%s, %s\n" fsw x
      | _ ->
          let x = Id.to_string x in
          let sw = Id.to_string Asm.reg_sw in
          if x <> "%unit" && x <> sw then Printf.fprintf oc "\tmov\t%s, %s\n" sw x);
      g' oc ss (NonTail(Asm.reg_cl), SetLabel(Id.L(l)));
      Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" (Id.to_string reg_zero) (Id.to_string Asm.reg_cl)
  (* Optimized: if x==y then () else e2 → jeq x,y,cont; e2; cont: ret *)
  | Tail, IfEq(x, y', e1, e2) when is_nop e1 ->
      let x_s = Id.to_string x in
      let reg_zero_s = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      emit_cond_jump_op oc "jeq" x_s y' b_cont_s;
      let stackset_back = !stackset in
      g oc ss (Tail, e2);
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := stackset_back;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero_s reg_ra
  (* Optimized: if x<=y then () else e2 → jleq x,y,cont; e2; cont: ret *)
  | Tail, IfLE(x, y', e1, e2) when is_nop e1 ->
      let x_s = Id.to_string x in
      let reg_zero_s = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      emit_cond_jump_op oc "jleq" x_s y' b_cont_s;
      let stackset_back = !stackset in
      g oc ss (Tail, e2);
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := stackset_back;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero_s reg_ra
  (* Optimized: if x<=y then e1 else () → NOT(x<=y)=y<x → jlt y,x,cont; e1; cont: ret *)
  | Tail, IfLE(x, y', e1, e2) when is_nop e2 ->
      let x_s = Id.to_string x in
      let reg_zero_s = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      emit_nle_jump oc x_s y' b_cont_s;
      let stackset_back = !stackset in
      g oc ss (Tail, e1);
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := stackset_back;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero_s reg_ra
  | Tail, IfEq(x, y', e1, e2) ->
      let x_s = Id.to_string x in
      let b_then = Id.genid "then" in
      let b_then_s = Id.to_string b_then in
      emit_cond_jump_op oc "jeq" x_s y' b_then_s;
      let stackset_back = !stackset in
      g oc ss (Tail, e2);
      Printf.fprintf oc "%s:\n" b_then_s;
      stackset := stackset_back;
      g oc ss (Tail, e1)
  | Tail, IfLE(x, y', e1, e2) ->
      let x_s = Id.to_string x in
      let b_then = Id.genid "then" in
      let b_then_s = Id.to_string b_then in
      emit_cond_jump_op oc "jleq" x_s y' b_then_s;
      let stackset_back = !stackset in
      g oc ss (Tail, e2);
      Printf.fprintf oc "%s:\n" b_then_s;
      stackset := stackset_back;
      g oc ss (Tail, e1)
  | Tail, IfFEq(x, y, e1, e2) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tfeq\t%s, %s, %s\n" reg_sw x y;
      g'_tail_if oc ss Asm.reg_sw e1 e2
  | Tail, IfFLE(x, y, e1, e2) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tfleq\t%s, %s, %s\n" reg_sw x y;
      g'_tail_if oc ss Asm.reg_sw e1 e2
  (* Optimized: if x==y then () else e2 → jeq x,y,cont; e2; cont: *)
  | NonTail(z), IfEq(x, y', e1, e2) when is_nop e1 ->
      let x_s = Id.to_string x in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      emit_cond_jump_op oc "jeq" x_s y' b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e2);
      let stackset2 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset_back stackset2
  (* Optimized: if x==y then e1 else () → ceq + jzero..cont (skip set_label+jmp) *)
  | NonTail(z), IfEq(x, y', e1, e2) when is_nop e2 ->
      let x_s = Id.to_string x in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      (match y' with
       | V(y) ->
           (match y with
            | (_, Id.Known(_, Id.ConstInt i)) when check_imm i ->
                Printf.fprintf oc "\tceqi\t%s, %s, %d\n" reg_sw x_s i
            | _ ->
                let y_s = Id.to_string y in
                Printf.fprintf oc "\tceq\t%s, %s, %s\n" reg_sw x_s y_s)
       | C(i) ->
           if check_imm i then Printf.fprintf oc "\tceqi\t%s, %s, %d\n" reg_sw x_s i
           else (emit_movi oc Asm.reg_sw i; Printf.fprintf oc "\tceq\t%s, %s, %s\n" reg_sw x_s reg_sw));
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero_s reg_sw b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e1);
      let stackset1 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset1 stackset_back
  (* Optimized: if x<=y then () else e2 → jleq x,y,cont; e2; cont: *)
  | NonTail(z), IfLE(x, y', e1, e2) when is_nop e1 ->
      let x_s = Id.to_string x in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      emit_cond_jump_op oc "jleq" x_s y' b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e2);
      let stackset2 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset_back stackset2
  (* Optimized: if x<=y then e1 else () → NOT(x<=y)=y<x → jlt y,x,cont; e1; cont: *)
  | NonTail(z), IfLE(x, y', e1, e2) when is_nop e2 ->
      let x_s = Id.to_string x in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      emit_nle_jump oc x_s y' b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e1);
      let stackset1 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset1 stackset_back
  | NonTail(z), IfEq(x, y', e1, e2) ->
      let x_s = Id.to_string x in
      let b_then = Id.genid "then" in
      let b_then_s = Id.to_string b_then in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      emit_cond_jump_op oc "jeq" x_s y' b_then_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e2);
      let stackset2 = !stackset in
      if not (must_terminate_t e2) then (
        Printf.fprintf oc "\tset_label\t%s, %s\n" reg_sw b_cont_s;
        Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero_s reg_sw (* goto cont *)
      );
      Printf.fprintf oc "%s:\n" b_then_s;
      stackset := stackset_back;
      g oc ss (NonTail(z), e1);
      Printf.fprintf oc "%s:\n" b_cont_s;
      let stackset1 = !stackset in
      stackset := S.inter stackset1 stackset2
  | NonTail(z), IfLE(x, y', e1, e2) ->
      let x_s = Id.to_string x in
      let b_then = Id.genid "then" in
      let b_then_s = Id.to_string b_then in
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      emit_cond_jump_op oc "jleq" x_s y' b_then_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e2);
      let stackset2 = !stackset in
      if not (must_terminate_t e2) then (
        Printf.fprintf oc "\tset_label\t%s, %s\n" reg_sw b_cont_s;
        Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero_s reg_sw (* goto cont *)
      );
      Printf.fprintf oc "%s:\n" b_then_s;
      stackset := stackset_back;
      g oc ss (NonTail(z), e1);
      Printf.fprintf oc "%s:\n" b_cont_s;
      let stackset1 = !stackset in
      stackset := S.inter stackset1 stackset2
  (* Optimized: if x==.y then () else e2 → feq; ceqi(invert); jzero..cont; e2; cont: *)
  | NonTail(z), IfFEq(x, y, e1, e2) when is_nop e1 ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      Printf.fprintf oc "\tfeq\t%s, %s, %s\n" reg_sw x y;
      Printf.fprintf oc "\tceqi\t%s, %s, 0\n" reg_sw reg_sw;  (* invert: 0 when feq=1 *)
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero_s reg_sw b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e2);
      let stackset2 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset_back stackset2
  (* Optimized: if x==.y then e1 else () → feq; jzero..cont; e1; cont: *)
  | NonTail(z), IfFEq(x, y, e1, e2) when is_nop e2 ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      Printf.fprintf oc "\tfeq\t%s, %s, %s\n" reg_sw x y;
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero_s reg_sw b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e1);
      let stackset1 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset1 stackset_back
  | NonTail(z), IfFEq(x, y, e1, e2) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tfeq\t%s, %s, %s\n" reg_sw x y;
      g'_non_tail_if oc ss (NonTail(z)) Asm.reg_sw e1 e2
  (* Optimized: if x<=.y then () else e2 → fleq; ceqi(invert); jzero..cont; e2; cont: *)
  | NonTail(z), IfFLE(x, y, e1, e2) when is_nop e1 ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      Printf.fprintf oc "\tfleq\t%s, %s, %s\n" reg_sw x y;
      Printf.fprintf oc "\tceqi\t%s, %s, 0\n" reg_sw reg_sw;  (* invert: 0 when fleq=1 *)
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero_s reg_sw b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e2);
      let stackset2 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset_back stackset2
  (* Optimized: if x<=.y then e1 else () → fleq; jzero..cont; e1; cont: *)
  | NonTail(z), IfFLE(x, y, e1, e2) when is_nop e2 ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero_s = Id.to_string reg_zero in
      Printf.fprintf oc "\tfleq\t%s, %s, %s\n" reg_sw x y;
      let b_cont = Id.genid "cont" in
      let b_cont_s = Id.to_string b_cont in
      Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero_s reg_sw b_cont_s;
      let stackset_back = !stackset in
      g oc ss (NonTail(z), e1);
      let stackset1 = !stackset in
      Printf.fprintf oc "%s:\n" b_cont_s;
      stackset := S.inter stackset1 stackset_back
  | NonTail(z), IfFLE(x, y, e1, e2) ->
      let x = Id.to_string x in
      let y = Id.to_string y in
      let reg_sw = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tfleq\t%s, %s, %s\n" reg_sw x y;
      g'_non_tail_if oc ss (NonTail(z)) Asm.reg_sw e1 e2
  (* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      g'_args oc [(x, Asm.reg_cl)] ys zs;
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_cl = Id.to_string Asm.reg_cl in
      let reg_zero = Id.to_string reg_zero in
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_sw reg_cl;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_sw
  | Tail, CallDir(Id.L(x), [], [z]) when x = "min_caml_int_of_float" || x = "min_caml_float_to_int" ->
      g'_args oc [] [] [z];
      let r0 = Id.to_string (int_return_reg ()) in
      let f0 = Id.to_string fregs.(0) in
      Printf.fprintf oc "\tftoi\t%s, %s\n" r0 f0;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L(x), [y], []) when x = "min_caml_float_of_int" ->
      g'_args oc [] [y] [];
      let r0 = Id.to_string regs.(0) in
      let f0 = Id.to_string (float_return_reg ()) in
      Printf.fprintf oc "\titof\t%s, %s\n" f0 r0;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | NonTail(a), CallDir(Id.L(x), [], [z]) when x = "min_caml_int_of_float" || x = "min_caml_float_to_int" ->
      g'_args oc [] [] [z];
      let a = Id.to_string a in
      let f0 = Id.to_string fregs.(0) in
      Printf.fprintf oc "\tftoi\t%s, %s\n" a f0
  | NonTail(a), CallDir(Id.L(x), [y], []) when x = "min_caml_float_of_int" ->
      g'_args oc [] [y] [];
      let a = Id.to_string a in
      let r0 = Id.to_string regs.(0) in
      Printf.fprintf oc "\titof\t%s, %s\n" a r0
  | Tail, CallDir(Id.L("min_caml_xor"), [y; z], []) ->
      let y = Id.to_string y in
      let z = Id.to_string z in
      let r0 = Id.to_string (int_return_reg ()) in
      Printf.fprintf oc "\txor\t%s, %s, %s\n" r0 y z;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L("min_caml_print_newline"), [], []) ->
      let i5 = Id.to_string regs.(1) in
      let i31 = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tmovui\t%s, 0xf0000\n" i5;
      Printf.fprintf oc "\tmovi\t%s, 10\n" i31;
      Printf.fprintf oc "\tsb\t%s, 0(%s)\n" i31 i5;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L("min_caml_print_char"), [y], []) ->
      g'_args oc [] [y] [];
      let i4 = Id.to_string regs.(0) in
      let i5 = Id.to_string regs.(1) in
      Printf.fprintf oc "\tmovui\t%s, 0xf0000\n" i5;
      Printf.fprintf oc "\tsb\t%s, 0(%s)\n" i4 i5;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L("min_caml_read_char"), [], []) ->
      let i5 = Id.to_string regs.(1) in
      let r0 = Id.to_string (int_return_reg ()) in
      Printf.fprintf oc "\tmovui\t%s, 0xf0000\n" i5;
      Printf.fprintf oc "\tlb\t%s, 0(%s)\n" r0 i5;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L("min_caml_rsqrt"), [], [z]) ->
      g'_args oc [] [] [z];
      let f0 = Id.to_string fregs.(0) in
      let fr = Id.to_string (float_return_reg ()) in
      Printf.fprintf oc "\tfrsqrt\t%s, %s\n" fr f0;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L("min_caml_floor"), [], [z]) ->
      g'_args oc [] [] [z];
      let f0 = Id.to_string fregs.(0) in
      let fr = Id.to_string (float_return_reg ()) in
      Printf.fprintf oc "\tffloor\t%s, %s\n" fr f0;
      if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
      let reg_zero = Id.to_string reg_zero in
      let reg_ra = Id.to_string Asm.reg_ra in
      if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
      else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_ra
  | Tail, CallDir(Id.L("min_caml_create_array"), ys, []) ->
      let i2     = Id.to_string Asm.reg_hp in
      let i15    = "%i15" in
      let ret    = Id.to_string (int_return_reg ()) in
      let rz     = Id.to_string reg_zero in
      let rsw    = Id.to_string Asm.reg_sw in
      let loop_s = Id.to_string (Id.genid "ca_loop") in
      let cont_s = Id.to_string (Id.genid "ca_cont") in
      let finish_tail () =
        if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
        let reg_ra = Id.to_string Asm.reg_ra in
        if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
        else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz reg_ra
      in
      (match ys with
      | count_y :: fill_y :: _ ->
          if is_zero_int_fill fill_y then begin
            (match const_int_of_id count_y with
             | Some(c) when c >= 0 ->
                 emit_zero_filled_create_array_const oc ~count:c ~ret_reg:ret
             | _ ->
                 g'_args oc [] ys [];
                 emit_zero_filled_create_array_dynamic oc ~count_reg:(Id.to_string regs.(0)) ~ret_reg:ret);
            finish_tail ()
          end else
            (match small_const_count ys with
            | Some count ->
                let fill_reg = prepare_unrolled_int_fill oc fill_y in
                emit_unrolled_create_array oc ~is_float:false ~count ~ret_reg:ret ~fill_reg;
                finish_tail ()
            | None ->
                g'_args oc [] ys [];    (* After: regs.(0)=%i4=count, regs.(1)=%i5=fill value *)
                let i5 = Id.to_string regs.(1) in
                Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));  (* counter = count *)
                Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;                        (* result = heap start *)
                Printf.fprintf oc "%s:\n" loop_s;
                Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;                  (* rsw = (counter==0)?1:0 *)
                Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;          (* if counter!=0, forward to cont *)
                (* fall-through: counter==0, return *)
                finish_tail ();
                Printf.fprintf oc "%s:\n" cont_s;
                Printf.fprintf oc "\tsw\t%s, 0(%s)\n" i5 i2;
                Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
                Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
                Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;             (* backward jump via reg *)
                Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw)
      | _ ->
          g'_args oc [] ys [];
          let i5 = Id.to_string regs.(1) in
          Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));  (* counter = count *)
          Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;                        (* result = heap start *)
          Printf.fprintf oc "%s:\n" loop_s;
          Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;                  (* rsw = (counter==0)?1:0 *)
          Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;          (* if counter!=0, forward to cont *)
          (* fall-through: counter==0, return *)
          if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
          let reg_ra = Id.to_string Asm.reg_ra in
          if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
          else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz reg_ra;
          Printf.fprintf oc "%s:\n" cont_s;
          Printf.fprintf oc "\tsw\t%s, 0(%s)\n" i5 i2;
          Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
          Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
          Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;             (* backward jump via reg *)
          Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw)
  | Tail, CallDir(Id.L("min_caml_create_float_array"), ys, zs) ->
      let i2     = Id.to_string Asm.reg_hp in
      let i15    = "%i15" in
      let ret    = Id.to_string (int_return_reg ()) in
      let rz     = Id.to_string reg_zero in
      let rsw    = Id.to_string Asm.reg_sw in
      let loop_s = Id.to_string (Id.genid "cfa_loop") in
      let cont_s = Id.to_string (Id.genid "cfa_cont") in
      let finish_tail () =
        if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
        let reg_ra = Id.to_string Asm.reg_ra in
        if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
        else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz reg_ra
      in
      (match ys, zs with
      | count_y :: _, fill_z :: _ ->
          if is_zero_float_fill fill_z then begin
            (match const_int_of_id count_y with
             | Some(c) when c >= 0 ->
                 emit_zero_filled_create_array_const oc ~count:c ~ret_reg:ret
             | _ ->
                 g'_args oc [] ys zs;
                 emit_zero_filled_create_array_dynamic oc ~count_reg:(Id.to_string regs.(0)) ~ret_reg:ret);
            finish_tail ()
          end else
            (match small_const_count ys with
            | Some count ->
                let fill_reg = prepare_unrolled_float_fill oc fill_z in
                emit_unrolled_create_array oc ~is_float:true ~count ~ret_reg:ret ~fill_reg;
                finish_tail ()
            | None ->
                g'_args oc [] ys zs;    (* After: regs.(0)=%i4=count, fregs.(0)=%f1=float fill value *)
                let f1 = Id.to_string fregs.(0) in
                Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));
                Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;
                Printf.fprintf oc "%s:\n" loop_s;
                Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;
                Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;          (* if counter!=0, forward to cont *)
                (* fall-through: counter==0, return *)
                finish_tail ();
                Printf.fprintf oc "%s:\n" cont_s;
                Printf.fprintf oc "\tsf\t%s, 0(%s)\n" f1 i2;
                Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
                Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
                Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;
                Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw)
      | _ ->
          g'_args oc [] ys zs;
          let f1 = Id.to_string fregs.(0) in
          Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));
          Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;
          Printf.fprintf oc "%s:\n" loop_s;
          Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;
          Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;          (* if counter!=0, forward to cont *)
          (* fall-through: counter==0, return *)
          if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
          let reg_ra = Id.to_string Asm.reg_ra in
          if !Asm.virtual_mode then Printf.fprintf oc "\tret\n"
          else Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz reg_ra;
          Printf.fprintf oc "%s:\n" cont_s;
          Printf.fprintf oc "\tsf\t%s, 0(%s)\n" f1 i2;
          Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
          Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
          Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;
          Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw)
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs;
      let reg_sw = Id.to_string Asm.reg_sw in
      let reg_zero = Id.to_string reg_zero in
      if !Asm.virtual_mode then (
        Printf.fprintf oc "\tcall_dir\t%s\n" x;
        Printf.fprintf oc "\tret\n"
      ) else (
        Printf.fprintf oc "\tset_label\t%s, %s\n" reg_sw x;
        if ss > 0 then emit_addi oc Asm.reg_sp Asm.reg_sp ss;
        Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_sw
      )
  | NonTail(a), CallCls(x, ys, zs) ->
      if !Asm.virtual_mode then (
         g'_args oc [] ys zs;
         Printf.fprintf oc "\tcall_cls\t%s\n" (Id.to_string x);
         let a_str = Id.to_string a in
         let r0 = Id.to_string (int_return_reg ()) in
         let f0 = Id.to_string (float_return_reg ()) in
         if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
           Printf.fprintf oc "\tmov\t%s, %s\n" a_str r0
         else if (List.mem a allfregs || a = Asm.reg_fsw) && a <> float_return_reg () then
           Printf.fprintf oc "\tfmov\t%s, %s\n" a_str f0
      ) else (
        let call_frame = 8 in
        let reg_cl = Id.to_string Asm.reg_cl in
        let reg_sw = Id.to_string Asm.reg_sw in
        let reg_ra = Id.to_string Asm.reg_ra in
        let reg_sp = Id.to_string Asm.reg_sp in
        emit_subi oc Asm.reg_sp Asm.reg_sp call_frame;
        g'_args oc [(x, Asm.reg_cl)] ys zs;
        emit_word_mem oc "sw" reg_ra (call_frame - 4) reg_sp;
        Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_sw reg_cl;
        Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_ra reg_sw; 
        emit_word_mem oc "lw" reg_ra (call_frame - 4) reg_sp;
        emit_addi oc Asm.reg_sp Asm.reg_sp call_frame;
        let r0 = Id.to_string (int_return_reg ()) in
        let f0 = Id.to_string (float_return_reg ()) in
        let a_str = Id.to_string a in
        if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
            Printf.fprintf oc "\tmov\t%s, %s\n" a_str r0
        else if (List.mem a allfregs || a = Asm.reg_fsw) && a <> float_return_reg () then
            Printf.fprintf oc "\tfmov\t%s, %s\n" a_str f0
      )
  | NonTail(a), CallDir(Id.L("min_caml_xor"), [y; z], []) ->
      let a = Id.to_string a in
      let y = Id.to_string y in
      let z = Id.to_string z in
      Printf.fprintf oc "\txor\t%s, %s, %s\n" a y z
  | NonTail(_), CallDir(Id.L("min_caml_print_newline"), [], []) ->
      let i5 = Id.to_string regs.(1) in
      let i31 = Id.to_string Asm.reg_sw in
      Printf.fprintf oc "\tmovui\t%s, 0xf0000\n" i5;
      Printf.fprintf oc "\tmovi\t%s, 10\n" i31;
      Printf.fprintf oc "\tsb\t%s, 0(%s)\n" i31 i5
  | NonTail(_), CallDir(Id.L("min_caml_print_char"), [y], []) ->
      g'_args oc [] [y] [];
      let i4 = Id.to_string regs.(0) in
      let i5 = Id.to_string regs.(1) in
      Printf.fprintf oc "\tmovui\t%s, 0xf0000\n" i5;
      Printf.fprintf oc "\tsb\t%s, 0(%s)\n" i4 i5
  | NonTail(a), CallDir(Id.L("min_caml_read_char"), [], []) ->
      let a_str = Id.to_string a in
      let i5 = Id.to_string regs.(1) in
      let r0 = Id.to_string (int_return_reg ()) in
      Printf.fprintf oc "\tmovui\t%s, 0xf0000\n" i5;
      Printf.fprintf oc "\tlb\t%s, 0(%s)\n" r0 i5;
      if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
        Printf.fprintf oc "\tmov\t%s, %s\n" a_str r0
  | NonTail(a), CallDir(Id.L("min_caml_rsqrt"), [], [z]) ->
      g'_args oc [] [] [z];
      let a_str = Id.to_string a in
      let f0 = Id.to_string fregs.(0) in
      let fr = Id.to_string (float_return_reg ()) in
      Printf.fprintf oc "\tfrsqrt\t%s, %s\n" fr f0;
      if (List.mem a allfregs || a = Asm.reg_fsw) && a <> float_return_reg () then
        Printf.fprintf oc "\tfmov\t%s, %s\n" a_str fr
  | NonTail(a), CallDir(Id.L("min_caml_floor"), [], [z]) ->
      g'_args oc [] [] [z];
      let a_str = Id.to_string a in
      let f0 = Id.to_string fregs.(0) in
      let fr = Id.to_string (float_return_reg ()) in
      Printf.fprintf oc "\tffloor\t%s, %s\n" fr f0;
      if (List.mem a allfregs || a = Asm.reg_fsw) && a <> float_return_reg () then
        Printf.fprintf oc "\tfmov\t%s, %s\n" a_str fr
  | NonTail(a), CallDir(Id.L("min_caml_create_array"), ys, []) ->
      let i2     = Id.to_string Asm.reg_hp in
      let i15    = "%i15" in
      let ret    = Id.to_string (int_return_reg ()) in
      let rz     = Id.to_string reg_zero in
      let rsw    = Id.to_string Asm.reg_sw in
      let move_result () =
        let a_str = Id.to_string a in
        if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
          Printf.fprintf oc "\tmov\t%s, %s\n" a_str ret
      in
      (match ys with
      | count_y :: fill_y :: _ ->
          if is_zero_int_fill fill_y then begin
            (match const_int_of_id count_y with
             | Some(c) when c >= 0 ->
                 emit_zero_filled_create_array_const oc ~count:c ~ret_reg:ret
             | _ ->
                 g'_args oc [] ys [];
                 emit_zero_filled_create_array_dynamic oc ~count_reg:(Id.to_string regs.(0)) ~ret_reg:ret);
            move_result ()
          end else
            (match small_const_count ys with
            | Some count ->
                let fill_reg = prepare_unrolled_int_fill oc fill_y in
                emit_unrolled_create_array oc ~is_float:false ~count ~ret_reg:ret ~fill_reg;
                move_result ()
            | None ->
                g'_args oc [] ys [];    (* After: %i4=count, %i5=fill value *)
                let i5 = Id.to_string regs.(1) in
                let loop_s = Id.to_string (Id.genid "ca_loop") in
                let cont_s = Id.to_string (Id.genid "ca_cont") in
                let done_s = Id.to_string (Id.genid "ca_done") in
                Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));
                Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;
                Printf.fprintf oc "%s:\n" loop_s;
                Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;          (* rsw = (counter==0)?1:0 *)
                Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;  (* if counter!=0, forward to cont *)
                (* fall-through: counter==0, jump to done *)
                Printf.fprintf oc "\tset_label\t%s, %s\n" rsw done_s;
                Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
                Printf.fprintf oc "%s:\n" cont_s;
                Printf.fprintf oc "\tsw\t%s, 0(%s)\n" i5 i2;
                Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
                Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
                Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;     (* backward jump via reg *)
                Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
                Printf.fprintf oc "%s:\n" done_s;
                move_result ())
      | _ ->
          g'_args oc [] ys [];
          let i5 = Id.to_string regs.(1) in
          let loop_s = Id.to_string (Id.genid "ca_loop") in
          let cont_s = Id.to_string (Id.genid "ca_cont") in
          let done_s = Id.to_string (Id.genid "ca_done") in
          Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));
          Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;
          Printf.fprintf oc "%s:\n" loop_s;
          Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;          (* rsw = (counter==0)?1:0 *)
          Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;  (* if counter!=0, forward to cont *)
          (* fall-through: counter==0, jump to done *)
          Printf.fprintf oc "\tset_label\t%s, %s\n" rsw done_s;
          Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
          Printf.fprintf oc "%s:\n" cont_s;
          Printf.fprintf oc "\tsw\t%s, 0(%s)\n" i5 i2;
          Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
          Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
          Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;
          Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
          Printf.fprintf oc "%s:\n" done_s;
          move_result ())
  | NonTail(a), CallDir(Id.L("min_caml_create_float_array"), ys, zs) ->
      let i2     = Id.to_string Asm.reg_hp in
      let i15    = "%i15" in
      let ret    = Id.to_string (int_return_reg ()) in
      let rz     = Id.to_string reg_zero in
      let rsw    = Id.to_string Asm.reg_sw in
      let move_result () =
        let a_str = Id.to_string a in
        if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
          Printf.fprintf oc "\tmov\t%s, %s\n" a_str ret
      in
      (match ys, zs with
      | count_y :: _, fill_z :: _ ->
          if is_zero_float_fill fill_z then begin
            (match const_int_of_id count_y with
             | Some(c) when c >= 0 ->
                 emit_zero_filled_create_array_const oc ~count:c ~ret_reg:ret
             | _ ->
                 g'_args oc [] ys zs;
                 emit_zero_filled_create_array_dynamic oc ~count_reg:(Id.to_string regs.(0)) ~ret_reg:ret);
            move_result ()
          end else
            (match small_const_count ys with
            | Some count ->
                let fill_reg = prepare_unrolled_float_fill oc fill_z in
                emit_unrolled_create_array oc ~is_float:true ~count ~ret_reg:ret ~fill_reg;
                move_result ()
            | None ->
                g'_args oc [] ys zs;    (* After: %i4=count, %f1=float fill value *)
                let f1 = Id.to_string fregs.(0) in
                let loop_s = Id.to_string (Id.genid "cfa_loop") in
                let cont_s = Id.to_string (Id.genid "cfa_cont") in
                let done_s = Id.to_string (Id.genid "cfa_done") in
                Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));
                Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;
                Printf.fprintf oc "%s:\n" loop_s;
                Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;
                Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;  (* if counter!=0, forward to cont *)
                (* fall-through: counter==0, jump to done *)
                Printf.fprintf oc "\tset_label\t%s, %s\n" rsw done_s;
                Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
                Printf.fprintf oc "%s:\n" cont_s;
                Printf.fprintf oc "\tsf\t%s, 0(%s)\n" f1 i2;
                Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
                Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
                Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;
                Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
                Printf.fprintf oc "%s:\n" done_s;
                move_result ())
      | _ ->
          g'_args oc [] ys zs;
          let f1 = Id.to_string fregs.(0) in
          let loop_s = Id.to_string (Id.genid "cfa_loop") in
          let cont_s = Id.to_string (Id.genid "cfa_cont") in
          let done_s = Id.to_string (Id.genid "cfa_done") in
          Printf.fprintf oc "\tmov\t%s, %s\n" i15 (Id.to_string regs.(0));
          Printf.fprintf oc "\tmov\t%s, %s\n" ret i2;
          Printf.fprintf oc "%s:\n" loop_s;
          Printf.fprintf oc "\tceqi\t%s, %s, 0\n" rsw i15;
          Printf.fprintf oc "\tjzero\t%s, %s, %s\n" rz rsw cont_s;
          Printf.fprintf oc "\tset_label\t%s, %s\n" rsw done_s;
          Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
          Printf.fprintf oc "%s:\n" cont_s;
          Printf.fprintf oc "\tsf\t%s, 0(%s)\n" f1 i2;
          Printf.fprintf oc "\taddi\t%s, %s, 4\n" i2 i2;
          Printf.fprintf oc "\tsubi\t%s, %s, 1\n" i15 i15;
          Printf.fprintf oc "\tset_label\t%s, %s\n" rsw loop_s;
          Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" rz rsw;
          Printf.fprintf oc "%s:\n" done_s;
          move_result ())
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
      if !Asm.virtual_mode then (
        g'_args oc [] ys zs;
        Printf.fprintf oc "\tcall_dir\t%s\n" x;
        let a_str = Id.to_string a in
        let r0 = Id.to_string (int_return_reg ()) in
        let f0 = Id.to_string (float_return_reg ()) in
        if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
          Printf.fprintf oc "\tmov\t%s, %s\n" a_str r0
        else if (List.mem a allfregs || a = Asm.reg_fsw) && a <> float_return_reg () then
          Printf.fprintf oc "\tfmov\t%s, %s\n" a_str f0
      ) else (
        let call_frame = 16 in
        g'_args oc [] ys zs;
        let reg_ra = Id.to_string Asm.reg_ra in
        let reg_sw = Id.to_string Asm.reg_sw in
        let reg_sp = Id.to_string Asm.reg_sp in
        emit_subi oc Asm.reg_sp Asm.reg_sp call_frame;
        emit_word_mem oc "sw" reg_ra (call_frame - 4) reg_sp;
        Printf.fprintf oc "\tset_label\t%s, %s\n" reg_sw x;
        Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_ra reg_sw;
        emit_word_mem oc "lw" reg_ra (call_frame - 4) reg_sp;
        emit_addi oc Asm.reg_sp Asm.reg_sp call_frame;
        let a_str = Id.to_string a in
        let r0 = Id.to_string (int_return_reg ()) in
        let f0 = Id.to_string (float_return_reg ()) in
        if (List.mem a allregs || a = Asm.reg_cl || a = Asm.reg_sw) && a <> int_return_reg () then
            Printf.fprintf oc "\tmov\t%s, %s\n" a_str r0
        else if (List.mem a allfregs || a = Asm.reg_fsw) && a <> float_return_reg () then
            Printf.fprintf oc "\tfmov\t%s, %s\n" a_str f0
      )
and g'_tail_if oc ss cmp_reg e1 e2 =
  (* cmp_reg != 0 (真) → fall-through → e1 *)
  (* cmp_reg == 0 (偽) → jzero → else → e2 *)
  let b_else = Id.genid "else" in
  let b_else_s = Id.to_string b_else in
  let cmp_reg = Id.to_string cmp_reg in
  let reg_zero = Id.to_string reg_zero in
  Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero cmp_reg b_else_s;
  let stackset_back = !stackset in
  g oc ss (Tail, e1);
  Printf.fprintf oc "%s:\n" b_else_s;
  stackset := stackset_back;
  g oc ss (Tail, e2)
and g'_non_tail_if oc ss dest cmp_reg e1 e2 =
  (* cmp_reg != 0 (真) → fall-through → e1 *)
  (* cmp_reg == 0 (偽) → jzero → else → e2 *)
  let b_else = Id.genid "else" in
  let b_cont = Id.genid "cont" in
  let b_else_s = Id.to_string b_else in
  let b_cont_s = Id.to_string b_cont in
  let cmp_reg = Id.to_string cmp_reg in
  let reg_sw = Id.to_string Asm.reg_sw in
  let reg_zero = Id.to_string reg_zero in
  Printf.fprintf oc "\tjzero\t%s, %s, %s\n" reg_zero cmp_reg b_else_s;
  let stackset_back = !stackset in
  g oc ss (dest, e1);
  let stackset1 = !stackset in
  if not (must_terminate_t e1) then (
    Printf.fprintf oc "\tset_label\t%s, %s\n" reg_sw b_cont_s;
    Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" reg_zero reg_sw (* goto cont *)
  );
  Printf.fprintf oc "%s:\n" b_else_s;
  stackset := stackset_back;
  g oc ss (dest, e2);
  Printf.fprintf oc "%s:\n" b_cont_s;
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs =
  let (_, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> Printf.fprintf oc "\tmov\t%s, %s\n" (Id.to_string r) (Id.to_string y))
    (shuffle Asm.reg_sw yrs);
  let (_, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> Printf.fprintf oc "\tfmov\t%s, %s\n" (Id.to_string fr) (Id.to_string z))
    (shuffle Asm.reg_fsw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  if !Asm.virtual_mode then Printf.fprintf oc "\t.func_entry\n";
  Printf.fprintf oc "%s:\n" x;
  stackset := S.empty;
  stackmap := [];
  g_pre e;
  let ss = stacksize () in
  if !Asm.virtual_mode then (
    (* In virtual mode, Backend handles frame setup/teardown.
       Pass ss=0 to g so emit_addi before ret is suppressed. *)
    stackset := S.empty;
    g oc 0 (Tail, e)
  ) else (
    if ss > 0 then emit_subi oc Asm.reg_sp Asm.reg_sp ss;
    stackset := S.empty;
    g oc ss (Tail, e)
  );
  if !Asm.virtual_mode then Printf.fprintf oc "\t.end_function\n"

let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc ".data\n";
  Printf.fprintf oc ".align\t8\n";
  List.iter
    (fun (Id.L(x), d) ->
      Printf.fprintf oc "%s:\t! %f\n" x d;
      Printf.fprintf oc "\t.long\t0x%lx\n" (get_single_bits d))
    data;
  Printf.fprintf oc ".text\n";
  Printf.fprintf oc ".global\tmin_caml_start\n";
  Printf.fprintf oc "min_caml_start:\n";
  (* Initialize stack/heap: SP=0x0700_0000 (Hi, Down), HP=0x0100_0000 (Lo, Up) *)
  let initial_stackptr = 0x0700_0000 in
  let initial_heapptr = 0x0100_0000 in
  let upper = (initial_stackptr lsr 12) land 0xFFFFF in
  let lower = initial_stackptr land 0xFFF in
  let reg_sp = Id.to_string Asm.reg_sp in
  let reg_hp = Id.to_string Asm.reg_hp in
  let reg_ra = Id.to_string Asm.reg_ra in
  Printf.fprintf oc "\tmovui\t%s, %d\n" reg_sp upper;
  Printf.fprintf oc "\tori\t%s, %s, %d\n" reg_sp reg_sp lower;
  let upper = (initial_heapptr lsr 12) land 0xFFFFF in
  let lower = initial_heapptr land 0xFFF in
  Printf.fprintf oc "\tmovui\t%s, %d\n" reg_hp upper;
  Printf.fprintf oc "\tori\t%s, %s, %d\n" reg_hp reg_hp lower;
  Printf.fprintf oc "\tset_label\t%s, fin\n" reg_ra;
  
  stackset := S.empty;
  stackmap := [];
  g_pre e;
  let ss = stacksize () in
  if ss > 0 then emit_subi oc Asm.reg_sp Asm.reg_sp ss;
  stackset := S.empty;
  g oc ss (NonTail(reg_zero), e);
  Printf.fprintf oc "fin:\n";
  Printf.fprintf oc "\tset_label\t%s, fin\n" (Id.to_string reg_sw);
  Printf.fprintf oc "\tjmp\t%s, 0(%s)\n" (Id.to_string reg_zero) (Id.to_string reg_sw);
  List.iter (fun fundef -> h oc fundef) fundefs;
