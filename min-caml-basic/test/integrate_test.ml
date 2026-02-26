let k = 42 in
let rec fib_alt n =
  if n <= 1 then n
  else 
    let t = fib_alt (n - 1) + fib_alt (n - 2) + k in
    t + t
in 
print_int (fib_alt 5)