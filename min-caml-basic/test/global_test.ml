let rec f x =
  if x < 1 then () else
  (print_int x;
   print_newline ();
   f (x - 1))
in
let a = 123 in
let b = 456 in
print_int a; print_newline ();
print_int b; print_newline ();
f 5
