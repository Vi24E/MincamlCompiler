
let rec main n =
  let a = Array.make 2 0 in
  let w =
    if n = 0 then
      a.(0) <- 1
    else
      a.(0) <- 2
  in
  a.(0)
in
let r = main 0 in
()
