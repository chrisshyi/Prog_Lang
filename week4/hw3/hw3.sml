(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu
(* (() -> int) -> (string -> int) -> pattern -> int *)
fun g f1 f2 p =
    let 
    (* pattern -> int *)
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals(strings: string list) =
    List.filter (fn str => (String.size str > 0 andalso (Char.isUpper(String.sub(str, 0))))) strings 

fun longest_string1(strings: string list) =
    List.foldl (fn (next, accum) => if String.size accum >= String.size next
                                    then accum
                                    else next) "" strings

fun longest_string2(strings: string list) =
    List.foldl (fn (next, accum) => if String.size accum > String.size next
                                    then accum
                                    else next) "" strings

fun longest_string_helper func =
    let
        fun fold_func(strings: string list) =
            let fun helper(strings: string list, accum: string) =
                case strings of
                     [] => accum
                   | first::rest => if func(String.size accum, String.size first)
                                    then helper(rest, accum) 
                                    else helper(rest, first)  
            in
                helper(strings, "")
            end
    in
        fold_func
    end

fun longest_string3(strings: string list) =
    longest_string_helper (fn(x, y) => x >= y) strings

fun longest_string4(strings: string list) =
    longest_string_helper (fn(x, y) => x > y) strings

fun longest_capitalized(strings: string list) =
    (longest_string1 o only_capitals) strings

fun rev_string(str: string) =
    (String.implode o List.rev o String.explode) str 

fun first_answer func xs =
    case xs of
         [] => raise NoAnswer
       | first::rest => case func first of
                             SOME v => v
                           | NONE => first_answer func rest  

fun all_answers func xs =
    let 
        fun helper func xs accum = 
            case xs of
                 [] => SOME []
               | first::rest => case func first of
                                     NONE => NONE
                                   | SOME v => helper func rest (accum @ [v])  
    in
        helper func xs []
    end

fun count_wildcards(p: pattern) =
    g (fn _ => 1) (fn _ => 0) p

fun count_wild_and_variable_lengths(p: pattern) =
    g (fn _ => 1) (fn str => String.size str) p 

fun count_some_var(name: string, p: pattern) =
    g (fn _ => 0) (fn str => if name = str then 1 else 0) p
