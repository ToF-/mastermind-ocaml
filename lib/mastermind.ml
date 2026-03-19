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
