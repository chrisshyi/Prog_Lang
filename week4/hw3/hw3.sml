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

fun g f1 f2 p =
    let 
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
    List.foldr (fn (accum, next) => if String.size accum >= String.size next
                                    then accum
                                    else next) "" strings

fun longest_string2(strings: string list) =
    List.foldr (fn (accum, next) => if String.size accum > String.size next
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
