(**
   Keeps track of game state
   i.e. words found, points, etc.
*)

(** The abstract type of a player *)
type player

(** Raised if duplicate word is encountered. *)
exception Duplicate

(** Raised if word less than three characters is encountered. *)
exception TooShort

exception NotBoard
exception NotEnglish

(** [init_player] returns a new player with default starting values *)
val init_player : player

(** [get_words_found player] returns all the words a player has correctly found *)
val get_words_found : player -> string list

(** [get_points player] returns the point score of the player *)
val get_points : player -> int

(** [print_score player] gets the player's current score and prints it. *)
val print_score : player -> unit

(** [print_words player] prints the list of words that the player has found. *)
val print_words : player -> unit


(** [update_state player word point] returns a new player state with an updated
    list of found words containing [word] and updated points with the addition 
    of [point]. If [word] has already been found by the player, then it returns
    the initial [player] state *)
val update_state : player -> string -> player

(** UPDATED DOCUMENTATION [check_valid_word word board] checks if [word] is a valid word on the given
    [board], i.e. it is a real word and it can successfully be made on this
    board
*)
val check_valid_word : player -> string -> Board.board -> string


