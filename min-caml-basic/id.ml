type t = string * tag_type
and tag_type = Unknown | Known of local_tag * const_tag
and local_tag = 
  | Global of int
  | Local
  | Register
  | Leakable
and const_tag = 
  | None
  | ConstInt of int
  | ConstFloat of float

let compare (x, _) (y, _) = compare x y
type l = L of string

let to_string (x, t) = 
  (* let tag1 = match t with
    | Unknown -> ""
    | Known (Global i, _) -> "Global_" ^ string_of_int i ^ "_"
    | Known (Local, _) -> "Local_"
    | Known (Register, _) -> "Register_"
  in
  let tag2 = match t with
  | Unknown -> ""
  | Known (_, ConstInt i) -> "ConstInt_" ^ string_of_int i ^ "_"
  | Known (_, ConstFloat d) -> "ConstFloat_" ^ string_of_float d ^ "_"
  | Known (_, None) -> ""
  in *)
  x

let rec pp_list = function
  | [] -> ""
  | [x] -> to_string x
  | x :: xs -> to_string x ^ " " ^ pp_list xs

let is_global = function
  | (_, Known (Global _, _)) -> true
  | _ -> false

let is_leakable = function
  | (_, Known (Leakable, _)) -> true
  | _ -> false

let offset = function
  | (_, Known (Global i, _)) -> i
  | _ -> failwith "offset: not a global variable"

let counter = ref 0
let genid s =
  incr counter;
  let slice_r = match String.index_opt s '.' with
    | Some i -> i
    | None -> String.length s in
  (Printf.sprintf "%s.%d" (String.sub s 0 slice_r) !counter, Unknown)

let rec id_of_typ = function
  | Type.Unit -> "u"
  | Type.Bool -> "b"
  | Type.Int -> "i"
  | Type.Float -> "d"
  | Type.Fun _ -> "f"
  | Type.Tuple _ -> "t"
  | Type.Array _ -> "a" 
  | Type.Var _ -> assert false
let gentmp typ =
  incr counter;
  (Printf.sprintf "T%s%d" (id_of_typ typ) !counter, Unknown)
