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

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE

val count_wildcard_test1 = count_wildcards(Wildcard) = 1;
val count_wildcard_test2 = count_wildcards(ConstructorP ("hello", ConstructorP
("world", Wildcard))) = 1;
val count_wildcard_test3 = count_wildcards(TupleP [Wildcard, Variable "hello",
UnitP, Wildcard, Wildcard, ConstP 5]) = 3;

val wild_and_var_len_test1 = count_wild_and_variable_lengths(Wildcard) = 1;
val wild_and_var_len_test2 = count_wild_and_variable_lengths(
ConstructorP ("Hello", Variable "Hello")) = 5;
val wild_and_var_len_test3 = count_wild_and_variable_lengths(
ConstructorP ("Hello", ConstructorP ("blah", ConstructorP ("lol", Variable
"Hello")))) = 5;

val wild_and_var_len_test4 = count_wild_and_variable_lengths(TupleP [Wildcard,
ConstructorP ("blah", Wildcard), Variable "hello", ConstructorP ("la", Variable
"you"), TupleP [Variable "lalala", ConstP 5]]) = 16;

val count_var_test1 = count_some_var("hello", Wildcard) = 0;
val count_var_test2 = count_some_var("hello", ConstructorP ("blah", Variable
"hello")) = 1;
val count_var_test3 = count_some_var("hello", TupleP [Wildcard, Variable
"hello", ConstructorP ("la", ConstructorP ("la", Variable "hello")), TupleP
[Variable "hello", Variable "Hello"]]) = 3;


val check_pat_test1 = check_pat(TupleP [TupleP [Variable "hello", Variable
"World"], Variable "World"]) = false;
val check_pat_test2 = check_pat(TupleP [TupleP [Variable "hello", Variable
"World"], Variable "blah"]) = true;

val match_test1 = match(Const 5, Wildcard) = SOME [];
val match_test2 = match(Tuple [Const 5, Unit], Variable "my_var") = SOME
[("my_var", Tuple [Const 5, Unit])];
val match_test3 = match (Tuple [Const 5, Const 10, Tuple [Constructor ("my_var",
Unit), Constructor ("my_var2", Const 15)]], TupleP [Variable "const1", Wildcard,
TupleP [ConstructorP ("my_var", UnitP), ConstructorP ("my_var2", Variable
"my_var3")]]) = SOME [("const1", Const 5), ("my_var3", Const 15)]; 

val match_test4 = match (Tuple [Const 5, Const 10, Tuple [Constructor ("my_var",
Unit), Constructor ("my_var4", Const 15)]], TupleP [Variable "const1", Wildcard,
TupleP [ConstructorP ("my_var", UnitP), ConstructorP ("my_var2", Variable
"my_var3")]]) = NONE; 

val match_test5 = match (Tuple[Const 5, Const 10], TupleP [Variable "const1",
Wildcard]) = SOME [("const1", Const 5)];


val first_match_test1 = first_match(Const 5, [Wildcard]) = SOME [];
val first_match_test2 = first_match(Tuple [Const 5, Unit], [UnitP, Variable
"my_var"]) = SOME
[("my_var", Tuple [Const 5, Unit])];
val first_match_test3 = first_match(Tuple [Const 5, Const 10, Tuple [Constructor ("my_var",
Unit), Constructor ("my_var2", Const 15)]], [UnitP, ConstP 5, TupleP [Variable "const1", Wildcard,
TupleP [ConstructorP ("my_var", UnitP), ConstructorP ("my_var2", Variable
"my_var3")]]]) = SOME [("const1", Const 5), ("my_var3", Const 15)]; 

val first_match_test4 = first_match(Tuple [Const 5, Const 10, Tuple [Constructor ("my_var",
Unit), Constructor ("my_var4", Const 15)]], [UnitP, TupleP [Variable "const1", Wildcard,
TupleP [ConstructorP ("my_var", UnitP), ConstructorP ("my_var2", Variable
"my_var3")]]]) = NONE; 

val first_match_test5 = first_match(Tuple[Const 5, Const 10], [TupleP [Variable "const1",
Wildcard], Variable "throwaway"]) = SOME [("const1", Const 5)];
