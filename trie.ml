
type key = string

(* the key is the value at the node (ex: "a") and the t list is its children
   and the bool is whether its the end of a word *)
(* type t = Node of key * t list * bool * int *)
type t = Node of key * t list * bool

(**[empty] represents an empty trie*)
let empty : t = 
  Node(" ", [], false)

(**[is_empty trie] returns whether or not a trie [trie] is empty or not.
   Requires: [trie] is of type [Trie.t]
   Returns: true if trie is empty, false otherwise.
   Example: [is_empty Node(" ", [], false)] is true.*)
let is_empty trie = 
  match trie with
  | Node(" ", [], false) -> true
  | _ -> false

(** [words f] is a list of all words in a .txt file [f]
    Requires: f is a valid text file.
    Returns: a string list containing all separate words in f
    Example: if f contains "That man walked the dog" then [words f] returns
    ["That";"man";"walked";"the";"dog"]*)
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

(** [get_children t] returns the children of the trie [t] 
    Requires: t is a valid trie of type Trie.t
*)
let get_children t = 
  match t with
  | Node (_, lst, _) -> lst

(** [get_children lst acc] returns the list of keys of trie list [lst] 
    Requires: [acc] is empty 
    Returns: key list*)
let rec get_keys lst acc : key list = 
  match lst with 
  | h::t -> begin 
      match h with
      | Node (k, _, _) -> 
        get_keys t (k::acc)
    end
  | [] -> acc

(** [contains_key key nodelist] returns a boolean value indicating whether 
    or not a key [key] is the key of a node present in [nodelist]. 
*)
let rec contains_key key nodelist = 
  match nodelist with
  | Node(c, _, _)::t -> 
    if key = c then true else contains_key key t
  | [] -> false

(** [get_key_node key nodelist] returns the node that has key [key] 
    in the nodelist.
    Requires: Node possessing [key] is present in [nodelist].
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
    if key = c then remove_key t key acc  
    else remove_key t key (Node(c,l,b)::acc)
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
    (* when you're on the last letter of the word being inputted *)
    if n = full_length then 
      Node(c, list, true)
    else
      (* if the key is already a child of the given node *)
    if contains_key (Char.escaped key.[0]) list then
      let curr = get_key_node (Char.escaped key.[0]) list in 
      update_children trie ((insert_word 
                               (String.sub key 1 (full_length - (n+1)))
                               curr (n+1) full_length)::
                            (remove_key list (Char.escaped key.[0]) []))
    else 
      let new_node = (insert_char (Char.escaped key.[0]) trie) in 
      insert_word key new_node n full_length

(**[insert keylst trie] inserts a list of keys [keylst] into trie [trie]
   Requires: [keylst] is a valid list of keys and [trie] is a valid trie.
   Returns: the trie with the keys now inserted into the trie
*)
let insert keylst trie : t = 
  let rec ins keylst trie = 
    match keylst with
    | k::t -> ins t (insert_word k trie 0 (String.length k))
    | [] -> trie
  in

  ins keylst trie

(**[search key trie] returns true if given key [key] is within the trie [trie]
   Requires: [key] is a valid key, and [trie] is a valid trie of type [Trie.t]
   Returns: true if key is in trie, false otherwise.
*)
let search key trie: bool = 
  let full_length = String.length key in 
  let rec search_help key trie n= 
    let length = String.length key in 
    match trie, length with 
    | Node(c, list, b), length -> 
      if n = full_length then 
        if b = true then true else false
      else
      if contains_key (Char.escaped key.[0]) list 
      then
        let curr = get_key_node (Char.escaped key.[0]) list in 
        search_help (String.sub key 1 (full_length - (n+1))) curr (n+1)
      else false
  in 
  search_help key trie 0

(**[valid_english word trie] computes if [word] is within the constructed
   trie (in this case, a trie containing valid english words.)
   Requires: [word] is a string and [trie] is a valid trie of type [Trie.t]
   containing the letters and words of the English language.
   Returns: true if the word is a valid english word, false otherwise*)
let valid_english word trie = 
  search word trie
