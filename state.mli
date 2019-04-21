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

(** [check_valid_word word board] is [word] iff it is a "valid" word. 
    Raises:
    - TooShort: [word] is shorter than length 3
    - Duplicate: [word] is already in [player.found_words]
    - NotBoard: [word] cannot be successfully be made on [board]
    - NotEnglish: [word] is not a valid English word
*)
val check_valid_word : player -> string -> Board.board -> Trie.t -> string


