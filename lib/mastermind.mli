
module IntSet : Set.S with type elt = int

val matches : int -> int -> int
val hits : int -> int -> int
val validate : int -> int -> int
val number_to_codeword : int -> int
val all_codewords : IntSet.t
val narrow : int -> int -> IntSet.t -> IntSet.t
