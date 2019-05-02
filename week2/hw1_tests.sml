use "hw1.sml";
val is_older_test1 = is_older((1991, 10, 25), (1991, 10, 24)) = false;
val is_older_test2 = is_older((1990, 10, 25), (1991, 10, 24)) = true;
val is_older_test3 = is_older((1991, 10, 24), (1991, 10, 24)) = false;

val dates = [(1991, 10, 24), (1000, 10, 11), (1923, 5, 1)];

val number_in_month_test1 = number_in_month(dates, 10) = 2;
val number_in_month_test1 = number_in_month(dates, 5) = 1;
val number_in_month_test1 = number_in_month(dates, 1) = 0;



