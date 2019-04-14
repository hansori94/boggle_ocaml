
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


(* * [insert_word t lst] is a trie [t] with the word represented by [lst] 
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
      if n = full_length then 
        if b = true then true else false
      else
      if contains_key (Char.escaped key.[n]) list then
        let curr = get_key_node (Char.escaped key.[n]) list in 
        search_help (String.sub key (n+1) (length - 1)) curr (n+1) else false

  in 

  search_help key trie 0

let rec print_list list = 
  match list with
  | [] -> print_string "\n"
  | Node(h, _, _)::t -> print_string h; print_list t

let rec insert_word key trie n full_length: t = 
  match trie with
  | Node(c, list, b) -> 
    (* print_int n;
       print_string key;
       print_string c;
       print_list list;
       print_endline "     "; *)
    if n = full_length then 
      Node(c, list, true)
    else
    if contains_key (Char.escaped key.[0]) list then 
      let curr = get_key_node (Char.escaped key.[0]) list in 
      insert_word (String.sub key 1 (full_length - (n+1))) curr (n+1) full_length 
    else 
      let new_list = (Node((Char.escaped key.[0]), [], false))::list in 
      insert_word key (Node(c, new_list, b)) n full_length

