
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


(** [words f] is a list of all words in a .txt file [f]*)
let words f = 
  let file = Pervasives.open_in f in
  let lst = [] in
  let return = 
    let rec getwords f lst = 
      match Pervasives.input_line f with
      | exception End_of_file -> lst
      | w -> getwords f (w::lst) in
    getwords (file) (lst) in
  Pervasives.close_in file;
  return 


(** [insert_word t lst] is a trie [t] with the word represented by [lst] 
    inserted. 
    Requires: 
    [lst] is a character list of the word ( "ace" -> ['a';'c';'e'] 

*)
(* let rec insert_word trie lst = 
   match lst with
   | h::t -> 
    if h not in trie.[]:
      insert h into trie.[]
      if t=[]:
        trie.[h].bool = true
      insert_word trie.[h] t
   else:
      if t=[]:
        trie.[h].bool = true
      insert_word trie.[h] t

   | [] -> trie *)




(* let rec contains_key key nodelist = 
   match nodelist with
   | Node(c, _, _)::t -> 
    if key = c then true else contains_key key t
   | [] -> false

   let rec get_key_node key nodelist = 
   match nodelist with
   | Node(c, l, b)::t ->
    if key = c then Node(c, l, b) else get_key_node key t
   | [] -> failwith "this key does not exist in this list"

   let check_bool_matching node bool=
   match node with
   |Node(_, _, b) -> if b = bool then true else false

   (** TODO DOCUMENT BETTER
    remove the node with the given key from the nodelist
 *)
   let rec remove_key nodelist key acc=
   match nodelist with
   | Node(c, l, b)::t ->
    if key = c then remove_key t key acc  else remove_key t key (Node(c,l,b)::acc)
   | [] -> acc

<<<<<<< HEAD

(* if contains_key k list then 
   let curr = get_key_node key list in
   if check_bool_matching curr islast then Node(c, list, b) else
   if islast = false then Node(c, list, b) else
    let new_list = Node(k, )::(remove_key list key [])
                     Node(c, blah, b) *)
=======
   let update_key_bool nodelist key = 
   match nodelist with
   | Node(c, l, b)::t ->
    if key = c then 

      let insert_char k trie (islast:bool) = 
        match trie with
        | Node(" ", [], false) -> Node(" ", [Node(k, [], islast)], false)
        | Node(c, [], b) -> Node(c, [Node(k, [], islast)], b)
        | Node(c, list, b) ->
          if contains_key k list then 
            let curr = get_key_node key list in
            if check_bool_matching curr islast then Node(c, list, b) else
            if islast = false then Node(c, list, b) else
              let new_list = Node(k, )::(remove_key list key [])
                               Node(c, blah, b) *)
>>>>>>> 946ffcda94db6dd9cd45abf569014da974a046a2

(** TODO DOCUMENT BETTER
    takes in a key and a trie and returns a new trie with the key added
    or if the key is already there just returns the same trie
*)
let insert key trie : t = 
  failwith "unimplemented"


(** TODO DOCUMENT BETTER
    returns whether a given key is present in a trie
*)
let search key trie : bool = 
  failwith "Unimplemented"