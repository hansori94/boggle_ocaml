


(** I DON'T THINK WE SHOULD NEED THIS HERE MAYBE REMOVE LATER *)
type board = (char list) list

type player = {
  found_words: string list;
  points: int;
}

let get_words_found player = 
  player.found_words

let get_points player = 
  player.points

let check_valid_word str board = 
  failwith "Unimplemented"