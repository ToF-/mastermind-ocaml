open OUnit2
open Mastermind

module IntSet = Set.Make(Int)

let tests = "mastermind" >::: [
    "same color on same position count as matches" >::
        (fun _ -> assert_equal 2 (matches 1234 1664));

    "not any color matching counts as zero matches" >::
        (fun _ -> assert_equal 0 (matches 1122 3456));

    "all colors matching counts as four matches" >::
        (fun _ -> assert_equal 4 (matches 1645 1645));

    "hits count all matching colors indifferent of position" >::
        (fun _ -> assert_equal 3 (hits 1234 1345));

    "hits is zero if no matching colors at all" >::
        (fun _ -> assert_equal 0 (hits 1234 5555));

    "validate counts matching colors with correct and incorrect positions" >::
        (fun _ -> assert_equal 12 (validate 1234 5324));

    "40 means all matching positions and colors" >::
        (fun _ -> assert_equal 40 (validate 1643 1643));



    "04 means all colors in incorrect positions" >::
        (fun _ -> assert_equal 04 (validate 1234 4123));
    
    "number_to_codeword converts 0 to 1111" >::
        (fun _ -> assert_equal 1111 (number_to_codeword 0));

    "number_to_codeword converts 1295 to a 6666" >::
        (fun _ -> assert_equal 6666 (number_to_codeword 1295));

    "a set of all codewords from 1111 to 6666" >::
        (fun _ -> assert_equal 1296 (Mastermind.IntSet.cardinal all_codewords));

    "narrowing a set from all codewords that match a given codeword for a given result" >::
        (fun _ -> assert_equal 256 (Mastermind.IntSet.cardinal (narrow 1122 10 all_codewords)));

    "narrowed set does not contain the codeword that was used to narrow it" >::
        (fun _ -> assert_equal false (Mastermind.IntSet.mem 1122 (narrow 1122 10 all_codewords)));

    "max of result scores for a given codeword against all candidate codewords" >::
        (fun _ -> assert_equal 256 (max_result_scores 1122 all_codewords));

    "min max of result scores for all codewords against all candidate codewords" >::
        (fun _ -> assert_equal 1122 (min_max_result_scores all_codewords));

    "guess all the moves to find the secret codeword" >::
        (fun _ -> let result = guess_move 1 1643 1122 all_codewords in
        assert_equal [(1122,10); (1344,21); (1445,20); (1643,40)] result);
]

let () =
  run_test_tt_main tests
