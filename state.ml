

type player = {
  found_words: string list;
  points: int;
}

let get_words_found player = 
  player.found_words

let get_points player = 
  player.points