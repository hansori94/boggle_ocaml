open Board
open Parse
open State
open Trie

(** raised if game timer runs out *)
exception TimeOut

(** [timer_helper x] takes in a function [x] and returns unit, used to help 
    start the timer
*)
let timer_helper x =
  ()

(** [timeout] catches the SIGALRM raised by the timer and returns 
    exception TimeOut
    Requires: nothing!
    Raises: exception [TimeOut]
    Example: [timeout _] raises exception [TimeOut].
*)
let timeout _ = 
  raise TimeOut

(** [print_time status] prints the time remaining in the game 
    at time [status] *)
let print_time (status: Unix.interval_timer_status) = 
  let timeleft = int_of_float status.it_value in 
  ANSITerminal.(print_string [red] ("Time Remaining: \
                                    "^(string_of_int timeleft)^" seconds\n"))

(** [start_game input] creates a new game state and begins reading player
    input.
    Requires: trie is a valid trie implementation, [state] is of type
    Player.state
    Returns: unit *)
let rec start_game input state trie = 
  match Parse.parse input with
  | Quit -> 
    ANSITerminal.(print_string
                    [magenta;Bold] "Quitting the game... Goodbye!\n");
    ()
  | Start(size) -> 
    let create_board size = 
      if size = ["small"] then 
        Board.make_board 4 4 
      else Board.make_board 5 5
    in

    let board = create_board size in
    (* let state = State.init_player in *)
    let timer = Unix.ITIMER_REAL in 
    let (timer_starter: Unix.interval_timer_status) = 
      if size = 
         ["small"] then {
        it_interval = 121.;
        it_value = 121.;
      } else {
        it_interval = 181.;
        it_value = 181.;
      } in

    (** [play_game board state] plays the game 
        with [board] and updates [state] *)
    let rec play_game board state trie = 
      try
        Sys.set_signal (-2) (Signal_handle timeout);
        Board.print_board board; print_endline " ";
        State.print_score state;
        print_time (Unix.getitimer timer);
        State.print_words state;
        ANSITerminal.(print_string [magenta] "------------------\
                                              -------------------\n");
        ANSITerminal.(print_string [magenta] "Type a word: \n> ");
        let input = read_line () in
        match Parse.parse input with
        | Word(word) -> begin
            let w = List.hd word in
            try (play_game board (State.update_state (state) 
                                    (State.check_valid_word state w board trie)) 
                   trie)
            with
            | TooShort ->
              ANSITerminal.(print_string 
                              [magenta; Bold] "Your word is too short. \
                                               It must have at least \
                                               3 letters...\
                                               Try a longer word!\n\n");
              play_game board state trie
            | Duplicate -> 
              ANSITerminal.(print_string 
                              [magenta; Bold] "You already found this word. \
                                               Try another word!\n\n");
              play_game board state trie

            | NotBoard -> 
              ANSITerminal.(print_string 
                              [magenta; Bold] "You can't form that word \
                                               with the current board. \
                                               Try another word!\n\n");
              play_game board state trie
            | NotEnglish -> 
              ANSITerminal.(print_string 
                              [magenta; Bold] "This is not a valid \
                                               English word. \
                                               Try another word!\n\n");
              play_game board state trie
          end

        | Quit -> 
          ANSITerminal.(print_string [magenta] "Quitting the game...\n");
          ANSITerminal.(print_string [magenta] "Would you like to play another \
                                                game of big or small boggle? \
                                                Type (big/small/no): \n> ");
          let input = read_line () in

          (** [help input] starts a new board or quits the game based on user 
              input (small, big,no) 
              Requires: [input] is one of three strings, "big", "small", "no"
              Returns: unit *)
          let rec help input = 
            match String.lowercase_ascii input with 
            | "small" -> 
              ANSITerminal.(print_string 
                              [magenta; Bold] "Starting a new game...\n");
              start_game "start boggle" state trie
            | "big" -> 
              ANSITerminal.(print_string 
                              [magenta; Bold] "Starting a new game...\n");
              start_game "start big boggle" state trie
            | "no" -> ANSITerminal.(print_string [magenta; Bold] "Goodbye! \n");
            | _ -> ANSITerminal.(print_string 
                                   [magenta] "Wrong input. Please type \
                                              (big/small/no): \n> ");
              help (read_line ())
          in 

          help input
        | Shake -> ANSITerminal.(print_string 
                                   [blue; Bold] "Commencing shake!\n\n"); 
          if Array.length board = 4 then
            start_game "start boggle" State.init_player trie
          else
            start_game "start big boggle" State.init_player trie

        | exception Empty ->
          ANSITerminal.(print_string 
                          [magenta;Bold] "You didn't type anything.\n\n"); 
          play_game board state trie
        | exception Malformed -> 
          ANSITerminal.(print_string [magenta;Bold] "Bad input.\n\n");
          play_game board state trie
        | _ -> ()
      with 
        TimeOut -> 
        ANSITerminal.(print_string [red; Bold] "\n\n\n\n\n------------------\
                                                -------------------\n");
        ANSITerminal.(print_string [red; Bold] "Time's Up!\n\n");
        ANSITerminal.(print_string [red] "Final ");
        State.print_score state;
        ANSITerminal.(print_string 
                        [magenta; Bold] "\nType 'start boggle' or \
                                         'start big boggle' to start \
                                         a new game!\n");
        print_string "> ";
        start_game (read_line ()) State.init_player trie
    in 
    timer_helper (Unix.setitimer timer timer_starter);
    play_game board state trie
  | exception Empty -> 
    ANSITerminal.(print_string [magenta;] "You didn't type anything. \
                                           Type 'start boggle' or 'start big \
                                           boggle' to start \
                                           playing!\n"); 
    print_string "> ";
    start_game (read_line()) state trie
  | exception Malformed -> 
    ANSITerminal.(print_string [magenta] "Your instruction was badly formed. \
                                          Type 'start boggle' or 'start big \
                                          boggle' to start playing!\n"); 
    print_string "> ";
    start_game (read_line()) state trie
  | _ -> 
    ANSITerminal.(print_string 
                    [magenta] "Wrong input. Type \
                               'start boggle' or 'start big boggle' \
                               to start playing!\n");
    print_string "> ";
    start_game (read_line()) state trie





(**[main] plays the game! *)
let main () = 
  ANSITerminal.(print_string [magenta; Bold] "\nWelcome to Boggle!\n");
  let board = Board.make_board 4 4 in
  Board.print_board board;
  ANSITerminal.(print_string [yellow] 
                  "Form words by stringing together adjacent characters in \
                   any direction. You can play normal Boggle with a 4x4 board \
                   or Big Boggle with a 5x5 board!\n\
                   How to Play:\n\
                   1. Words only count once.\n\
                   2. Words must be at least 3 characters.\n\
                   3. A specifc character may only be used once in a single word.\n\
                   4. Case doesn't matter!\n\
                   Have fun!");
  ANSITerminal.(print_string 
                  [blue;Bold] "\n...and type 'shake it' while playing \
                               to reset the game with a new board!\n");       
  ANSITerminal.(print_string 
                  [magenta] "\nType 'start boggle' or 'start big boggle' \
                             to start playing, \n\
                             or type 'quit game' to exit!\n");
  print_string "> ";
  let trie = insert (words "dictionary.txt") empty in
  match read_line () with
  | input -> 
    start_game input State.init_player trie
  | exception End_of_file -> 
    ANSITerminal.(print_string [magenta] "\nGoodbye!\n"); ()


let () = main ()
