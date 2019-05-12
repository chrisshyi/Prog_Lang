fun apply_n_times(n: int, x, func) =
    if n = 0
    then x
    else func(apply_n_times(n - 1, x, func))

fun apply_n_times_tail(n: int, x, func) =
    if n = 0
    then x
    else apply_n_times_tail(n - 1, func(x), func)

fun double(x: int) = x * 2
fun increment x = x + 1
