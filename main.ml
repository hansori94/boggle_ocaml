open Board
open Parse
open State


let rec start_game input = 
  match Parse.parse input with
  | Start -> 
    Board.print_board (make_board 4 4)
  | exception Empty -> 
    print_endline "\nYou didn't type anything. Type 'start game' to start playing!"; 
    print_string "> ";
    start_game (read_line())
  | exception Malformed -> 
    print_endline "Your instruction was badly formed. Type 'start game' to start playing!"; 
    print_string "> ";
    start_game (read_line())
  | _ -> print_endline "Wrong input. type 'start game' to start playing!";
    print_string "> ";
    start_game (read_line())

let main () = 
  ANSITerminal.(print_string [magenta; Bold] "\nBoggle!\n");
  ANSITerminal.(print_string [magenta] "\ninstructions instructions\n");
  print_string "> ";
  start_game (read_line())


let () = main ()
