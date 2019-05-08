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
                
fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null(dates)
    then []
    else
        if null(months)
        then []
        else
            let 
                val dates_in_rest = dates_in_months(dates, tl(months))
            in
                dates_in_month(dates, hd(months)) @ dates_in_rest
            end 

fun get_nth(strs: string list, n: int) =
    if n = 1
    then hd(strs)
    else
        get_nth(tl(strs), n - 1)

(* takes a date and returns a string of the form January 20, 2013 *) 
fun date_to_string(date: (int*int*int)) =
    let
        val month_str_list = ["January", "February", "March", "April", "May",
        "June", "July", "August", "September", "October", "November",
        "December"]
        val month_str = get_nth(month_str_list, #2 date)
        val day_str = Int.toString(#3 date)
        val year_str = Int.toString(#1 date)
    in
        
        month_str ^ " " ^ day_str ^ ", " ^ year_str
    end

(* Returns an int n such that the first n elements of num_list add to less than sum, but the first n + 1 elements of num_list add to sum or more *)
fun number_before_reaching_sum(sum: int, num_list: int list) =
    if hd(num_list) >= sum
    then
        0
    else
        1 + number_before_reaching_sum(sum - hd(num_list), tl(num_list))

fun what_month(day_of_year: int) =
    let 
        val month_days_list = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        fun helper(days_left: int, month_day_list: int list) =
            if hd(month_day_list) >= days_left
            then
                1
            else
                1 + helper(days_left - hd(month_day_list), tl(month_day_list))
    in
        helper(day_of_year, month_days_list)
    end 

fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else
        let
            fun int_range(from: int, to: int) =
                if from > to
                then []
                else
                    if from = to
                    then [from]
                    else
                      from :: int_range(from + 1, to)

            val day1_month = what_month(day1)
            val day2_month = what_month(day2)
        in
            int_range(day1_month, day2_month)
        end

(* Takes in a list of dates and returns an (int*int*int) option. If the list is
* empty, then NONE is returned. Else, SOME (int*int*int) *)
fun oldest(dates: (int*int*int) list) =
    if null dates
    then NONE
    else
        let
            val oldest_in_rest = oldest(tl(dates))
        in
            if isSome oldest_in_rest
            then
                if is_older(hd(dates), valOf oldest_in_rest)
                then SOME(hd(dates))
                else
                    oldest_in_rest
            else
                SOME(hd(dates))
        end 

(* Returns a copy of <num_list> with the duplicates removed *)
fun remove_dup(num_list: int list) =
    if null num_list
    then []
    else
        let
            fun is_in_list(num: int, num_list: int list) =
                if null num_list
                then
                    false
                else
                    if num = hd(num_list)
                    then
                       true
                    else
                        is_in_list(num, tl(num_list))
            fun helper(built_up_list: int list, num_list: int list) =
                if null num_list
                then
                    built_up_list
                else
                    if is_in_list(hd(num_list), built_up_list)
                    then
                        helper(built_up_list, tl(num_list))
                    else
                        helper(hd(num_list) :: built_up_list, tl(num_list))
        in
            helper([], num_list)
        end
fun number_in_months_challenge(dates: (int*int*int) list, months: int list) =
    let 
        val months_no_dup = remove_dup(months)
    in
        number_in_months(dates, months_no_dup)
    end

fun dates_in_months_challenge(dates: (int*int*int) list, months: int list) =
    let 
        val months_no_dup = remove_dup(months)
    in
        dates_in_months(dates, months_no_dup)
    end
    








