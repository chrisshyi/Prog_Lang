datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp 
             | Sub of exp * exp 

fun eval(var: exp) =
  case var of
       Constant x => x
     | Negate x => ~ (eval(x))
     | Add (x, y) => eval(x) + eval(y)
     | Sub (x, y) => eval(x) - eval(y) 

fun max_const(var: exp) =
    case var of
         Constant x => x
       | Negate x => max_const(x)
       | Add (x, y) => Int.max(max_const(x), max_const(y)) 
       | Sub (x, y) => Int.max(max_const(x), max_const(y)) 

datatype int_list = Empty
                  | Cons of (int * int_list)

fun max_in_list(l: int_list) =
    case l of
        Empty => NONE
      | Cons (head, rest) => let
                                val rest_max = max_in_list(rest)
                             in
                                if isSome rest_max
                                then SOME (Int.max(head, valOf (rest_max)))
                                else
                                    SOME head   
                             end
val some_list = Cons(5, Cons(3, Cons(6, Empty)));
val max = max_in_list(some_list);

datatype triple = ints of (int*int*int)

fun sum_triple(ints (x1, x2, x3)) =
    x1 + x2 + x3

fun full_name {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z

fun append(xs, ys) =
    case xs of
         [] => ys
       | x1::rest => x1 :: append(rest, ys)

