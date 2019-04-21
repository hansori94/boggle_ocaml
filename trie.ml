
type key = string

(* the key is the value at the node (ex: "a") and the t list is its children
   and the bool is whether its the end of a word *)
(* type t = Node of key * t list * bool * int *)
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

(** [get_children t] returns the children of the trie [t] *)
let get_children t = 
  match t with
  | Node (_, lst, _) -> lst

(** [get_children lst acc] returns the list of keys of trie list [lst] 
    Requires: [acc] is empty *)
let rec get_keys lst acc : key list = 
  match lst with 
  | h::t -> begin 
      match h with
      | Node (k, _, _) -> 
        get_keys t (k::acc)
    end
  | [] -> acc


(** [contains_key key nodelist] returns a boolean value indicating whether or not 
    a key [key] is the key of a node present in [nodelist] 
*)
let rec contains_key key nodelist = 
  match nodelist with
  | Node(c, _, _)::t -> 
    if key = c then true else contains_key key t
  | [] -> false

(** [get_key_node key nodelist] returns the node that has key [key] in the 
    nodelist
    Requires: Node possessing [key] is present in [nodelist]
*)
let rec get_key_node key nodelist = 
  match nodelist with
  | Node(c, l, b)::t ->
    if key = c then Node(c, l, b) else get_key_node key t
  | [] -> failwith "this key does not exist in this list"

(** [remove_key nodelist key acc] removes the node that has key [key] from 
    [nodelist] and returns the rest of the [nodelist]. If called on a [nodelist]
    that does not have a node with [key], will return a nodelist containing 
    all the same elements as the [nodelist]
*)
let rec remove_key nodelist key acc=
  match nodelist with
  | Node(c, l, b)::t ->
    if key = c then remove_key t key acc  else remove_key t key (Node(c,l,b)::acc)
  | [] -> acc



(** [print_list list] prints the list of keys present in a nodelist [list] *)
let rec print_list list = 
  match list with
  | [] -> print_string "\n"
  | Node(h, _, _)::t -> print_string h; print_list t

(** [insert_char key trie] inserts a node with key [key], an empty list of 
    children, and a false isLeaf parameter into a trie [trie].  If [trie] 
    already contains a Node with the given [key], just returns the original 
    [trie].

    Requires: [key] must be a string representation of a single char 
*)
let insert_char key trie : t = 
  match trie with 
  | Node(c, list, b) ->
    if contains_key key list then
      trie
    else
      let new_list = (Node(key, [], false))::list in 
      Node(c, new_list, b)

(** [update_children t lst] is a trie [t] with its children tries 
    replaced with [lst]
*)
let update_children t lst = 
  match t with
  | Node (k, _, bool) -> Node (k, lst, bool)

(** [insert_word key trie n full_length] inserts a word [key] into the given
    [trie] where each char of the key is it's own node and the last char of the 
    key is marked true to indicate it is the end of a word

    Example: 
    [insert_word "code" empty 0 4] will return a trie of the form
    " ",false -> "c",false -> "o",false -> "d",false -> "e", true
    where [->] indicates children

    Requires:
    -n input must be 0
    -full_length must correspond to String.length key
*)
let rec insert_word key trie n full_length: t = 
  match trie with
  | Node(c, list, b) -> 
    (* print_int n; print_string ("\nYet to be Inserted: "^key); print_string ("\nKey of current Node: "^c^"\nChildren: "); print_list list; print_endline "     "; *)
    if n = full_length then (* when you're on the last letter of the word being inputted *)
      Node(c, list, true)
    else
    if contains_key (Char.escaped key.[0]) list then (* if the key is already a child of the given node *)
      let curr = get_key_node (Char.escaped key.[0]) list in 
      update_children trie ((insert_word (String.sub key 1 (full_length - (n+1))) curr (n+1) full_length)::(remove_key list (Char.escaped key.[0]) []))
    else 
      let new_node = (insert_char (Char.escaped key.[0]) trie) in 
      insert_word key new_node n full_length




let insert keylst trie : t = 
  let rec ins keylst trie = 
    match keylst with
    | k::t -> ins t (insert_word k trie 0 (String.length k))
    | [] -> trie
  in

  ins keylst trie



let search key trie: bool = 
  let full_length = String.length key in 
  let rec search_help key trie n= 
    let length = String.length key in 
    match trie, length with 
    | Node(c, list, b), length -> 
      if n = full_length then 
        if b = true then true else false
      else
      if contains_key (Char.escaped key.[0]) list then
        let curr = get_key_node (Char.escaped key.[0]) list in 
        search_help (String.sub key 1 (full_length - (n+1))) curr (n+1) else false

  in 

  search_help key trie 0

(* let rec search_list keylst trie acc=
   match keylst with
   | h::t -> search_list t trie (search h trie)
   | [] -> acc *)











(* * [insert_word t lst] is a trie [t] with the word represented by [lst] 
   inserted. 
   Requires: 
   [lst] is a character list of the word ( "ace" -> ['a';'c';'e'] 
*)


(* let rec insert_word trie lst root = 
   let children_list = get_children root in (* children tries of current root *)
   let keys_list = get_keys children_list [] in (* keys of the children *)
   match lst with (* matching each character of the word *)
   | h::t -> 
    (* if a given character is not a node in a trie yet *)
    if (List.mem h (keys_list)) 
    then 
      insert_word trie t (find_subtrie children_list h)
    else
      let new_trie = Node (h, [], false) in
      (* let updated_subtree = update_children root (new_trie::children_list) in *)
      (* creating a new list of children with a new trie 
         with value [h] appended *)
      let updated_trie = update_children trie (new_trie::children_list) in
      (* recursively calling the function with the new children, 
         with [root] set to the next subtrie *)
      insert_word updated_trie t (find_subtrie children_list h)
   | [] -> trie  *)

(* | h::[] -> 
   if (List.mem h (keys_list)) 
   then 
   let update_list = update_children (trie (make_true (find_subtrie children_list h)))

   insert_word trie [] (find_subtrie children_list h)
   else
   let new_trie = Node (h, [], true) in
   let updated_list = update_children trie (new_trie::children_list) in
   insert_word updated_list [] (find_subtrie children_list h) *)
(* | [] -> trie  *)
(* with last node changed to true *)

(* (** [find_subtrie lst c] is a trie [t] with a key value [c] from the list of
    tries [lst] *)
   let rec find_subtrie lst c = 
   match lst with
   | h::t -> begin 
      match h with
      | Node (k, _, _) -> 
        if k = c then h else find_subtrie t c
    end
   | [] -> failwith "c is not in lst" *)

(* let trie = insert (words "dictionary.txt") empty *)

(** [valid_english word] is [true] if [word] is a valid English word
    i.e. included in the text file "dictionary.txt" provided in the directory *)
let valid_english word trie = 
  search word trie
