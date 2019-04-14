(**
   This module implements a trie data structure
*)

type key = string

(** TODO DOCUMENT BETTER
    abstract type of a node in a trie
*)
type t

(** TODO DOCUMENT BETTER
    an empty trie
*)
val empty : t

(** TODO DOCUMENT BETTER
    tests if a trie is empty
*)
val is_empty: t -> bool

(** TODO DOCUMENT BETTER
    takes in a key and a trie and returns a new trie with the key added
    or if the key is already there just returns the same trie
*)
val insert : key -> t -> t

(** TODO DOCUMENT BETTER
    returns whether a given key is present in a trie
*)
val search : key -> t -> bool