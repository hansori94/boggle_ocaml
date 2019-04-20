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

(** TODO - UNEXPOSE *)
val words : string -> string list

(** [insert keylst trie] takes in a key list [keylst] and a trie [trie] and 
    returns a new trie with all the keys added or if the keys are already 
    there just returns a trie with all the same nodes present
*)
val insert : key list -> t -> t

(** [search key trie] returns true if a given string [key] is present in a trie
    [trie], where present is defined as having all the letters in the proper order
    with the last letter's boolean value being true.  Returns false if the 
    string [key] is not in the trie.
*)
val search : key -> t -> bool



val valid_english : string -> t-> bool