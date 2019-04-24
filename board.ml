open Trie

type board = (char array) array


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



(** array in which to hold our 4x4 dice *)
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

(** array in which to hold our 5x5 dice *)
let bigdicearray = Array.make_matrix 5 5 []
(** filled array of 5x5 dice *)
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

(** Hashtable for 4x4 board *)
let lookup = 
  Hashtbl.create 16

(** Hashtable for 5x5 board *)
let lookupBig = 
  Hashtbl.create 25


(** [random_letter str] takes in a char list [str] and returns a randomly 
    selected char from that char list.
    Requires: str is a valid char list.
    Returns: random letter from [str].
    Example: [random_letter ['a';'n'] is 'n']

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


(**[make_board m n] creates an object of type board with dimensions m X n.
   Requires: m and n are ints..
   Returns: [board] with dimensions m X n. 
*)
let make_board m n: board = 
  let choose_die m =
    if m = 4 then dicearray
    else bigdicearray
  in
  let choose_hash m =
    if m=4 then lookup
    else lookupBig 
  in
  let hash = choose_hash m in 
  let die = choose_die m in
  let arr = Array.make_matrix m n ' ' in
  let edit_arr arr = 
    Hashtbl.clear hash;
    for x=0 to m-1 do 
      for y=0 to n-1 do
        let c = random_letter die.(x).(y) in 
        arr.(x).(y) <- c;
        Hashtbl.add hash c (x,y);
      done
    done in 

  edit_arr arr;

  arr


(**[print_board] prints [board] to the console
   in a 4x4 or 5x5 grid.
   Requires: [board] is a valid char array
   Returns: unit after printing. *)
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

(** Rules of which 'tiles' are adjacent to each other for 4x4 board*)
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

(** Rules of which 'tiles' are adjacent to each other for 5x5 board *)
let adjacency_array_big = 
  let arr = Array.make 25 [] in 
  arr.(0) <- [1;5;6];
  arr.(1) <- [0;5;6;7;2];
  arr.(2) <- [1;6;7;8;3];
  arr.(3) <- [2;7;8;9;4];
  arr.(4) <- [3;8;9];
  arr.(5) <- [0;1;6;10;11];
  arr.(6) <- [0;1;2;5;7;10;11;12];
  arr.(7) <- [1;2;3;6;8;11;12;13];
  arr.(8) <- [2;3;4;7;9;12;13;14];
  arr.(9) <- [3;4;8;13;14];
  arr.(10) <- [5;6;11;15;16];
  arr.(11) <- [5;6;7;10;12;15;16;17];
  arr.(12) <- [6;7;8;11;13;16;17;18];
  arr.(13) <- [7;8;9;12;14;17;18;19];
  arr.(14) <- [8;9;13;18;19];
  arr.(15) <- [10;11;16;20;21];
  arr.(16) <- [10;11;12;15;17;20;21;22];
  arr.(17) <- [11;12;13;16;18;21;22;23];
  arr.(18) <- [12;13;14;17;19;22;23;24];
  arr.(19) <- [13;14;18;23;24];
  arr.(20) <- [15;16;21];
  arr.(21) <- [15;16;17;20;22];
  arr.(22) <- [16;17;18;21;23];
  arr.(23) <- [17;18;19;22;24];
  arr.(24) <- [18;19;23];
  arr

(** [get_char n board] given a position [n] on a board, return the character at 
    that position on [board]. 
    Positions are numbered starting from 0 in the top left corner.

    Requires: 
    -board is either 4x4 or 5x5
*)
let get_char n board =
  if Array.length board = 4 then 
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
  else
  if n=0 then board.(0).(0) else
  if n=1 then board.(0).(1) else
  if n=2 then board.(0).(2) else
  if n=3 then board.(0).(3) else
  if n=4 then board.(0).(4) else
  if n=5 then board.(1).(0) else
  if n=6 then board.(1).(1) else
  if n=7 then board.(1).(2) else
  if n=8 then board.(1).(3) else
  if n=9 then board.(1).(4) else
  if n=10 then board.(2).(0) else
  if n=11 then board.(2).(1) else
  if n=12 then board.(2).(2) else
  if n=13 then board.(2).(3) else
  if n=14 then board.(2).(4) else
  if n=15 then board.(3).(0) else
  if n=16 then board.(3).(1) else
  if n=17 then board.(3).(2) else
  if n=18 then board.(3).(3) else
  if n=19 then board.(3).(4) else
  if n=20 then board.(4).(0) else
  if n=21 then board.(4).(1) else
  if n=22 then board.(4).(2) else
  if n=23 then board.(4).(3) else
    board.(4).(4)

(** [index_to_pos m (f,s)] given an index (f,s) on a board of size mxm,
    get the corresponding position 
    Requires:
    -if m = 4 then index must be between (0,0)-(3,3)
    -if m = 5 then index must be between (0,0)-(4,4)
    Returns: int position of board coordinate
    Example: [index_to_pos 4 (1,2) is 6]
*)
let index_to_pos m (f,s) = 
  if m = 4 then 
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
    | _ -> failwith "index_to_pos error4"
  else
    match (f,s) with
    | (0,0) -> 0
    | (0,1) -> 1
    | (0,2) -> 2
    | (0,3) -> 3
    | (0,4) -> 4
    | (1,0) -> 5
    | (1,1) -> 6
    | (1,2) -> 7
    | (1,3) -> 8
    | (1,4) -> 9
    | (2,0) -> 10
    | (2,1) -> 11
    | (2,2) -> 12
    | (2,3) -> 13
    | (2,4) -> 14
    | (3,0) -> 15
    | (3,1) -> 16
    | (3,2) -> 17
    | (3,3) -> 18
    | (3,4) -> 19
    | (4,0) -> 20
    | (4,1) -> 21
    | (4,2) -> 22
    | (4,3) -> 23
    | (4,4) -> 24
    | _ -> failwith "index_to_pos error5"


(** [pos_to_index m n] given a position n on a board of size mxm,
    get the corresponding index 
    Requires:
    -if m = 4 then position must be between 0-15
    -if m = 5 then position must be between 0-24
    Returns: coordinate relating to int position on board.
    Example: [pos_to_index 4 4] is (1,0)
*)
let pos_to_index m n = 
  if m = 4 then 
    match n with
    | 0 -> (0,0)
    | 1 -> (0,1)
    | 2 -> (0,2)
    | 3 -> (0,3)
    | 4 -> (1,0)
    | 5 -> (1,1)
    | 6 -> (1,2)
    | 7 -> (1,3)
    | 8 -> (2,0)
    | 9 -> (2,1)
    | 10 -> (2,2)
    | 11 -> (2,3)
    | 12 -> (3,0)
    | 13 -> (3,1)
    | 14 -> (3,2)
    | 15 -> (3,3)
    | _ -> failwith "pos_to_index error4"
  else
    match n with
    | 0 -> (0,0)
    | 1 -> (0,1)
    | 2 -> (0,2)
    | 3 -> (0,3)
    | 4 -> (0,4)
    | 5 -> (1,0)
    | 6 -> (1,1)
    | 7 -> (1,2)
    | 8 -> (1,3)
    | 9 -> (1,4)
    | 10 -> (2,0)
    | 11 -> (2,1)
    | 12 -> (2,2)
    | 13 -> (2,3)
    | 14 -> (2,4)
    | 15 -> (3,0)
    | 16 -> (3,1)
    | 17 -> (3,2)
    | 18 -> (3,3)
    | 19 -> (3,4)
    | 20 -> (4,0)
    | 21 -> (4,1)
    | 22 -> (4,2)
    | 23 -> (4,3)
    | 24 -> (4,4)
    | _ -> failwith "pos_to_index error5"


(** [remove_dup v a] removes the elements in list [adjacents] that are present in 
    list [visited].
    Requires: [visited] and [adjacents] and [acc] are lists.
    Returns: [adjactents] with similar elements of [visited] removed.
    Example: [remove_dup [1;2] [2;3;4;5]] is [3;4;5]]
*)
let rec remove_dup visited adjacents acc= 
  match adjacents with 
  | h::t ->
    if List.mem h visited then remove_dup visited t acc else
      remove_dup visited t (h::acc)
  | [] -> acc

(** [valid_string word board] is [true] if [word] is a valid string
    from [board] and [false] otherwise.  Valid is defined as makeable from the
    board's sequence of adjacent letters without repeating the same tile

    Requires: [word] is a string and [board] is valid object of type [board].
    Returns: true if the string is valid and false otherwise.
    Example: if the word "hello" can be formed following the rules of Boggle
    on [board], then [valid_string "hello" board] is true.
*)
let rec valid_string word board = 
  let choose_hash m =
    if m=4 then lookup
    else lookupBig 
  in
  let hash = choose_hash (Array.length board) in 
  let l = String.get word 0  in 
  if Hashtbl.mem hash l = false then 
    false
  else 
    let index = Hashtbl.find_all hash l in (* gives us list of positions *)

    let rec check_word (string:string) board visited hash index: bool = 

      let rec visited_indices visited acc= 
        match visited with
        | h::t -> visited_indices t 
                    ((pos_to_index (Array.length board) h)::acc)
        | [] -> acc in 
      let index = remove_dup (visited_indices visited []) index [] in 

      let helper h = 
        let pos = index_to_pos (Array.length board) h in 
        let visited = pos::visited in
        let choose_adjArray board =
          if Array.length board = 4 
          then adjacency_array 
          else adjacency_array_big in 
        let adj_array = choose_adjArray board in 
        let num_adjs = adj_array.(pos) in (* list of adjacent positions *)
        let num_adjs = remove_dup visited num_adjs [] in 
        let rec get_adj_indices poslst acc=
          match poslst with
          | h::t -> 
            get_adj_indices t ((pos_to_index (Array.length board) h)::acc)
          | [] -> acc
        in

        let rec build_possibilities lst acc= 
          match lst with 
          | h::t -> 
            if get_char h board = String.get string 1 then 
              build_possibilities t (h::acc) else
              build_possibilities t acc
          | [] -> acc
        in
        let possible_paths = build_possibilities num_adjs [] in 

        let rec search_adjs (lst:int list) = 
          match lst with 
          | h::t -> 
            if String.length string = 2 then 
              if get_char h board = String.get string 1 then 
                true
              else
                search_adjs t
            else
            if get_char h board = String.get string 1 then 
              check_word (String.sub string 1 ((String.length string) - 1)) 
                board visited hash (get_adj_indices possible_paths [])
            else
              search_adjs t
          | [] -> false
        in 

        search_adjs possible_paths in 

      let rec pos lst b= 
        match lst with
        | [] -> false
        | h::t -> helper h || pos t b in
      pos index false
    in
    check_word word board [] hash index
