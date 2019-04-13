(**
   Keeps track of board information
*)


(** The type of a game board *)
type board = (char array) array

(** [make_board m n] makes a random boggle board of size mxn 
    (right now only supports 4x4, using the traditional 16 boggle dice
    so each char value is not fully random but one of 6 possible values to 
    increase playability)
*)
val make_board : int -> int -> board

(** [get_all_words board] returns all real findable words on a given [board]
    where real means exists in our dictionary and is not a proper noun, and 
    findable means can be made from the given board following the rules of boggle
*)
val get_all_words : board -> string list
