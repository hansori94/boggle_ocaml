(**
   Keeps track of board information
*)


(** TODO DOCUMENT *)
type board = (char array) array

(** TODO DOCUMENT BETTER
    Makes a random boggle board
*)
val make_board : int -> int -> board

(** TODO DOCUMENT BETTER 
    Finds all the words in a given boggle board
*)
val get_all_words : board -> string list
