val registerFunction : KNormal.t -> unit
val findFunction : Id.l -> KNormal.fundef option
val checkFunctionPurity : KNormal.fundef -> bool
val checkExpPurity : KNormal.t -> bool
val registerFunctionDef : KNormal.fundef -> unit
val function_env : (Id.l, KNormal.fundef) Hashtbl.t ref
val f : KNormal.t -> KNormal.t