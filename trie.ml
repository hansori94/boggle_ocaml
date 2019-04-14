
type key = string

(* the key is the value at the node (ex: "a") and the t list is its children
   and the bool is whether its the end of a word *)
type t = Node of key * t list * bool
(* type t = Node of key * t array * bool *)



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

(** [find_subtrie lst c] is a trie [t] with a key value [c] from the list of
    tries [lst] *)
let rec find_subtrie lst c = 
  match lst with
  | h::t -> begin 
      match h with
      | Node (k, _, _) -> 
        if k = c then h else find_subtrie t c
    end
  | [] -> failwith "c is not in lst"

(** [update_children t lst] is a trie [t] with its children tries 
    replaced with [lst]
*)
let update_children t lst = 
  match t with
  | Node (k, _, bool) -> Node (k, lst, bool)


let rec remove_subtrie lst c acc = 
  match lst with
  | h::t -> if h<>c then remove_subtrie t c (c::acc) else remove_subtrie t c (acc)
  | [] -> acc

let make_true t = 
  match t with
  | Node(k, lst, _) -> Node (k, lst, true)

(* * [insert_word t lst] is a trie [t] with the word represented by [lst] 
    inserted. 
    Requires: 
    [lst] is a character list of the word ( "ace" -> ['a';'c';'e'] 
*)


let rec insert_word trie lst root = 
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
      (* creating a new list of children with a new trie 
         with value [h] appended *)
      let updated_trie = update_children trie (new_trie::children_list) in
      (* recursively calling the function with the new children, 
         with [root] set to the next subtrie *)
      insert_word updated_trie t (find_subtrie children_list h)
  | [] -> trie 

  (* | h::[] -> 
     if (List.mem h (keys_list)) 
     then 
     let update_list = update_children (trie (make_true (find_subtrie children_list h)))

     insert_word trie [] (find_subtrie children_list h)
     else
     let new_trie = Node (h, [], true) in
     let updated_list = update_children trie (new_trie::children_list) in
     insert_word updated_list [] (find_subtrie children_list h) *)
  | [] -> trie 
(* with last node changed to true *)






let rec contains_key key nodelist = 
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




let insert key trie : t = 
  failwith "unimplemented"



let search key trie: bool = 
  let full_length = String.length key in 
  let rec search_help key trie n= 
    let length = String.length key in 
    match trie, length with 
    | Node(c, list, b), length -> 
      if n = full_length - 1 then begin
        match trie with 
        | Node(c, list, b) -> 
          if b = true then true else false
      end else
      if contains_key (Char.escaped key.[n]) list then
        let curr = get_key_node (Char.escaped key.[n]) list in 
        search_help (String.sub key (n+1) (length - 1)) curr (n+1) else false

  in 

  search_help key trie 0

