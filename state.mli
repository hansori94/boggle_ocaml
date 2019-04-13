(**
   Keeps track of game state
   i.e. words found, points, etc.
*)

(** The abstract type of a player *)
type player

(** [init_player] returns a new player with default starting values *)
val init_player : player

(** [get_words_found player] returns all the words a player has correctly found *)
val get_words_found : player -> string list

(** [get_points player] returns the point score of the player *)
val get_points : player -> int

(** [update_state player word point] returns a new player state with an updated
    list of found words containing [word] and updated points with the addition 
    of [point]. If [word] has already been found by the player, then it returns
    the initial [player] state *)
val update_state : player -> string -> int -> player

(** [check_valid_word word board] checks if [word] is a valid word on the given
    [board], i.e. it is a real word and it can successfully be made on this
    board
*)
val check_valid_word : string -> Board.board -> bool


