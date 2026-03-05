open KNormal

let threshold = ref 30

let rec size = function
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2)| LetRec({ body = e1; _ }, e2)
  | While(e1, e2) -> 1 + size e1 + size e2
  | Let(_, e1, e2) -> 
    (match e1 with
    | Int(_)  -> size e2
    | _ -> 1 + size e1 + size e2)
  | Assign(_, _, e1, _) -> 1 + size e1
  | LetTuple(_, _, e) -> 1 + size e
  | TernPhi(_, _, _) -> 1
  | _ -> 1
  
let rec g e = 
  match e with
  | Let((x, t), e1, e2) -> 
    (match e1 with
    | IfLE(x', y', e1', e2') when size e2 < !threshold ->
      IfLE(x', y', Let((x, t), e1', e2), Let((x, t), e2', e2))
    | IfEq(x', y', e1', e2') when size e2 < !threshold ->
      IfEq(x', y', Let((x, t), e1', e2), Let((x, t), e2', e2))
    | _ -> Let((x, t), g e1, g e2))
  | IfLE(x, y, e1, e2) -> IfLE(x, y, g e1, g e2)
  | IfEq(x, y, e1, e2) -> IfEq(x, y, g e1, g e2)
  | LetTuple(xts, x, e2) -> LetTuple(xts, x, g e2)
  | LetRec({ name = xt; args = yts; body = e1; tags = _ }, e2) ->
      let fundef = { name = xt; args = yts; body = g e1; tags = KNormal.default_tag()} in
      FunctionChecker.registerFunctionDef fundef;
      LetRec(fundef, g e2)
  | Assign(x, y, e, tag) -> Assign(x, y, g e, tag)
  | TernPhi(c, x, y) -> TernPhi(c, x, y)
  | _ -> e

let f e =
  let e' = g e in
  Assoc.f e'
