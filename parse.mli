(**
   This module is responsible for parsing player input
*)

(**The type [words] represents the word that can be part of a 
    player input.  Each word of represents a word of the [words] input
    , where a {i word} is defined as a consecutive sequence of non-space 
    characters. *)
type words = string list

(** Represents a player input. Decomposes the input to a verb and 
    a [words].  *)
type input = 
  | Quit
  | Word of words
  | Start

(** Raised if empty input is encountered. *)
exception Empty

(** Raised if malformed input is encountered. *)
exception Malformed

(** [parse str] parses a player's input into a [input], as follows. The first
    word (i.e., consecutive sequence of non-space characters) of [str] becomes 
    the verb. The next word if any, become the object phrase.
    Examples: 
    - [parse "    quit game   "] is [Quit]
    - [parse "Word word"] is [Word "word"]. 
    - [parse "start game"] is [Start]

    Requires: [str] contains only alphanumeric (A-Z, a-z, 0-9) and space 
    characters (only ASCII character code 32; not tabs or newlines, etc.).

    Raises: [Empty] if [str] is the empty string or contains only spaces. 

    Raises: [Malformed] if the input is malformed. An input
    is {i malformed} if the verb is neither "quit" nor "start",
    or if the verb is "quit" and there is an input besides "game",
    or if the verb is "start" and there is an input besides "game",
    or if there is an object phrase of more than one word with the verb not being
    "quit" or "start"
*)
val parse : string -> input