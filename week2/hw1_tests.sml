use "hw1.sml";
val is_older_test1 = is_older((1991, 10, 25), (1991, 10, 24)) = false;
val is_older_test2 = is_older((1990, 10, 25), (1991, 10, 24)) = true;
val is_older_test3 = is_older((1991, 10, 24), (1991, 10, 24)) = false;

val dates = [(1991, 10, 24), (1000, 10, 11), (1923, 5, 1)];
val dates2 = [(1001, 2, 2), (1923, 5, 10), (1220, 3, 3)];

(* number in month tests *)
val number_in_month_test1 = number_in_month(dates, 10) = 2;
val number_in_month_test2 = number_in_month(dates, 5) = 1;
val number_in_month_test3 = number_in_month(dates, 1) = 0;


(* number in months tests *)
val number_in_months_test1 = number_in_months(dates, [10, 5]) = 3;
val number_in_months_test2 = number_in_months(dates, [5]) = 1;
val number_in_months_test3 = number_in_months(dates, [1]) = 0;
val number_in_months_test4 = number_in_months(dates2, [2, 5]) = 2;

(* dates in month tests *)
val dates_in_month_test1 = dates_in_month(dates, 10) 
= [(1991, 10, 24), (1000, 10, 11)];
val dates_in_month_test2 = dates_in_month(dates, 5) 
= [(1923, 5, 1)];

val dates_in_month_test3 = dates_in_month(dates, 1) = [];
val dates_in_month_test4 = dates_in_month(dates2, 2) = [(1001, 2, 2)];

(* dates in months tests *)
val dates_in_months_test1 = dates_in_months(dates, [10, 5]) 
= [(1991, 10, 24), (1000, 10, 11), (1923, 5, 1)];
val dates_in_months_test2 = dates_in_months(dates, [5]) 
= [(1923, 5, 1)];

val dates_in_months_test3 = dates_in_months(dates, [1, 5]) 
= [(1923, 5, 1)];
val dates_in_months_test4 = dates_in_months(dates2, [2]) = [(1001, 2, 2)];

(* get_nth tests *)
val get_nth_test1 = get_nth(["hello", "world"], 1) = "hello";
val get_nth_test2 = get_nth(["hello", "world"], 2) = "world";

(* date_to_string tests *)
val date_to_str_test1 = date_to_string((1991, 10, 25)) = "October 25, 1991";
val date_to_str_test2 = date_to_string((1990, 11, 25)) = "November 25, 1990";
val date_to_str_test3 = date_to_string((1001, 9, 25)) = "September 25, 1001";

(* number_before_reaching_sum tests *)
val num_list = [3, 5, 7, 9, 2, 4]
val num_before_sum_test1 = number_before_reaching_sum(5, num_list) = 1
val num_before_sum_test2 = number_before_reaching_sum(8, num_list) = 1
val num_before_sum_test3 = number_before_reaching_sum(9, num_list) = 2

(* what_month tests *)
val what_month_test1 = what_month(32) = 2;
val what_month_test2 = what_month(31) = 1;
val what_month_test3 = what_month(365) = 12;

(* month_range tests *)
val month_range_test1 = month_range(31, 32) = [1, 2]
val month_range_test2 = month_range(31, 33) = [1, 2]
val month_range_test3 = month_range(31, 90) = [1, 2, 3]

(* oldest tests *)
val oldest_test1 = oldest([]);
isSome(oldest_test1) = false;

val oldest_test2 = oldest([(1991, 10, 25)]);
valOf(oldest_test2) = (1991, 10, 25);

val oldest_test3 = oldest([(1991, 10, 25), (1991, 10, 26), (1990, 1, 23)]);
valOf(oldest_test3) = (1990, 1, 23);

(* remove_dup tests *)
val remove_dup_test1 = remove_dup([1, 2, 3]);
val remove_dup_test2 = remove_dup([1, 2, 3, 1]);
val remove_dup_test3 = remove_dup([1, 2, 2, 2, 2]);

