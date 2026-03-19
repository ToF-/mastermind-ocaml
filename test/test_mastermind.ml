open OUnit2
open Mastermind

let tests = "mastermind" >::: [
    "dummy" >:: (fun _ -> assert_equal 2 (matches 1234 1664));
]

let () =
  run_test_tt_main tests
