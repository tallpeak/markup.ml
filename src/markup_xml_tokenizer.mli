(* This file is part of Markup.ml, released under the BSD 2-clause license. See
   doc/LICENSE for details, or visit https://github.com/aantron/markup.ml. *)

open Markup_common

type token =
  [ `Xml of xml_declaration
  | `Doctype of doctype
  | `Start of Token_tag.t
  | `End of Token_tag.t
  | `Chars of string list
  | `PI of string * string
  | `Comment of string
  | `EOF ]

val tokenize :
  Markup_error.parse_handler ->
  (string -> string option) ->
  (location * int) Markup_kstream.t * (unit -> location) ->
    (location * token) Markup_kstream.t
