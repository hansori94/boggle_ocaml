open Board
open Parse
open State


(** [start_game input] plays the game *)
let rec start_game input = 
  match Parse.parse input with
  | Start -> 
    let board = Board.make_board 4 4 in
    let state = State.init_player in

    (** [play_game board state] plays the game with [board] and updates [state] *)
    let rec play_game board state = 
      Board.print_board board; print_endline " ";
      State.print_score state;
      (* TODO:
         1) Prints out player's current score and word list in State *)
      ANSITerminal.(print_string [magenta] "Type a word: \n> ");
      let input = read_line () in
      match Parse.parse input with
      | Word(word) ->
        match State.check_valid_word with
        | w -> 
        | exception TooShort ->
        | exception Duplicate -> 

          (* TODO: 
             1) check that word is valid
             2) if valid, update user's score and word list in State. 
             call play_game with the update state
             3) if invalid, print a message letting the user know its not a valid word
             and call play_game with the same state *)
          print_endline "word"
        | Quit -> 
          ANSITerminal.(print_string [magenta] "Quitting the game...\n");
          ANSITerminal.(print_string [magenta] "Would you like to play another game? Type (y/n): \n> ");
          let input = read_line () in

          (** [help input] starts a new board or quits the game based on user input (y,n) *)
          let rec help input = 
            match String.lowercase_ascii input with 
            | "y" -> 
              ANSITerminal.(print_string [magenta; Bold] "Starting a new game...\n");
              start_game "start game"
            | "n" -> ANSITerminal.(print_string [magenta; Bold] "Goodbye! \n");
            | _ -> ANSITerminal.(print_string [magenta] "Wrong input. Please type (y/n): \n> ");
              help (read_line ())
          in 

          help input
        | exception Empty ->
          ANSITerminal.(print_string [magenta] "You didn't type anything. Type a word: \n>"); 
          play_game board state
        | exception Malformed -> 
          ANSITerminal.(print_string [magenta] "Bad input. Type a word: \n>");
          play_game board state
        | _ -> ()

    in 
    play_game board state
  | exception Empty -> 
    ANSITerminal.(print_string [magenta] "You didn't type anything. Type 'start game' to start playing!\n"); 
    print_string "> ";
    start_game (read_line())
  | exception Malformed -> 
    ANSITerminal.(print_string [magenta] "Your instruction was badly formed. Type 'start game' to start playing!\n"); 
    print_string "> ";
    start_game (read_line())
  | _ -> 
    ANSITerminal.(print_string [magenta] "Wrong input. type 'start game' to start playing!\n");
    print_string "> ";
    start_game (read_line())


let main () = 
  ANSITerminal.(print_string [magenta; Bold] "\nWelcome to Boggle!\n");
  (* TODO: Write Instructions *)
  ANSITerminal.(print_string [magenta] "\ninstructions instructions...");
  ANSITerminal.(print_string [magenta] "\nType 'start game' to start playing!\n");
  print_string "> ";
  match read_line () with
  | input -> start_game input
  | exception End_of_file -> 
    ANSITerminal.(print_string [magenta] "\nGoodbye!\n"); ()


let () = main ()
