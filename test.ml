open OUnit2
open State
open Parse
open Trie

(** [cmp_set_like_lists lst1 lst2] checks if two lists contain the same values
    ignoring order
    Acknowledgments: this method was taken from a previous assignment
*)
let cmp_set_like_lists lst1 lst2 =
  let uniq1 = List.sort_uniq compare lst1 in
  let uniq2 = List.sort_uniq compare lst2 in
  List.length lst1 = List.length uniq1
  &&
  List.length lst2 = List.length uniq2
  &&
  uniq1 = uniq2

let zara = init_player
let zara2 = update_state zara "hello" 

let state_tests = [
  "get_words_found test" >:: 
  (fun _ -> assert_equal [] (get_words_found init_player));
  "get_points test" >:: (fun _ -> assert_equal 0 (get_points init_player));
  "update_state test1" >:: (fun _ -> assert_equal 5 (get_points zara2));
  "update_state test2" >:: 
  (fun _ -> assert_equal ["hello"] (get_words_found zara2));
  "update_state test3 - check can't add duplicate word" >:: 
  (fun _ -> assert_equal ["hello"] 
      (get_words_found (update_state zara2 "hello")));
  "update_state test4 - check can't add duplicate word points" >:: 
  (fun _ -> assert_equal 5 (get_points(update_state zara2 "hello")));
  "update_state test5" >:: (fun _ -> assert_equal ["hello"; "hi"] 
                               (get_words_found (update_state zara2 "hi")) 
                               ~cmp:cmp_set_like_lists);
  "update_state test6" >:: 
  (fun _ -> assert_equal 7 (get_points (update_state zara2 "hi")));

]

let bar1 = fun () -> parse " "
let bar2 = fun () -> parse " hello there"
let bar3 = fun () -> parse "quit game now"
let bar4 = fun () -> parse "start   game now "

let word1 = Word["hello"]

let quit = Quit
let starts = Start["small"]
let startb = Start["big"]
let shake = Shake


let parse_tests = [
  "parse empty" >:: (fun _ -> assert_raises Empty bar1);
  "parse malformed too many words" >:: (fun _ -> assert_raises Malformed bar2);
  "parse malformed quit with word other than game" >:: 
  (fun _ -> assert_raises Malformed bar3);
  "parse malformed start with word other than game" >:: 
  (fun _ -> assert_raises Malformed bar4);
  "parse word is hello" >:: (fun _ -> assert_equal word1 (parse "hello"));
  "parse word is hello spaces" >:: 
  (fun _ -> assert_equal word1 (parse "    hello "));
  "parse quit game" >:: (fun _ -> assert_equal quit (parse "quit game"));
  "parse quit game with spaces" >:: 
  (fun _ -> assert_equal quit (parse "  quit     game  "));
  "parse start game" >:: (fun _ -> assert_equal starts (parse "start boggle"));
  "parse start game with spaces" >:: 
  (fun _ -> assert_equal startb (parse "  start   big  boggle  "));
  "parse shake" >:: 
  (fun _ -> assert_equal shake (parse "    shake it "));
]

let h_trie = insert ["h"] empty
let example_trie = insert (words "example.txt") empty

let trie_tests = [
  "is_empty test true" >:: (fun _ -> assert_equal true (is_empty empty));
  "is_empty test false" >:: (fun _ -> assert_equal false (is_empty h_trie));

  (* insertion/search tests *)
  "insert and search for a word" >:: 
  (fun _ -> assert_equal true (search "hello" (insert ["hello"] empty)));
  "insert and search for a not present word" >::
  (fun _ -> assert_equal false (search "bye" (insert ["hello"] empty)));
  "insert and search for a partial word" >::
  (fun _ -> assert_equal false (search "hell" (insert ["hello"] empty)));
  "search for a word in an empty trie" >::
  (fun _ -> assert_equal false (search "hello" empty));
  "insert multiple words" >::
  (fun _ -> assert_equal true
      (search "hell" (insert ["hello";"hell";"help";"also"] empty)));
  "insert already inserted word" >::
  (fun _ -> assert_equal (insert ["hello"] empty) 
      (insert ["hello"] (insert ["hello"] empty)));
  "search for words imported from file" >::
  (fun _ -> assert_equal true 
      ((search "delthyrial" example_trie) &&
       (search "delthyrium" example_trie) &&
       (search "deltic" example_trie) &&
       (search "deltidia" example_trie)));
  "search for not present words imported from file" >::
  (fun _ -> assert_equal false 
      ((search "elthyrial" example_trie) ||
       (search "delthyriu" example_trie) ||
       (search "delic" example_trie) ||
       (search "pepperoni" example_trie)));


]




let tests =
  "test suite for midterm"  >::: List.flatten [
    state_tests;
    parse_tests;
    trie_tests;
  ]

let _ = run_test_tt_main tests