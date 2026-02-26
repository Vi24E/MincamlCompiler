(* for debug *)
(* let print_char (x: int) =
  let c = char_of_int x in
  print_char c
in 
let read_char () =
  let c = input_char stdin in
  let x = int_of_char c in
  x
in
let rec rsqrt x = 1. /. sqrt x in *)
(* for debug *)

(* 0.9999992324248266x
-0.16665672006614343x^{3}
+0.008313130855076564x^{5}
-0.00018520579550394259x^{7}*)

let pi_val = 3.14159265358939323846 in
let h_pi_val = 1.57079632679469661923 in
let nh_pi_val = -1.57079632679469661923 in
let n_pi_val = -3.14159265358939323846 in

let rec sin x =
  if x > h_pi_val then
    if x < pi_val then
      let x = pi_val -. x in
      let sq = x *. x in
      let t1 = -0.00018520579550394259 in
      let t2 = t1 *. sq +. 0.008313130855076564 in
      let t3 = t2 *. sq -. 0.16665672006614343 in
      let t4 = t3 *. sq +. 0.9999992324248266 in
      t4 *. x
    else (* x < 2piの時も特化する？ *)
      let d = floor (x /. pi_val) in
      let t = x -. d *. pi_val in
      let x = if t > h_pi_val then pi_val -. t else t in
      let sq = x *. x in
      let t1 = -0.00018520579550394259 in
      let t2 = t1 *. sq +. 0.008313130855076564 in
      let t3 = t2 *. sq +. -0.16665672006614343 in
      let t4 = t3 *. sq +. 0.9999992324248266 in
      t4 *. x
    else if x < nh_pi_val then
      if x > n_pi_val then
        let x = n_pi_val -. x in
        let sq = x *. x in
        let t1 = -0.00018520579550394259 in
        let t2 = t1 *. sq +. 0.008313130855076564 in
        let t3 = t2 *. sq +. -0.16665672006614343 in
        let t4 = t3 *. sq +. 0.9999992324248266 in
        t4 *. x
      else
        let d = floor (x /. pi_val) in
        let t = x -. d *. pi_val in
        let x = if t > h_pi_val then pi_val -. t else t in
        let sq = x *. x in
        let t1 = -0.00018520579550394259 in
        let t2 = t1 *. sq +. 0.008313130855076564 in
        let t3 = t2 *. sq +. -0.16665672006614343 in
        let t4 = t3 *. sq +. 0.9999992324248266 in
        t4 *. x
  else
    let sq = x *. x in
    let t1 = -0.00018520579550394259 in
    let t2 = t1 *. sq +. 0.008313130855076564 in
    let t3 = t2 *. sq +. -0.16665672006614343 in
    let t4 = t3 *. sq +. 0.9999992324248266 in
    t4 *. x
in

let rec cos x =
  let x = h_pi_val -. x in
  sin x
in

(* 
0.9999992255890978x 
- 0.333256780397244x^3 
+ 0.19872040268218474x^5
- 0.13447864058102987x^7
+ 0.08312645300638827x^9
- 0.03636043085746011x^11
+ 0.007648353926803392x^13
*)
let rec atan x =
  if x > 1. then
    let x = 1. /. x in
    let sq = x *. x in
    let t1 = -0.007648353926803392 in
    let t2 = t1 *. sq +. 0.03636043085746011 in
    let t3 = t2 *. sq +. -0.08312645300638827 in
    let t4 = t3 *. sq +. 0.13447864058102987 in
    let t5 = t4 *. sq +. -0.19872040268218474 in
    let t6 = t5 *. sq +. 0.333256780397244 in
    let t7 = t6 *. sq +. -0.9999992255890978 in
    t7 *. x +. h_pi_val
  else if x < -1. then
    let x = 1. /. x in
    let sq = x *. x in
    let t1 = -0.007648353926803392 in
    let t2 = t1 *. sq +. 0.03636043085746011 in
    let t3 = t2 *. sq +. -0.08312645300638827 in
    let t4 = t3 *. sq +. 0.13447864058102987 in
    let t5 = t4 *. sq +. -0.19872040268218474 in
    let t6 = t5 *. sq +. 0.333256780397244 in
    let t7 = t6 *. sq +. -0.9999992255890978 in
    t7 *. x +. nh_pi_val
  else
    let sq = x *. x in
    let t1 = 0.007648353926803392 in
    let t2 = t1 *. sq +. -0.03636043085746011 in
    let t3 = t2 *. sq +. 0.08312645300638827 in
    let t4 = t3 *. sq +. -0.13447864058102987 in
    let t5 = t4 *. sq +. 0.19872040268218474 in
    let t6 = t5 *. sq +. -0.333256780397244 in
    let t7 = t6 *. sq +. 0.9999992255890978 in
    t7 *. x
in

let rec sqrt x =
  let r = rsqrt x in
  1. /. r
in

let rec fsqr x =
  x *. x
in

let rec divmod x y =
  if x < y then
    (0, x)
  else
    let y2 = y * 2 in
    let (q, r) = divmod x y2 in
    if r >= y then
      ((q * 2) + 1, r - y)
    else
      (q * 2, r)
in

let rec print_int_helper x =
  let (q, r) = divmod x 10 in
  if q = 0 then
    print_char (r + 48)
  else
    (print_int_helper q;
    print_char (r + 48))
in

let rec print_int x =
  let x = if x < 0 then 
    (print_char 45; -x) 
  else x in
  print_int_helper x
in 

let rec read_int_helper t =
  let c = read_char () in
  if c >= 48 then
    if c <= 57 then
      let t = t * 8 + t * 2 + (c - 48) in
      read_int_helper t
    else
      t
  else
    t
in

let rec read_int z =
  let c = read_char () in
  if c = 45 then
    let x = read_int_helper 0 in
    -x
  else
    read_int_helper (c - 48)
in

let rec read_float_helper t d =
  let c = read_char () in
  if c = 46 then read_float_helper t 10.
  else if c = 45 then 
    let x = read_float_helper 0. (-1.) in
    -.x
  else if c >= 48 then
    if c <= 57 then
      if d <= 0. then
        let t = t *. 10. +. float_of_int (c - 48) in
        read_float_helper t d
      else
        let t = t +. float_of_int (c - 48) /. d in
        read_float_helper t (d *. 10.)
    else
      t
  else
    t
in

let rec read_float z =
  read_float_helper 0. (-1.)
in

let rec fabs x =
  if x < 0. then -.x else x
in

let rec fneg x = -.x in
let rec fisneg x = x < 0. in
let rec fiszero x = (x = 0.) in
let rec fispos x = (x > 0.) in
let rec fhalf x = x *. 0.5 in
let rec fsqr x = x *. x in
let rec fless x y = x < y in
