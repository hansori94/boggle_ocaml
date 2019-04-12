

type board = (char list) list

let alphabet = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';
                'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']

let die1 = ['a';'a';'e';'e';'g';'n'] 
let die2 = ['e';'l';'r';'t';'t';'y']
let die3 = ['a';'o';'o';'t';'t';'w']
let die4 = ['a';'b';'b';'j';'o';'o']
let die5 = ['e';'h';'r';'t';'v';'w']
let die6 = ['c';'i';'m';'o';'t';'u']
let die7 = ['d';'i';'s';'t';'t';'y']
let die8 = ['e';'i';'o';'s';'s';'t']
let die9 = ['d';'e';'l';'r';'v';'y']
let die10 = ['a';'c';'h';'o';'p';'s']
let die11 = ['h';'i';'m';'n';'q';'u']
let die12 = ['e';'e';'i';'n';'s';'u']
let die13 = ['e';'e';'g';'h';'n';'w']
let die14 = ['a';'f';'f';'k';'p';'s']
let die15 = ['h';'l';'n';'n';'r';'z']
let die16 = ['d';'e';'i';'l';'r';'x']


(** TODO DOCUMENT BETTER
    get a random char from an array of chars
*)
let random_letter str : char = 
  Random.self_init ();
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

