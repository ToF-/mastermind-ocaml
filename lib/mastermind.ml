let matches guess secret = 
    let rec matches_acc n guess secret = 
        if n = 0
        then 0
        else match (guess mod 10) = (secret mod 10) with
        true -> 1 + matches_acc (n - 1) (guess / 10) (secret / 10)
        | false ->    matches_acc (n - 1) (guess / 10) (secret / 10)
    in matches_acc 4 guess secret
