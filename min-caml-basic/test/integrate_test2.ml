let n = 100 in
print_int n;
print_newline ();
let a = Array.make (n + 1) true in
a.(0) <- false;
a.(1) <- false;
let rec eratosthenes p =
  if n < p then ()
  else if (not a.(p)) then eratosthenes (p + 1)
  else 
    let rec helper i =
      if n < i then ()
      else 
        (a.(i) <- false;
        helper (i + p))
    in
    let z = helper (p + p) in
    eratosthenes (p + 1)
in
let z = eratosthenes 2 in
let rec print_all i =
  if i > n then ()
  else 
    if a.(i) then (print_int i; print_newline (); print_all (i + 1))
    else print_all (i + 1)
in
print_all 2

