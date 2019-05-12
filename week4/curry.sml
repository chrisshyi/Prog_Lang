val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x

val t2 = ((sorted3 7) 9) 11

val curry_add = fn x => fn y => fn z => x + y + z

val t3 = curry_add 1 2 3 

fun fold f acc xs =
    case xs of
         [] => acc
       | first::rest => fold f (f(acc, first)) rest  

fun range i j = if i >= j then [] else i :: (range (i + 1) j);

fun exists predicate xs =
    case xs of
         [] => false
       | first::rest => predicate first orelse exists predicate rest  

fun map f xs =
    case xs of
         [] => []
       | first::rest => f first :: map f rest  

fun range_pair(i, j) =
    if i > j
    then []
    else i :: range_pair(i + 1, j)

fun range_wrap f x y = f(x, y)

fun other_curry f x y = f y x
