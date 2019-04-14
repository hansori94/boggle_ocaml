
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
<<<<<<< HEAD

let get_node_val node =
  match node with 
  | Node(c, _, _) -> c
=======
(* 
let parse filename d =
  let fcode = Pervasives.open_in (d^Filename.dir_sep^filename) in 
  let str_set = S.empty in

  let return = 
    let rec getwords fcode str_set=
      match Pervasives.input_line fcode with
      | exception End_of_file -> str_set
      | s -> getwords fcode (parseline s str_set) in

    getwords fcode str_set in
  Pervasives.close_in fcode;
  return *)

(** [words f] is a list of all words in a .txt file [f]*)
let words f = 
  let file = Pervasives.open_in "example.txt" in
  let lst = [] in
  let return = 
    let rec getwords f lst = 
      match Pervasives.input_line f with
      | exception End_of_file -> lst
      | w -> getwords f (w::lst) in
    getwords (file) (lst) in
  Pervasives.close_in file;
  return 
>>>>>>> fcb851d02c8bbdce4773589d8aae0ba7b39ec834



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