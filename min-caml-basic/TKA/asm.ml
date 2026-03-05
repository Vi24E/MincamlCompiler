type id_or_imm = V of Id.t | C of int
type t = Ans of exp | Let of (Id.t * Type.t) * exp * t
and exp =
  | Nop
  | SetInt of int
  | SetFloat of float
  | SetLabel of Id.l
  | Mov of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Sll of Id.t * id_or_imm
  | Sra of Id.t * id_or_imm
  | Ld of Id.t * id_or_imm
  | LdF of Id.t * id_or_imm
  | St of Id.t * Id.t * id_or_imm
  | StF of Id.t * Id.t * id_or_imm
  | FMov of Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | FInv of Id.t
  | CmpEq of Id.t * id_or_imm
  | CmpLE of Id.t * id_or_imm
  | CmpLT of Id.t * id_or_imm
  | CmpFEq of Id.t * Id.t
  | CmpFLE of Id.t * Id.t
  | CmpFLT of Id.t * Id.t
  | Tern of Id.t * Id.t * Id.t
  | TernF of Id.t * Id.t * Id.t
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  | Loop of Id.l * Id.l * t
  | Assign of Id.t * Id.t
  | Break of Id.t * Type.t * Id.l
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t
  | Restore of Id.t

type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
type prog = Prog of (Id.l * float) list * fundef list * t

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)

(* ゼロレジスタ *)
(* ゼロレジスタ *)
let virtual_mode = ref false

let virtual_int_counter = ref 0
let virtual_float_counter = ref 0

let gen_virtual_int_reg () =
  incr virtual_int_counter;
  (Printf.sprintf "%%vi%d" !virtual_int_counter, Id.Unknown)

let gen_virtual_float_reg () =
  incr virtual_float_counter;
  (Printf.sprintf "%%vf%d" !virtual_float_counter, Id.Unknown)

let reg_zero = ("%i0", Id.Known(Id.Register, Id.None))      (* 整数ゼロレジスタ *)
let reg_fzero = ("%f0", Id.Known(Id.Register, Id.None))     (* 浮動小数点ゼロレジスタ *)

(* 特殊レジスタ *)
let reg_sp = ("%i1", Id.Known(Id.Register, Id.None))        (* stack pointer *)
let reg_hp = ("%i2", Id.Known(Id.Register, Id.None))        (* heap pointer *)
let reg_ra = ("%i3", Id.Known(Id.Register, Id.None))        (* return address *)

(* 引数・一時レジスタ (Caller-saved) *)
let arg_regs = Array.map (fun x -> (x, Id.Known(Id.Register, Id.None))) [| "%i4"; "%i5"; "%i6"; "%i7"; "%i8"; "%i9"; 
                  "%i10"; "%i11"; "%i12"; "%i13"; "%i14"; "%i15" |]
let farg_regs = Array.map (fun x -> (x, Id.Known(Id.Register, Id.None))) [| "%f1"; "%f2"; "%f3"; "%f4"; "%f5"; "%f6"; "%f7"; "%f8";
                   "%f9"; "%f10"; "%f11"; "%f12"; "%f13"; "%f14"; "%f15" |]

(* 保存レジスタ (Callee-saved) *)
let saved_regs = Array.map (fun x -> (x, Id.Known(Id.Register, Id.None))) [| "%i16"; "%i17"; "%i18"; "%i19"; "%i20"; "%i21"; 
                    "%i22"; "%i23"; "%i24"; "%i25"; "%i26"; "%i27"; 
                    "%i28"; "%i29" |]
let fsaved_regs = Array.map (fun x -> (x, Id.Known(Id.Register, Id.None))) [| "%f16"; "%f17"; "%f18"; "%f19"; "%f20"; "%f21";
                     "%f22"; "%f23"; "%f24"; "%f25"; "%f26"; "%f27";
                     "%f28"; "%f29"; |]

(* クロージャアドレスとスワップ用 *)
let reg_cl = ("%i30", Id.Known(Id.Register, Id.None))       (* closure address *)
let reg_sw = ("%i31", Id.Known(Id.Register, Id.None))       (* temporary for swap *)
let reg_fsw = ("%f31", Id.Known(Id.Register, Id.None))      (* temporary for float swap *)

(* 汎用レジスタ = 引数レジスタ + 保存レジスタ *)
(* 注意: reg_raは返り値用に予約されているため、regsには含めない *)
let regs = Array.concat [arg_regs; saved_regs]
let fregs = Array.concat [farg_regs; fsaved_regs]
let allregs = reg_cl :: Array.to_list regs
let allfregs = Array.to_list fregs

let is_reg (x, _) = (x.[0] = '%' || x = "x0")

let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when List.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (x :: xs) ys

let fv_id_or_imm = function V(x) -> [x] | _ -> []
let rec fv_exp = function
  | Nop | SetInt(_) | SetFloat(_) | SetLabel(_) | Restore(_) -> []
  | Mov(x) | Neg(x) | FMov(x) | FNeg(x) | FInv(x) | Save(x, _) -> [x]
  | CmpEq(x, y') | CmpLE(x, y') | CmpLT(x, y') -> x :: fv_id_or_imm y'
  | CmpFEq(x, y) | CmpFLE(x, y) | CmpFLT(x, y) -> [x; y]
  | Tern(c, x, y) | TernF(c, x, y) -> [c; x; y]
  | Sll(x, y') | Sra(x, y') -> x :: fv_id_or_imm y'
  | Add(x, y') | Sub(x, y') | Ld(x, y') | LdF(x, y') -> x :: fv_id_or_imm y'
  | St(x, y, z') | StF(x, y, z') -> x :: y :: fv_id_or_imm z'
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) -> x :: fv_id_or_imm y' @ remove_and_uniq [] (fv e1 @ fv e2)
  | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) -> x :: y :: remove_and_uniq [] (fv e1 @ fv e2)
  | Loop(_, _, e) -> fv e
  | Assign(_, y) -> [y]
  | Break(_, _, _) -> []
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq [x] (fv e)
let fv e = remove_and_uniq [] (fv e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

let align i = (if i mod 8 = 0 then i else i + 4)
