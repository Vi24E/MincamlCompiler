let rec f x = 
  if x = 0 then 0 else x + f (x - 1) 
in
let a = f 42 in
let b = f 42 in
let x = 57 in
let y = a + x in
let xx = 57 in
let yy = b + xx in
let rec adder x = 
  y + yy + x  
in
print_int ((adder 77) + (adder 77))