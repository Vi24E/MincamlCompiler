type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let rec equal t1 t2 = match (t1, t2) with
  | (Unit, Unit) -> true
  | (Bool, Bool) | (Bool, Int) | (Int, Bool) | (Int, Int) -> true
  | (Float, Float) -> true
  | (Fun(args1, ret1), Fun(args2, ret2)) ->
      List.length args1 = List.length args2 &&
      List.for_all2 (=) args1 args2 &&
      ret1 = ret2
  | (Tuple ts1, Tuple ts2) ->
      List.length ts1 = List.length ts2 &&
      List.for_all2 equal ts1 ts2
  | (Array t1, Array t2) -> equal t1 t2
  | (Var r1, Var r2) -> r1 == r2
  | _ -> false

let gentyp () = Var(ref None) (* 新しい型変数を作る *)
