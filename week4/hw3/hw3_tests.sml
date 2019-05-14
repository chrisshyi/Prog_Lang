use "hw3.sml";
(* only_capitals_tests *)
val only_cap_test1 = only_capitals(["hello", "world"]) = [];
val only_cap_test2 = only_capitals(["Hello", "world"]) = ["Hello"];
val only_cap_test3 = only_capitals([]) = [];

val longest_str1_test1 = longest_string1([]) = "";
val longest_str1_test2 = longest_string1(["hi", "you"]) = "you";
val longest_str1_test3 = longest_string1(["hello", "world"]) = "hello";

val longest_str2_test1 = longest_string2([]) = "";
val longest_str2_test2 = longest_string2(["hi", "you"]) = "you";
val longest_str2_test3 = longest_string2(["hello", "world"]) = "world";

val longest_str3_test1 = longest_string3([]) = "";
val longest_str3_test2 = longest_string3(["hi", "you"]) = "you";
val longest_str3_test3 = longest_string3(["hello", "world"]) = "hello";

val longest_str4_test1 = longest_string4([]) = "";
val longest_str4_test2 = longest_string4(["hi", "you"]) = "you";
val longest_str4_test3 = longest_string4(["hello", "world"]) = "world";

val longest_cap_test1 = longest_capitalized(["hello", "world"]) = "";
val longest_cap_test2 = longest_capitalized(["hello", "World"]) = "World";
val longest_cap_test3 = longest_capitalized(["Hello", "World"]) = "Hello";

val rev_str_test1 = rev_string("") = "";
val rev_str_test2 = rev_string("e") = "e";
val rev_str_test3 = rev_string("eawas") = "sawae";

