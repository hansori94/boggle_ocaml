open Board
open Trie

exception Duplicate
exception TooShort

exception NotBoard
exception NotEnglish

type player = {
  init_time: float;
  found_words: string list;
  points: int;
}

let init_player =
  {
    init_time = Unix.gettimeofday ();
    found_words = [];
    points = 0;
  }

(** [get_time player] is the elasped playing time of [player] 
    Requires: [player] is of type [player]
    Returns: float of the player's time remaining
    Example: get_time {init_time=100} is 100*)
let get_time player =
  Unix.gettimeofday () -. player.init_time

(** [get_words_found player] is the list of found words of the [player]. 
    Requires: [player] is of type [player]
    Returns: string list of the player's found words
    Example: get_words_found {found_words=["hi"]} is ["hi"]**)
let get_words_found player = 
  player.found_words

(** [get_points player] is the current points of the [player]. 
    Requires: [player] is the of type [player]
    Returns: int of player's current points.
    Example: get_points player {points=0} is 0.*)
let get_points player = 
  player.points

(** [print_score player] prints the current score in [player] to the screen. 
    Requires: player is of type player.
    Returns: unit*)
let print_score (player : player) : unit = 
  ANSITerminal.(print_string [red] 
                  ("Score: "^(string_of_int(get_points player))^"\n"))


(** [print_list lst] prints the strings in [lst], separated by [, ]
    Requires: lst is a valid string list
    Returns: unit
*)
let rec print_list lst = 
  match lst with 
  | [] -> print_string "\n"
  | h::[] -> ANSITerminal.(print_string [red] ((h)^" ")); print_string "\n"
  | h::t -> ANSITerminal.(print_string [red] ((h)^", ")); print_list t

(**[print_words player] prints the found words of the player.
   Requires: player is of type player.
   Returns: unit
*)
let print_words player = 
  let words = player.found_words in 
  if List.length (words) = 0 then
    ANSITerminal.(print_string [red] "You haven't found any words yet.")
  else ANSITerminal.(print_string [red] "You found: "); 
  print_list (player.found_words)

(** [calc_score word] calculates the value of a valid word [word] 
    inputted by the player 
    Requires: word is a string of at least 3 characters.
    Returns: int corresponding to the points of a word.
    Example: [calc_points "friend"] is 5. 
*)
let calc_points word = 
  String.length word

(**[update_state] creates a new player object with updated words found
   and points.
   Requires: player is of type player and word is a string
   Returns: new object of type [player]*)
let update_state player word =
  let word_list = get_words_found player in 
  if(List.mem word word_list) then player else
    let new_word_list = word::word_list in 
    let new_points = (calc_points word) + (get_points player) in 
    let new_player_state = { player with
                             found_words = new_word_list;
                             points = new_points;
                           } in 
    new_player_state


(**[check_valid_word player str board trie] validates the player-inputted
   word [str]. 
   Requires: [player] is of type player, [str] is a string, [board] is a valid
   Boggle board, and [trie] is a valid trie containing words of the English
   dicitonary. 
   Returns: true if the word is valid, false otherwise.
   Example: on a valid boggle board where the word "hello" can be formed
   within the rules of Boggle, [check_valid_word player "hello" board trie] is
   true. *)
let check_valid_word player str board trie = 
  if (String.length str < 3) then raise (TooShort) else
  if (List.mem str (get_words_found player)) then raise (Duplicate) else
  if not (Board.valid_string str board) then raise (NotBoard) else
  if not (Trie.valid_english str trie) then raise (NotEnglish) 
  else str
