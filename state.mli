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

(** Raised if word is not makeable from the current board. *)
exception NotBoard

(** Raised if word is not a valid English word. *)
exception NotEnglish

(** [init_player] returns a new player with default starting values *)
val init_player : player

(** [get_words_found player] is the list of found words of the [player]. 
    Requires: [player] is of type [player]
    Returns: string list of the player's found words
    Example: get_words_found {found_words=["hi"]} is ["hi"]**)
val get_words_found : player -> string list

(** [get_points player] is the current points of the [player]. 
    Requires: [player] is the of type [player]
    Returns: int of player's current points.
    Example: get_points player {points=0} is 0.*)
val get_points : player -> int

(** [print_score player] prints the current score in [player] to the screen. 
    Requires: player is of type player.
    Returns: unit*)
val print_score : player -> unit

(**[print_words player] prints the found words of the player.
   Requires: player is of type player.
   Returns: unit
*)
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
    Requires: [player] is of type player, [str] is a string, [board] is a valid
    Boggle board, and [trie] is a valid trie containing words of the English
    dicitonary. 
    Returns: true if the word is valid, false otherwise.
    Example: on a valid boggle board where the word "hello" can be formed
    within the rules of Boggle, [check_valid_word player "hello" board trie] is
    true. *)
val check_valid_word : player -> string -> Board.board -> Trie.t -> string


