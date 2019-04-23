(**
   Keeps track of board information
*)


(** The type of a game board *)
type board = (char array) array

(** [make_board m n] makes a random boggle board of size mxn 

    Requires: 
    -m = n
    -m = 4 or 5
*)
val make_board : int -> int -> board

(** [print_board board] prints to the screen the [board] in the style of boggle,
    consisting of 4 rows and 4 columns with spaces between each char *)
val print_board : board -> unit

(** TODO DOCUMENT *)
val valid_string : string -> board -> bool
