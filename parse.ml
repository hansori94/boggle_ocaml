
type words = string list

type input = 
  | Quit
  | Word of words

exception Empty

exception Malformed

(** TODO DOCUMENT *)
let rec parse_helper = function
  | [] -> []
  | h::t -> 
    if h = "" then parse_helper t else
      h::(parse_helper t)

let parse str = 
  let strings = String.split_on_char ' ' str in 
  let strings = parse_helper strings in 

  if strings = [] then raise (Empty) else
  if (List.length strings = 1) then Word(strings) else
  if (List.length strings = 2) then begin
    match strings with
    | h::t::[] when h = "quit" && t = "game" -> Quit
    | _ -> raise (Malformed)
  end
  else
    raise (Malformed)

