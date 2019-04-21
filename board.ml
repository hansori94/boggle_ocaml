
type board = (char array) array



let alphabet = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';
                'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']

(** 4x4 set of boggle dice *)
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
let dieArray = [|die1;die2;die3;die4;die5;die6;die7;die8;
                 die9;die10;die11;die12;die13;die14;die15;die16|]

(* 5x5 set of boggle dice *)
let b1 = ['q';'b';'z';'j';'x';'k']
let b2 = ['t';'o';'u';'o';'t';'o']
let b3 = ['o';'v';'w';'r';'g';'r']
let b4 = ['a';'a';'a';'f';'r';'s']
let b5 = ['a';'u';'m';'e';'e';'g']
let b6 = ['h';'h';'l';'r';'d';'o']
let b7 = ['n';'h';'d';'t';'h';'o']
let b8 = ['l';'h';'n';'r';'o';'d']
let b9 = ['a';'f';'a';'i';'s';'r']
let b10 = ['y';'i';'f';'a';'s';'r']
let b11 = ['t';'e';'l';'p';'c';'i']
let b12 = ['s';'s';'n';'s';'e';'u']
let b13 = ['r';'i';'y';'p';'r';'h']
let b14 = ['d';'o';'r';'d';'l';'n']
let b15 = ['c';'c';'w';'n';'s';'t']
let b16 = ['t';'t';'o';'t';'e';'m']
let b17 = ['s';'c';'t';'i';'e';'p']
let b18 = ['e';'a';'n';'d';'n';'n']
let b19 = ['m';'n';'n';'e';'a';'g']
let b20 = ['u';'o';'t';'o';'w';'n']
let b21 = ['a';'e';'a';'e';'e';'e']
let b22 = ['y';'i';'f';'p';'s';'r']
let b23 = ['e';'e';'e';'e';'m';'a']
let b24 = ['i';'t';'i';'t';'i';'e']
let b25 = ['e';'t';'i';'l';'i';'c']
let bigDieArray = [|b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12;b13;
                    b14;b15;b16;b17;b18;b19;b20;b21;b22;b23;b24;b25|]



(** array in which to hold our dice *)
let dicearray = Array.make_matrix 4 4 []
(** filled array of 4x4 dice *)
let dice = 
  dicearray.(0).(0) <- dieArray.(0);
  dicearray.(0).(1) <- dieArray.(1);
  dicearray.(0).(2) <- dieArray.(2);
  dicearray.(0).(3) <- dieArray.(3);
  dicearray.(1).(0) <- dieArray.(4);
  dicearray.(1).(1) <- dieArray.(5);
  dicearray.(1).(2) <- dieArray.(6);
  dicearray.(1).(3) <- dieArray.(7);
  dicearray.(2).(0) <- dieArray.(8);
  dicearray.(2).(1) <- dieArray.(9);
  dicearray.(2).(2) <- dieArray.(10);
  dicearray.(2).(3) <- dieArray.(11);
  dicearray.(3).(0) <- dieArray.(12);
  dicearray.(3).(1) <- dieArray.(13);
  dicearray.(3).(2) <- dieArray.(14);
  dicearray.(3).(3) <- dieArray.(15);
  dicearray

let bigdicearray = Array.make_matrix 5 5 []
let bigDice = 
  bigdicearray.(0).(0) <- bigDieArray.(0);
  bigdicearray.(0).(1) <- bigDieArray.(1);
  bigdicearray.(0).(2) <- bigDieArray.(2);
  bigdicearray.(0).(3) <- bigDieArray.(3);
  bigdicearray.(0).(4) <- bigDieArray.(4);
  bigdicearray.(1).(0) <- bigDieArray.(5);
  bigdicearray.(1).(1) <- bigDieArray.(6);
  bigdicearray.(1).(2) <- bigDieArray.(7);
  bigdicearray.(1).(3) <- bigDieArray.(8);
  bigdicearray.(1).(4) <- bigDieArray.(9);
  bigdicearray.(2).(0) <- bigDieArray.(10);
  bigdicearray.(2).(1) <- bigDieArray.(11);
  bigdicearray.(2).(2) <- bigDieArray.(12);
  bigdicearray.(2).(3) <- bigDieArray.(13);
  bigdicearray.(2).(4) <- bigDieArray.(14);
  bigdicearray.(3).(0) <- bigDieArray.(15);
  bigdicearray.(3).(1) <- bigDieArray.(16);
  bigdicearray.(3).(2) <- bigDieArray.(17);
  bigdicearray.(3).(3) <- bigDieArray.(18);
  bigdicearray.(3).(4) <- bigDieArray.(19);
  bigdicearray.(4).(0) <- bigDieArray.(20);
  bigdicearray.(4).(1) <- bigDieArray.(21);
  bigdicearray.(4).(2) <- bigDieArray.(22);
  bigdicearray.(4).(3) <- bigDieArray.(23);
  bigdicearray.(4).(4) <- bigDieArray.(24);
  bigdicearray


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

let make_board m n: board = 
  let choose_die m =
    if m = 4 then dicearray
    else bigdicearray
  in
  let die = choose_die m in
  let arr = Array.make_matrix m n ' ' in
  let edit_arr arr = 
    for x=0 to m-1 do 
      for y=0 to n-1 do
        arr.(x).(y) <- random_letter die.(x).(y)
      done
    done in 

  edit_arr arr;

  arr



let print_board (board:board) : unit=
  let board_format = 
    if Array.length board = 4 then 
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
      Char.escaped board.(3).(3) ^ "\n" 

    else 
      Char.escaped board.(0).(0) ^ "  " ^ 
      Char.escaped board.(0).(1) ^ "  " ^ 
      Char.escaped board.(0).(2) ^ "  " ^ 
      Char.escaped board.(0).(3) ^ "  " ^
      Char.escaped board.(0).(4) ^ "\n" ^
      Char.escaped board.(1).(0) ^ "  " ^ 
      Char.escaped board.(1).(1) ^ "  " ^ 
      Char.escaped board.(1).(2) ^ "  " ^ 
      Char.escaped board.(1).(3) ^ "  " ^ 
      Char.escaped board.(1).(4) ^ "\n" ^
      Char.escaped board.(2).(0) ^ "  " ^ 
      Char.escaped board.(2).(1) ^ "  " ^ 
      Char.escaped board.(2).(2) ^ "  " ^ 
      Char.escaped board.(2).(3) ^ "  " ^
      Char.escaped board.(2).(4) ^ "\n" ^
      Char.escaped board.(3).(0) ^ "  " ^ 
      Char.escaped board.(3).(1) ^ "  " ^ 
      Char.escaped board.(3).(2) ^ "  " ^ 
      Char.escaped board.(3).(3) ^ "  " ^
      Char.escaped board.(3).(4) ^ "\n" ^
      Char.escaped board.(4).(0) ^ "  " ^ 
      Char.escaped board.(4).(1) ^ "  " ^ 
      Char.escaped board.(4).(2) ^ "  " ^ 
      Char.escaped board.(4).(3) ^ "  " ^
      Char.escaped board.(4).(4)
  in 

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




