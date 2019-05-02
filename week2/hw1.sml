(* Takes in dates x, y and returns 
 * whether or not date x is older than date y
 *)  
fun is_older(x: int*int*int, y: int*int*int) =
    if #1 x = #1 y
    then
        if #2 x = #2 y
        then #3 x < #3 y
        else
            #2 x < #2 y
    else
        #1 x < #1 y


(* Returns the number of dates in <dates> that are in <month> *)
fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then 0
    else
        let
            val first_date = hd dates
            val count_in_rest = number_in_month(tl(dates), month)
        in
            if #2 first_date = month
            then 1 + count_in_rest
            else
                count_in_rest
        end 
