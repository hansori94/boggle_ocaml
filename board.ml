
type board = (char array) array



let alphabet = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';
                'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']

(** first set of boggle dice *)
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

(** array in which to hold our dice *)
let dicearray = Array.make_matrix 4 4 []

(** filled array of dice *)
let dice = 
  dicearray.(0).(0) <- die1;
  dicearray.(0).(1) <- die2;
  dicearray.(0).(2) <- die3;
  dicearray.(0).(3) <- die4;
  dicearray.(1).(0) <- die5;
  dicearray.(1).(1) <- die6;
  dicearray.(1).(2) <- die7;
  dicearray.(1).(3) <- die8;
  dicearray.(2).(0) <- die9;
  dicearray.(2).(1) <- die10;
  dicearray.(2).(2) <- die11;
  dicearray.(2).(3) <- die12;
  dicearray.(3).(0) <- die13;
  dicearray.(3).(1) <- die14;
  dicearray.(3).(2) <- die15;
  dicearray.(3).(3) <- die16;
  dicearray



(** [random_letter list] takes in a char list [list] and returns a randomly 
    selected char from that char list
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

let make_board m n : board = 
  let arr = Array.make_matrix m n ' ' in
  let edit_arr arr = 
    for x=0 to m-1 do 
      for y=0 to n-1 do
        arr.(x).(y) <- random_letter dice.(x).(y)
      done
    done in 

  edit_arr arr;

  arr



let print_board (board:board) : unit=
  let board_format = 
    Char.escaped board.(0).(0) ^ "  " ^ 
    Char.escaped board.(0).(1) ^ "  " ^ 
    Char.escaped board.(0).(2) ^ "  " ^ 
    Char.escaped board.(0).(3) ^ "\n" ^
    Char.escaped board.(1).(0) ^ "  " ^ 
    Char.escaped board.(1).(1) ^ "  " ^ 
    Char.escaped board.(1).(2) ^ "  " ^ 
    Char.escaped board.(1).(3) ^ "\n" ^ 
    Char.escaped board.(2).(0) ^ "  " ^ 
    Char.escaped board.(2).(1) ^ "  " ^ 
    Char.escaped board.(2).(2) ^ "  " ^ 
    Char.escaped board.(2).(3) ^ "\n" ^
    Char.escaped board.(3).(0) ^ "  " ^ 
    Char.escaped board.(3).(1) ^ "  " ^ 
    Char.escaped board.(3).(2) ^ "  " ^ 
    Char.escaped board.(3).(3) ^ "\n" in 

  begin
    ANSITerminal.(print_string [cyan; Bold] board_format);
  end

(* 
let rec get_all_words (board: board) (visited: (bool array) array) (i:int)
    (j:int) (str:string) (acc: string list) : string list =  *)
let rec get_all_words board = 
  []
(* visited.(i).(j) <- true; 
   let word = str^Char.escaped(board.(i).(j)) in
   if isWord word then word::acc else 
   for row = i-1 to i+1 do 
   if row<=4 then 
   for col = j-1 to j+1 do
    if col<=4 then
    get_words_util board visited row col str acc *)


(** [valid_string word board] is [true] if [word] is a valid string
    from [board] and [false] otherwise.
*)
let rec valid_string word board = 
  (* TODO *)
  true




