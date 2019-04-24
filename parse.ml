
type words = string list

type input = 
  | Quit
  | Word of words
  | Start of words
  | Shake

exception Empty

exception Malformed

(** [parse_helper strlst] returns [strlst] but with the empty strings removed
    Requires: strlst is a valid string list
    Returns: strlst with empty strings removed
    Example: parse_helper ["hello"; ""] is ["hello"]*)
let rec parse_helper = function
  | [] -> []
  | h::t -> 
    if h = "" then parse_helper t else
      h::(parse_helper t)

(**[parse str] parses the player's input
   Requires: str is a valid string referring to the player's input.
   Returns: an object of variant input
   Example: [parse "quit game"] returns [Quit] *)
let parse str = 
  let str = String.lowercase_ascii str in 
  let strings = String.split_on_char ' ' str in 
  let strings = parse_helper strings in 

  if strings = [] then raise (Empty) else
  if (List.length strings = 1) then Word(strings) else
  if (List.length strings >= 2) then begin
    match strings with
    | h::t::[] when h = "quit" && t = "game" -> Quit
    | h::t::[] when h = "start" && t = "boggle" -> Start["small"]
    | h::t::t2::[] when h = "start" && t="big" && t2="boggle" -> Start["big"]
    | h::t::[] when h = "shake" && t = "it" -> Shake
    | _ -> raise (Malformed)
  end
  else
    raise (Malformed)

