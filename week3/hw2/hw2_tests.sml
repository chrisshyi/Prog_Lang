(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw2.sml";

(* all_except_option tests *)
val all_except_option_test1 = all_except_option ("string", ["string"]) = SOME []
val all_except_option_test2 = all_except_option ("string", ["tring"]) = NONE 
val all_except_option_test3 = all_except_option ("string", ["string", "haha"]) =
  SOME ["haha"]; 

(* get_substitution1 tests *)
val sub_list = [["Fred", "Frederick"], ["Elizabeth", "Beth"], ["Freddie",
"Fred", "F"]];
val get_sub1_test1 = get_substitutions1(sub_list, "Fred") = ["Frederick", "Freddie", "F"];
val get_sub1_test2 = get_substitutions1(sub_list, "Beth") = ["Elizabeth"];
val get_sub1_test3 = get_substitutions1(sub_list, "Elizabeth") = ["Beth"];
val get_sub1_test4 = get_substitutions1([["foo"],["there"]], "foo") = []

(* get_substitution2 tests *)
val sub_list = [["Fred", "Frederick"], ["Elizabeth", "Beth"], ["Freddie",
"Fred", "F"]];
val get_sub2_test1 = get_substitutions2(sub_list, "Fred") = ["Frederick", "Freddie", "F"];
val get_sub2_test2 = get_substitutions2(sub_list, "Beth") = ["Elizabeth"];
val get_sub2_test3 = get_substitutions2(sub_list, "Elizabeth") = ["Beth"];
val get_sub2_test4 = get_substitutions2([["foo"],["there"]], "foo") = []

(* similar_names tests *)
val similar_names_test1 = similar_names(sub_list, {first="Fred", last="Smith", middle="W"});
(*
val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]
         *)
val test5 = card_color (Clubs, Num 2) = Black
val test6 = card_value (Clubs, Num 2) = 2
val test7 = remove_card ([(Hearts, Ace), (Spades, Ace), (Hearts, Ace)] ,
(Hearts, Ace), IllegalMove) = [(Spades, Ace), (Hearts, Ace)];
val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true;
val test9 = all_same_color([(Hearts, Ace), (Spades, Num 10)]) = false;
val test10 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test101 = sum_cards [] = 0
val test102 = sum_cards([(Clubs, Num 10), (Spades, Ace), (Hearts, Jack)]) = 31

(* score tests *)
val deck = [(Hearts, Num 10), (Spades, Queen), (Clubs, King)];
val same_color_deck = [(Hearts, Num 10), (Hearts, Queen), (Hearts, King)];
val score_test1 = score(deck, 25) = 15;
val score_test2 = score(same_color_deck, 25) = 7;

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42) = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
