(**
   Keeps track of board information
*)


(** The type of a game board *)
type board = (char array) array

(**[make_board m n] creates an object of type board with dimensions m X n.
   Requires: 
    -m = n
    -m = 4 or 5
   Returns: [board] with dimensions m X n. 
*)
val make_board : int -> int -> board

(**[print_board] prints [board] to the console
   in a 4x4 or 5x5 grid.
   Requires: [board] is a valid char array
   Returns: unit after printing. *)
val print_board : board -> unit

(** [valid_string word board] is [true] if [word] is a valid string
    from [board] and [false] otherwise.  Valid is defined as makeable from the
    board's sequence of adjacent letters without repeating the same tile

    Requires: [word] is a string and [board] is valid object of type [board].
    Returns: true if the string is valid and false otherwise.
    Example: if the word "hello" can be formed following the rules of Boggle
    on [board], then [valid_string "hello" board] is true.
*)
val valid_string : string -> board -> bool
