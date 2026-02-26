let sup = 1. in
let inf = 0. in
let dx = 0.0001 in

let rec f x = 
  let term_1 = x *. sin x in
  let term_2 = atan x in
  let term_3 = 2. /. (1. +. x) in
  term_1 +. term_2 +. term_3
in 
(* integral[0, 1] f(x) dx ~ 2.126288 *)

let rec integrate _ =
  let rec helper x acc =
    if x > sup then acc
    else helper (x +. dx) (acc +. ((f x +. f (x +. dx)) *. dx /. 2.))
  in
  helper inf 0.
in
let z = integrate () in
let w = int_of_float (z *. 1000000.) in
print_int w



