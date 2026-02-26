(* 2D Diffusion Equation Solver *)
(* Grid size *)
let size_x = 50 in
let size_y = 50 in

(* Simulation parameters *)
let dt = 0.2 in
let dx = 1.0 in
let dy = 1.0 in
let alpha = 1.0 in
let steps = 100 in

(* Helper to create 2D array without shared references *)
let rec create_matrix m n v =
  let dummy_row = Array.make n v in
  let mat = Array.make m dummy_row in
  let rec init_rows i =
    if i < 0 then ()
    else (
      mat.(i) <- Array.make n v;
      init_rows (i - 1)
    )
  in
  init_rows (m - 1);
  mat
in

(* Initialize grid with central square hot area *)
let rec init_grid mat y =
  if y < 0 then ()
  else (
    let rec init_row x =
      if x < 0 then ()
      else (
        (* Center is 25,25. Square 20x20 means 15 to 35 *)
        if 15 <= x then
          if x <= 35 then
            if 15 <= y then
              if y <= 35 then
                 mat.(y).(x) <- 255.0
              else ()
            else ()
          else ()
        else ();
        init_row (x - 1)
      )
    in
    init_row (size_x - 1);
    init_grid mat (y - 1)
  )
in

(* Diffusion step: u_new = u + alpha*dt/dx^2 * (neighbors - 4u) *)
(* Coeff = 1.0 * 0.2 / 1.0 = 0.2 *)
let coeff = 0.2 in

let rec solve_step u u_new y =
  if y < 1 then () (* Skip boundary y=0 *)
  else if y >= (size_y - 1) then () (* Skip boundary *)
  else (
    let rec solve_row x =
      if x < 1 then () (* Skip boundary x=0 *)
      else if x >= (size_x - 1) then ()
      else (
        let center = u.(y).(x) in
        let up = u.(y - 1).(x) in
        let down = u.(y + 1).(x) in
        let left = u.(y).(x - 1) in
        let right = u.(y).(x + 1) in
        let lap = up +. down +. left +. right -. 4.0 *. center in
        u_new.(y).(x) <- center +. coeff *. lap;
        solve_row (x + 1)
      )
    in
    solve_row 1;
    solve_step u u_new (y + 1)
  )
in

(* Copy u_new back to u *)
let rec copy_grid dest src y =
  if y < 0 then ()
  else (
    let rec copy_row x =
      if x < 0 then ()
      else (
        dest.(y).(x) <- src.(y).(x);
        copy_row (x - 1)
      )
    in
    copy_row (size_x - 1);
    copy_grid dest src (y - 1)
  )
in

(* Time loop *)
let rec time_loop u u_new t =
  if t = 0 then ()
  else (
    solve_step u u_new 1;
    copy_grid u u_new (size_y - 1);
    time_loop u u_new (t - 1)
  )
in

(* Output PPM *)
let rec print_ppm u y =
  if y >= size_y then ()
  else (
    let rec print_row x =
      if x >= size_x then ()
      else (
        let val_f = u.(y).(x) in
        let val_i = int_of_float val_f in
        (* Clamp 0-255 *)
        let val_c = 
          if val_i < 0 then 0
          else if val_i > 255 then 255
          else val_i 
        in
        
        (* P3 uses ASCII decimal for RGB (r g b) *)
        (* Assuming print_int prints decimal integer. *)
        (* Space separated *)
        
        print_int val_c; print_char 32; (* R *)
        print_int val_c; print_char 32; (* G *)
        print_int val_c; print_char 32; (* B *)
        
        print_row (x + 1)
      )
    in
    print_row 0;
    print_char 10; (* newline *)
    print_ppm u (y + 1)
  )
in

(* Main *)
let u = create_matrix size_y size_x 0.0 in
let u_new = create_matrix size_y size_x 0.0 in

let _ = init_grid u (size_y - 1) in
let _ = time_loop u u_new steps in

(* Header P3 width height maxval *)
let _ = print_char 80 in (* P *)
let _ = print_char 51 in (* 3 *)
let _ = print_char 10 in (* \n *)

let _ = print_int size_x in
let _ = print_char 32 in
let _ = print_int size_y in
let _ = print_char 32 in
let _ = print_int 255 in
let _ = print_char 10 in (* \n *)

print_ppm u 0
