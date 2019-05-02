fun count_from1(x : int) =
    let 
        fun count(from : int) =
            if from = x
            then from :: []
            else
                from :: count(from + 1)
    in
        count(1)
    end

fun max(xs : int list) =
    if null xs
    then 0
    else
        if null (tl xs)
        then hd(xs)
        else
            let 
                val rest_max = max(tl(xs))
                val head = hd(xs)
            in
                if head > rest_max
                then head
                else
                    rest_max
            end

fun count_up(from : int, to : int) =
    if from = to
    then from :: []
    else
        from :: count_up(from + 1, to)
