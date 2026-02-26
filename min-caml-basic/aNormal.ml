(* A-normalization: flatten nested Let expressions *)

open KNormal

(* A正規化: ネストしたLetを平坦化する *)
(* Let(x, Let(y, e1, e2), e3) -> Let(y, e1, Let(x, e2, e3)) *)
let rec flatten_let e =
  match e with
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | Sll(_, _) | Sra(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | Var(_) | ExtArray(_) | Tuple(_) | Get(_, _) | Put(_, _, _)
  | App(_, _) | ExtFunApp(_, _) | Break(_) -> e
  
  | IfEq(x, y, e1, e2) ->
      let e1' = flatten_let e1 in
      let e2' = flatten_let e2 in
      IfEq(x, y, e1', e2')
  
  | IfLE(x, y, e1, e2) ->
      let e1' = flatten_let e1 in
      let e2' = flatten_let e2 in
      IfLE(x, y, e1', e2')
  
  | Let((x, t), e1, e2) ->
      let e1' = flatten_let e1 in
      (match e1' with
      | Let((y, ty), ey1, ey2) ->
          let e2' = flatten_let (Let((x, t), ey2, e2)) in
          flatten_let (Let((y, ty), ey1, e2'))
      | _ ->
          let e2' = flatten_let e2 in
          Let((x, t), e1', e2'))
  
  | LetRec(fundef, e) ->
      let body' = flatten_let fundef.body in
      let fundef' = { fundef with body = body' } in
      let e' = flatten_let e in
      LetRec(fundef', e')
  
  | LetTuple(xts, y, e) ->
      let e' = flatten_let e in
      LetTuple(xts, y, e')
  | Assign(x, y, e) ->
      Assign(x, y, flatten_let e)
  | While(e1, e2) ->
      While(flatten_let e1, flatten_let e2)

let f e = flatten_let e
