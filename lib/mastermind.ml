let matches guess secret = 
    let rec matches_acc n guess secret = 
        if n = 0
        then 0
        else match (guess mod 10) = (secret mod 10) with
        true -> 1 + matches_acc (n - 1) (guess / 10) (secret / 10)
        | false ->    matches_acc (n - 1) (guess / 10) (secret / 10)
    in matches_acc 4 guess secret

let hits guess secret =
    let rank color = match color with
    1 -> 1
    | 2 -> 10
    | 3 -> 100
    | 4 -> 1000
    | 5 -> 10000
    | 6 -> 100000
    | _ -> 0
    in
    let rec colors codeword =
        if codeword = 0 
        then 0
        else rank (codeword mod 10) + colors (codeword / 10)
    in
    let rec hits_acc n colors_guess colors_secret = 
        if n = 0
        then 0
        else min (colors_guess mod 10) (colors_secret mod 10)
        + hits_acc (n - 1) (colors_guess / 10) (colors_secret / 10)
    in
    hits_acc 4 (colors guess) (colors secret)

let validate guess secret = 
    let m = matches guess secret 
    in
    let h = hits guess secret
    in (m * 10) + (h - m)

let number_to_codeword n = 
    let rec number_to_codeword_acc i n =
        if i = 0
        then 0
        else (n mod 6) + 1 + 10 * number_to_codeword_acc (i - 1) (n / 6)
    in number_to_codeword_acc 4 n

module IntSet = Set.Make(Int)

let all_codewords =
    let rec all_codewords_acc n =
        if n = 1296
        then []
        else number_to_codeword n :: all_codewords_acc (n + 1)
    in IntSet.of_list (all_codewords_acc 0)

let narrow codeword result codewords =
    IntSet.filter (fun cw -> (validate codeword cw) == result) codewords

module IntMap = Map.Make(Int)

let increment score_opt = match score_opt with
    None -> Some 1
    | Some n -> Some (n + 1)

let accumulate_score codeword candidate scores =
    let key = validate codeword candidate
    in IntMap.update key increment scores

let print_intmap m =
  IntMap.iter (fun k v -> Printf.printf "%d -> %d\n" k v) m

let print_intset s =
    IntSet.iter (fun k -> Printf.printf "%d\n" k) s

let max_result_scores codeword codewords =
    let scores = IntSet.fold (fun cw -> accumulate_score cw codeword) codewords IntMap.empty
    in IntMap.fold (fun _ score result -> max score result) scores 0

