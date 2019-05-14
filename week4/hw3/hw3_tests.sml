use "hw3.sml";
(* only_capitals_tests *)
val only_cap_test1 = only_capitals(["hello", "world"]) = [];
val only_cap_test2 = only_capitals(["Hello", "world"]) = ["Hello"];
val only_cap_test3 = only_capitals([]) = [];
