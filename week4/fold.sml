fun fold(f, acc, xs) =
    case xs of
         [] => acc
       | first::rest => fold(f, f(acc, first), rest)

val sum_list = fold(fn (x, y) => x + y, 0, [1, 2, 3, 4, 5]);  
val all_pos = fold(fn (x, y) => x andalso y > 0, true, [1, 2, 3, ~4]);
val all_pos2 = fold(fn (x, y) => x andalso y > 0, true, [1, 2, 3, 4]);
