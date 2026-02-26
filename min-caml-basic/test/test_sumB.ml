let rec sum x = if x <= 0 then 0 else sum (x - 1) + x in let a = sum 4096 in print_int a
