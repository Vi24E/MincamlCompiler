type id_or_imm = V of Id.t | C of int
type t = Ans of exp | Let of (Id.t * Type.t) * exp * t
and exp =
  | Nop
  | SetInt of int
  | SetFloat of float
  | SetLabel of Id.l
  | SetL of Id.l (* For ExtArray *)
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
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t
  | Restore of Id.t

type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
type prog = Prog of (Id.l * float) list * fundef list * t

val fletd : Id.t * exp * t -> t
val seq : exp * t -> t

val regs : Id.t array
val fregs : Id.t array
val allregs : Id.t list
val allfregs : Id.t list
val reg_cl : Id.t
val reg_sw : Id.t
val reg_fsw : Id.t
val reg_ra : Id.t
val reg_sp : Id.t
val reg_hp : Id.t

val is_reg : Id.t -> bool

val fv : t -> Id.t list
val concat : t -> Id.t * Type.t -> t -> t

val align : int -> int
