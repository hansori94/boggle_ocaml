

type board = (char list) list

let alphabet = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';
                'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']

let random_letter str : char = 
  Random.self_init;
  let index = Random.int (List.length str) in 
  let rec get_char = function
    | h::t ->
      if (List.length t = (List.length str) - index - 1) then h else
        get_char t
    | [] -> failwith "random letter chooser error" in 
  get_char str

let make_board m n : board= 

  failwith "Unimplemented"

let get_all_words board = 
  failwith "Unimplemented"

