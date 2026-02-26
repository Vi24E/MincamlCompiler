let rec dummy x = if x <= 0 then 0 else dummy (x - 1) in
let a = 4096 in
let _ = dummy 10 in
print_int a
