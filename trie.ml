
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

let get_node_val node =
  match node with 
  | Node(c, _, _) -> c



let insert_char k trie (islast:bool) = 
  match trie with
  | Node(" ", [], false) -> Node(" ", [Node(k, [], islast)], false)
  | Node(c, [], b) -> Node(c, [Node(k, [], islast)], b)
  | Node(c, list, b) ->
    if List.mem Node(k, _, _) list then Node(c, list, b) else

      (** TODO DOCUMENT BETTER
          takes in a key and a trie and returns a new trie with the key added
          or if the key is already there just returns the same trie
      *)
      let insert key trie : t = 
        failwith "unimplemented"
(* match trie with 
   | empty -> Node(" ", [], false) *)

(** TODO DOCUMENT BETTER
    returns whether a given key is present in a trie
*)
let search key trie : bool = 
  failwith "Unimplemented"