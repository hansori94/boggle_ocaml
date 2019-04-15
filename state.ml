open Board

exception Duplicate
exception TooShort

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

let get_time player =
  Unix.gettimeofday () -. player.init_time


let get_words_found player = 
  player.found_words

let get_points player = 
  player.points

let print_score (player : player) : unit = 
  ANSITerminal.(print_string [red] ("Score: "^(string_of_int(get_points player))^"\n"))

let calc_points word = 
  String.length word

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

let check_valid_word player str board = 
  if (String.length str < 3) then raise (TooShort) else
  if (List.mem str (get_words_found player)) then raise (Duplicate) else
    str

(* let str_list = Board.get_all_words board in 
   List.mem str str_list *)