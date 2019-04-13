(**
   Keeps track of game state
   i.e. words found, points, etc.
*)

(** TODO DOCUMENT *)
type player

(** TODO DOCUMENT *)
val get_words_found : player -> string list

(** TODO DOCUMENT *)
val get_points : player -> int

(** TODO DOCUMENT BETTER 
    Takes in a string and checks if that string is a word that can be made from the board
*)
val check_valid_word : string -> Board.board -> bool


