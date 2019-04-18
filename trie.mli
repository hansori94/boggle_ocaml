(**
   This module implements a trie data structure
*)

type key = string

(** Abstract type of a node in a trie *)
type t

(** [empty] creates an empty trie *)
val empty : t

(** [is_empty trie] returns true if the [trie] is empty and false otherwise *)
val is_empty: t -> bool

(** TODO DOCUMENT BETTER
    takes in a key list and a trie and returns a new trie with all the keys added
    or if the keys are already there just returns the same trie
*)
val insert : key list -> t -> t

(** TODO DOCUMENT BETTER
    returns whether a given key is present in a trie
*)
val search : key -> t -> bool