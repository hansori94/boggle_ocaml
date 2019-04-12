(**
   This module is responsible for parsing player input
*)

(** TODO DOCUMENT *)
type words = string

(** TODO DOCUMENT *)
type input = 
  | Quit
  | Word of words

(** TODO DOCUMENT *)
exception Empty

(** TODO DOCUMENT *)
exception Malformed

(** TODO DOCUMENT *)
val parse : string -> input