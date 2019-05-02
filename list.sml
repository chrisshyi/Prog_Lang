fun sum_list(xs : int list) = 
    if null xs 
    then 0
    else hd(xs) + sum_list(tl(xs))

fun list_product(xs : int list) =
    if null xs
    then 0
    else
    if null(tl(xs))
    then hd xs
    else hd xs * list_product(tl xs)

fun countdown(x : int) =
    if x = 0
    then []
    else
    x::countdown(x - 1)  

fun append_list(list1 : int list, list2 : int list) =
    if null list1
    then list2
    else
    hd(list1)::append_list(tl(list1), list2)  

fun sum_pair_list(xs : (int*int) list) =
    if null xs
    then 0
    else
    #1(hd(xs)) + #2(hd(xs)) + sum_pair_list(tl(xs))  

fun firsts(xs : (int*int) list) =
    if null xs
    then []
    else
    #1 (hd xs) :: firsts(tl(xs))  

fun list_max(xs : int list) =
    if null xs
    then NONE
    else
        let
            (* int list -> int *)
            fun max_non_empty(xs : int list) =
                if null (tl(xs))
                then
                    hd(xs)
                else
                    let 
                        val rest_max = max_non_empty(tl(xs))
                    in
                        if hd(xs) > rest_max
                        then
                            hd(xs)
                        else
                            rest_max
                    end
        in
            SOME (max_non_empty(tl(xs)))
        end
 
