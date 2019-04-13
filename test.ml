open OUnit2
open State

(** TODO DOCUMENT
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
let zara2 = update_state zara "hello" 5

let state_tests = [
  "get_words_found test" >:: (fun _ -> assert_equal [] (get_words_found init_player));
  "get_points test" >:: (fun _ -> assert_equal 0 (get_points init_player));
  "update_state test1" >:: (fun _ -> assert_equal 5 (get_points zara2));
  "update_state test2" >:: (fun _ -> assert_equal ["hello"] (get_words_found zara2));
  "update_state test3 - check can't add duplicate word" >:: 
  (fun _ -> assert_equal ["hello"] (get_words_found (update_state zara2 "hello" 5)));
  "update_state test4 - check can't add duplicate word points" >:: 
  (fun _ -> assert_equal 5 (get_points(update_state zara2 "hello" 5)));
  "update_state test5" >:: (fun _ -> assert_equal ["hello"; "hi"] (get_words_found (update_state zara2 "hi" 2)) ~cmp:cmp_set_like_lists);
  "update_state test6" >:: (fun _ -> assert_equal 7 (get_points (update_state zara2 "hi" 2)));

]




let tests =
  "test suite for midterm"  >::: List.flatten [
    state_tests;

  ]

let _ = run_test_tt_main tests