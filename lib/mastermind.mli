
module IntSet : Set.S with type elt = int
module IntMap : Map.S with type key = int

val matches : int -> int -> int
val hits : int -> int -> int
val validate : int -> int -> int
val number_to_codeword : int -> int
val all_codewords : IntSet.t
val narrow : int -> int -> IntSet.t -> IntSet.t
val max_result_scores : int -> IntSet.t -> int
val min_max_result_scores : IntSet.t -> int
val guess_move : int -> int -> int -> IntSet.t -> (int * int) list
val print_moves : (int * int) list -> unit
