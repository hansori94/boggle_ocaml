
type words = string list

type input = 
  | Quit
  | Word of words
  | Start

exception Empty

exception Malformed

(** [parse_helper strlst] returns [strlst] but with the empty strings removed *)
let rec parse_helper = function
  | [] -> []
  | h::t -> 
    if h = "" then parse_helper t else
      h::(parse_helper t)

let parse str = 
  let str = String.lowercase_ascii str in 
  let strings = String.split_on_char ' ' str in 
  let strings = parse_helper strings in 

  if strings = [] then raise (Empty) else
  if (List.length strings = 1) then Word(strings) else
  if (List.length strings = 2) then begin
    match strings with
    | h::t::[] when h = "quit" && t = "game" -> Quit
    | h::t::[] when h = "start" && t = "game" -> Start
    | _ -> raise (Malformed)
  end
  else
    raise (Malformed)

