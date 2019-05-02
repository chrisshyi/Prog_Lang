(* comment *)

fun pow(x: int, y: int) =
  if y = 0 then 1 
  else x * pow(x, y - 1)

fun cube(x: int) =
  pow(x, 3)

val pair = (5, 10);

fun swap(pair: int*int) =
  (#2 pair, #1 pair)

fun sum_pair(pair: int*int) =
  #1 pair + #2 pair

fun sort_pair(pair: int*int) =
  if #1 pair < #2 pair
  then pair
  else (#2 pair, #1 pair)
