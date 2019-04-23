open Trie

type board = (char array) array

let alphabet = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';
                'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']

(** 4x4 set of boggle dice *)
let die1 = ['a';'a';'e';'e';'g';'n'] 
let die14 = ['e';'l';'r';'t';'t';'y']
let die5 = ['a';'o';'o';'t';'t';'w']
let die2 = ['a';'b';'b';'j';'o';'o']
let die12 = ['e';'h';'r';'t';'v';'w']
let die6 = ['c';'i';'m';'o';'t';'u']
let die9 = ['d';'i';'s';'t';'t';'y']
let die13 = ['e';'i';'o';'s';'s';'t']
let die8 = ['d';'e';'l';'r';'v';'y']
let die3 = ['a';'c';'h';'o';'p';'s']
let die15 = ['h';'i';'m';'n';'q';'u']
let die11 = ['e';'e';'i';'n';'s';'u']
let die10 = ['e';'e';'g';'h';'n';'w']
let die4 = ['a';'f';'f';'k';'p';'s']
let die16 = ['h';'l';'n';'n';'r';'z']
let die7 = ['d';'e';'i';'l';'r';'x']
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

let lookup = 
  Hashtbl.create 16


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

let test = 
  [|[|'a';'b';'c';'d'|];[|'e';'f';'g';'h'|];[|'i';'j';'k';'l'|];[|'m';'n';'o';'p'|]|]

let make_board m n: board = 
  let choose_die m =
    if m = 4 then dicearray
    else bigdicearray
  in
  let die = choose_die m in
  let arr = Array.make_matrix m n ' ' in
  let edit_arr arr = 
    Hashtbl.clear lookup;
    for x=0 to m-1 do 
      for y=0 to n-1 do
        let c =  test.(x).(y) in (*random_letter die.(x).(y)*)
        arr.(x).(y) <- c;
        Hashtbl.add lookup c (x,y);
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

let adjacency_array = 
  let arr = Array.make 16 [] in 
  arr.(0) <- [1;4;5];
  arr.(1) <- [0;4;5;6;2];
  arr.(2) <- [1;5;6;7;3];
  arr.(3) <- [2;6;7];
  arr.(4) <- [0;1;5;8;9];
  arr.(5) <- [0;1;2;4;6;8;9;10];
  arr.(6) <- [1;2;3;5;7;9;10;11];
  arr.(7) <- [2;3;6;10;11];
  arr.(8) <- [4;5;9;12;13];
  arr.(9) <- [4;5;6;8;10;12;13;14];
  arr.(10) <- [5;6;7;9;11;13;14;15];
  arr.(11) <- [6;7;10;14;15];
  arr.(12) <- [8;9;13];
  arr.(13) <- [12;8;9;10;14];
  arr.(14) <- [9;10;11;13;15];
  arr.(15) <- [10;11;14];
  arr

let visited_array =
  Array.make 16 false

let get_char n board =
  if n=0 then board.(0).(0) else
  if n=1 then board.(0).(1) else
  if n=2 then board.(0).(2) else
  if n=3 then board.(0).(3) else
  if n=4 then board.(1).(0) else
  if n=5 then board.(1).(1) else
  if n=6 then board.(1).(2) else
  if n=7 then board.(1).(3) else
  if n=8 then board.(2).(0) else
  if n=9 then board.(2).(1) else
  if n=10 then board.(2).(2) else
  if n=11 then board.(2).(3) else
  if n=12 then board.(3).(0) else
  if n=13 then board.(3).(1) else
  if n=14 then board.(3).(2) else
    board.(3).(3)

let index_to_pos (f,s) = 
  match (f,s) with
  | (0,0) -> 0
  | (0,1) -> 1
  | (0,2) -> 2
  | (0,3) -> 3
  | (1,0) -> 4
  | (1,1) -> 5
  | (1,2) -> 6
  | (1,3) -> 7
  | (2,0) -> 8
  | (2,1) -> 9
  | (2,2) -> 10
  | (2,3) -> 11
  | (3,0) -> 12
  | (3,1) -> 13
  | (3,2) -> 14
  | (3,3) -> 15
  | _ -> failwith "index_to_pos error"



let rec get_all_words board = 
  []

let rec print_list list = 
  match list with
  | [] -> print_string "\n"
  | h::t -> print_int h; print_list t

let rec print_string_list (list:string list) = 
  match list with
  | [] -> print_string "\n"
  | h::t -> print_string (h^",  "); print_string_list t


let rec print_char_list (list:char list) = 
  match list with
  | [] -> print_string "\n"
  | h::t -> print_string ((Char.escaped h)^",  "); print_char_list t

let rec cons_list list1 list2 = 
  match list1 with
  | h::t -> if List.mem h list2 then 
      cons_list t list2
    else 
      cons_list t (h::list2)
  | [] -> list2

let rec for_each f lst char n board str trie acc visited z = 
  match lst with
  | h::t ->  
    for_each f t ' ' (-1) board str trie acc visited (f (get_char n board) h board str trie acc visited)
  | [] -> z


let rec dfs (char:char) n board str trie acc visited: string list=
  (* visited_array.(n) <- true; *)
  let visited = n::visited in
  let test_string = str^(Char.escaped (get_char n board)) in
  let new_acc test_string acc = 
    if  String.length test_string > 2 then (*Trie.search test_string trie *)
      if not (List.mem test_string acc) then 
        test_string::acc
      else 
        acc 
    else acc in  
  let ret_acc = new_acc test_string acc in 
  let adjacent = adjacency_array.(n) in 
  let rec rec_call lst ret= 
    match lst with
    | h::t ->
      if not (List.mem h visited)
      (* if visited_array.(h) = false  *)
      then 
        dfs (get_char h board) h board test_string trie ret_acc visited @ rec_call t ret_acc
        (* print_string_list ("BLAH: "::blah);
           print_string "RET_ACC: ";
           print_string_list ret_acc;
           print_string "CONS_LIST: "; *)
        (* print_string_list (cons_list blah ret_acc);  *)
        (* rec_call t (cons_list blah ret) *)
      else 
        rec_call t ret_acc
    | [] -> ret_acc in   

  rec_call adjacent [] 

let rec remove_dup visited adjacents acc= 
  match adjacents with 
  | h::t ->
    if List.mem h visited then remove_dup visited t acc else
      remove_dup visited t (h::acc)
  | [] -> acc


let rec check_word (string:string) board visited: bool = 
  let l = String.get string 0  in 
  if Hashtbl.mem lookup l = false then 
    false
  else
    let index = Hashtbl.find_all lookup l in (* gives us list of positions *)
    let pos = index_to_pos (List.hd index) in 
    let visited = pos::visited in
    let num_adjs = adjacency_array.(pos) in (* list of adjacent positions *)
    let num_adjs = remove_dup visited num_adjs [] in 
    let rec get_char_adjs lst acc= 
      match lst with 
      | h::t -> get_char_adjs t ((get_char h board)::acc)
      | [] -> acc in 
    let char_adjs = get_char_adjs num_adjs [] in (* list of adjacent characters *)
    let rec search_adjs lst = 
      match lst with 
      | h::t -> 
        if String.length string = 2 then 
          if h = String.get string 1 then 
            true
          else
            search_adjs t
        else
        if h = String.get string 1 then 
          check_word (String.sub string 1 ((String.length string) - 1)) board visited
        else
          search_adjs t
      | [] -> false
    in 
    search_adjs char_adjs




(** [valid_string word board] is [true] if [word] is a valid string
    from [board] and [false] otherwise.
*)
let rec valid_string word board = 
  check_word word board []




