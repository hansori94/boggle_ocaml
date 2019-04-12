open OUnit2
open State


let state_tests = [
  "placeholder" >:: (fun _ -> assert_equal 1 1);
]


let tests =
  "test suite for midterm"  >::: List.flatten [
    state_tests;

  ]

let _ = run_test_tt_main tests