open Board
open Parse


let main () = 
  ANSITerminal.(print_string [red] "\nBoggle!\n");
  print_endline "instructions instructions\n";
  print_string "> ";
  let input = read_line () in
  match Parse.parse input with
  | Start -> print_string "hehe"
  | "start" -> print_string "hehe"
  | _ -> ()



let () = main ()
