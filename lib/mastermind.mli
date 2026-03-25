
module IntSet : Set.S with type elt = int
module IntMap : Map.S with type key = int

val matches : int -> int -> int
val hits : int -> int -> int
val validate : int -> int -> int
val number_to_codeword : int -> int
val all_codewords : IntSet.t
val narrow : int -> int -> IntSet.t -> IntSet.t
val max_result_scores : int -> IntSet.t -> int
