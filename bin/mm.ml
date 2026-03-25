let main () =
  if Array.length Sys.argv < 2 then (
    print_endline "Usage: program <int>";
    exit 1
  );

  let arg =
    try int_of_string Sys.argv.(1)
    with Failure _ ->
      print_endline "Error: argument must be an integer";
      exit 1
  let result = guess_move 1 arg 1122 all_codewords in print_moves result

let () = main ()
