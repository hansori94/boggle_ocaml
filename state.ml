open Board


type player = {
  found_words: string list;
  points: int;
}

let get_words_found player = 
  player.found_words

let get_points player = 
  player.points

let check_valid_word str board = 
  let str_list = Board.get_all_words board in 
  List.mem str str_list