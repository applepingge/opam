(**************************************************************************)
(*                                                                        *)
(*    Copyright 2016 OCamlPro                                             *)
(*                                                                        *)
(*  All rights reserved. This file is distributed under the terms of the  *)
(*  GNU Lesser General Public License version 2.1, with the special       *)
(*  exception on linking described in the file LICENSE.                   *)
(*                                                                        *)
(**************************************************************************)

(** Stored as hexadecimal strings *)
type kind = [ `MD5 | `SHA1 | `SHA256 ]

type t

val kind: t -> kind

val md5: string -> t
val sha1: string -> t
val sha256: string -> t

include OpamStd.ABSTRACT with type t := t

val of_string_opt: string -> t option

(** returns a sub-path specific to this hash, e.g.
    "md5/d4/d41d8cd98f00b204e9800998ecf8427e", as a list *)
val to_path: t -> string list

val check_file: string -> t -> bool

val compute: ?kind:kind -> string -> t
