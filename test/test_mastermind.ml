open OUnit2
open Mastermind

let tests = "mastermind" >::: [
    "same color on same position count as matches" >:: (fun _ -> assert_equal 2 (matches 1234 1664));
    "not any color matching counts as zero matches" >:: (fun _ -> assert_equal 0 (matches 1122 3456));
    "all colors matching counts as four matches" >:: (fun _ -> assert_equal 4 (matches 1645 1645));
]

let () =
  run_test_tt_main tests
