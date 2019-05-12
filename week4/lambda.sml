fun n_times(f, n, x) =
    if n = 0
    then x
    else n_times(f, n - 1, f x) 

fun triple_n_times(n, x) =
    n_times(fn x => x * 3, n, x)

fun rev_list(lst) =
    let
        fun helper(lst, reversed) =
            case lst of
                 [] => reversed 
               | first::rest => helper(rest, first::reversed)
    in
        helper(lst, [])
    end 

fun double_or_triple(f) =
    if f 7
    then fn x => 2 * x
    else fn x => 3 * x
