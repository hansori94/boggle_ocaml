
type key = string

(* the key is the value at the node (ex: "a") and the t list is its children
   and the bool is whether its the end of a word *)
type t = Node of key * t list * bool


let empty : t = 
  Node(" ", [], false)


let is_empty trie = 
  match trie with
  | Node(" ", [], false) -> true
  | _ -> false


(** TODO DOCUMENT BETTER
    takes in a key and a trie and returns a new trie with the key added
    or if the key is already there just returns the same trie
*)
let insert key trie : t = 
  failwith "Unimplemented"

(** TODO DOCUMENT BETTER
    returns whether a given key is present in a trie
*)
let search key trie : bool = 
  failwith "Unimplemented"