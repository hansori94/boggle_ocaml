open Board
open Parse
open State

exception TimeOut

let timer_helper x =
  ()

let timeout _ = 
  raise TimeOut

let print_time (status: Unix.interval_timer_status) = 
  let timeleft = int_of_float status.it_value in 
  ANSITerminal.(print_string [red] ("Time Remaining: \
                                    "^(string_of_int timeleft)^" seconds\n"))

(** [start_game input] plays the game *)
let rec start_game input state = 
  match Parse.parse input with
  | Quit -> 
    ANSITerminal.(print_string [magenta] "Quitting the game... Goodbye!\n");
    ()
  | Start -> 
    let board = Board.make_board 4 4 in
    (* let state = State.init_player in *)
    let timer = Unix.ITIMER_REAL in 
    let (timer_starter: Unix.interval_timer_status) = {
      it_interval = 121.;
      it_value = 121.;
    } in

    (** [play_game board state] plays the game with [board] and updates [state] *)
    let rec play_game board state = 
      try
        Sys.set_signal (-2) (Signal_handle timeout);
        Board.print_board board; print_endline " ";
        State.print_score state;
        print_time (Unix.getitimer timer);
        State.print_words state;
        (* TODO:
           1) Prints out player's current score and word list in State *)
        ANSITerminal.(print_string [magenta] "Type a word: \n> ");
        let input = read_line () in
        match Parse.parse input with
        | Word(word) -> begin
            let w = List.hd word in
            try (play_game board (State.update_state (state) 
                                    (State.check_valid_word state w)))
            with
            | TooShort ->
              ANSITerminal.(print_string [magenta; Bold] "Your word is too short. \
                                                          It must have at least \
                                                          3 letters...\
                                                          Try a longer word! \n");
              play_game board state 
            | Duplicate -> 
              ANSITerminal.(print_string [magenta; Bold] "You already found this\
                                                          word.\
                                                          Try another word! \n");
              play_game board state
          end

        | Quit -> 
          ANSITerminal.(print_string [magenta] "Quitting the game...\n");
          ANSITerminal.(print_string [magenta] "Would you like to play another \
                                                game? \
                                                Type (y/n): \n> ");
          let input = read_line () in

          (** [help input] starts a new board or quits the game based on user 
              input (y,n) *)
          let rec help input = 
            match String.lowercase_ascii input with 
            | "y" -> 
              ANSITerminal.(print_string [magenta; Bold] "Starting a new game...\n");
              start_game "start game" state
            | "n" -> ANSITerminal.(print_string [magenta; Bold] "Goodbye! \n");
            | _ -> ANSITerminal.(print_string [magenta] "Wrong input. Please type \
                                                         (y/n): \n> ");
              help (read_line ())
          in 

          help input
        | Shake -> ANSITerminal.(print_string [blue; Bold] "Commencing shake!\n"); 
          start_game "start game" State.init_player 

        | exception Empty ->
          ANSITerminal.(print_string [magenta] "You didn't type anything. \
                                                Type a word: \n>"); 
          play_game board state 
        | exception Malformed -> 
          ANSITerminal.(print_string [magenta] "Bad input. Type a word: \n>");
          play_game board state 
        | _ -> ()
      with 
        TimeOut -> 
        ANSITerminal.(print_string [red; Bold] "\n\n\n\n\n------------------\
                                                -------------------\n");
        ANSITerminal.(print_string [red; Bold] "Time's Up!\n\n");
        ANSITerminal.(print_string [red] "Final ");
        State.print_score state;
        ANSITerminal.(print_string [magenta; Bold] "\nType 'start game' to start \
                                                    a new game!\n");
        print_string "> ";
        start_game (read_line ()) State.init_player
    in 
    timer_helper (Unix.setitimer timer timer_starter);
    play_game board state
  | exception Empty -> 
    ANSITerminal.(print_string [magenta] "You didn't type anything.\n
                                          Type 'start game' to start playing!\n"); 
    print_string "> ";
    start_game (read_line()) state
  | exception Malformed -> 
    ANSITerminal.(print_string [magenta] "Your instruction was badly formed. \
                                          Type 'start game' to start playing!\n"); 
    print_string "> ";
    start_game (read_line()) state
  | _ -> 
    ANSITerminal.(print_string [magenta] "Wrong input. Type \
                                          'start game' to start playing!\n");
    print_string "> ";
    start_game (read_line()) state






let main () = 
  ANSITerminal.(print_string [magenta; Bold] "\nWelcome to Boggle!\n");
  (* TODO: Write Instructions *)
  ANSITerminal.(print_string [yellow] 
                  "\nForm words by stringing together adjacent characters in \
                   any direction.\n\
                   How to Play:\n\
                   1. Words only count once.\n\
                   2. Words must be at least 3 characters.\n\
                   3. A specifc character may only be used once in a single word.\n\
                   4. Case doesn't matter!\n\
                   Have fun!");
  ANSITerminal.(print_string [blue] "\n...and type 'shake it' while playing \
                                     to reset the game with a new board!\n");       
  ANSITerminal.(print_string [magenta] "\nType 'start game' to start playing, \n\
                                        or type 'quit game' to exit!\n");
  print_string "> ";
  match read_line () with
  | input -> start_game input State.init_player
  | exception End_of_file -> 
    ANSITerminal.(print_string [magenta] "\nGoodbye!\n"); ()


let () = main ()
