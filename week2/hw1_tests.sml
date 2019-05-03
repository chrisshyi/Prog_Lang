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

