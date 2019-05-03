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


(* Returns the number of dates in <dates> that are in any of the months in
  * <months>
  *) 
fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null(dates) 
    then 0
    else
        if null(months)
        then 0
        else
            let 
                val count_rest = number_in_months(dates, tl(months))
            in
                number_in_month(dates, hd(months)) + count_rest
            end

(* Returns a list of dates from <dates> in <month> *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null(dates)
    then []
    else
        let
            val rest_in_month = dates_in_month(tl(dates), month)
        in
            if (#2 (hd(dates))) = month
            then hd(dates) :: rest_in_month
            else
                rest_in_month
        end
                
         
