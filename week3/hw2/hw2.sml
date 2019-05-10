(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
(* Return NONE if the string is not in the list, else return SOME lst where lst is identical to the argument list except the string
is not in it *)
fun all_except_option(str: string, str_list: string list) =
    case str_list of
        [] => NONE 
      | first::rest => if same_string(first, str)
                       then SOME rest
                       else 
                            let val rest_result = all_except_option(str, rest)
                            in
                                case rest_result of
                                     NONE => NONE
                                   | SOME lst => SOME (first::lst)
                            end
(* takes a string list list (a list of list of strings, the
substitutions) and a string s and returns a string list. The result has all the strings that are in some list in substitutions that also has s, but s itself should not be in the
result. *)
fun get_substitutions1(subs: string list list, s: string) =             
    case subs of
        [] => []
      | first::rest => let val match_res = all_except_option(s, first)
                           val match_rest = get_substitutions1(rest, s) 
                       in
                            case match_res of
                                    NONE => match_rest 
                                  | SOME lst => lst @ match_rest 
                       end           
(* Same as get_substitutions1 but with tail recursion *)
fun get_substitutions2(subs: string list list, s: string) =
    let
        (* define a tail recursive helper *)
        fun aux(subs, s, accum) =
            case subs of
                 [] => accum
               | first::rest => let val match_res = all_except_option(s, first)
                                in
                                    case match_res of
                                        NONE => aux(rest, s, accum)
                                      | SOME lst => aux(rest, s, accum @ lst)
                                end
    in
        aux(subs, s, [])
    end      

fun similar_names(subs: string list list, full_name: {first: string, middle: string, last: string}) = 
    case full_name of
         {first=a, middle=b, last=c} => let val first_name_subs = get_substitutions2(subs, a)
                                            fun sub_in(sub_choices, full_name) =
                                                case sub_choices of
                                                     [] => []
                                                   | hd::rest => {first=hd, middle=b, last=c} :: sub_in(rest, full_name)  
                                        in
                                            full_name :: sub_in(first_name_subs, full_name)
                                        end 
fun card_color(my_card: card) =
    case my_card of
         (Hearts, _) => Red
       | (Diamonds, _) => Red
       | (Spades, _) => Black
       | (Clubs, _) => Black

fun card_value(my_card: card) =
    case my_card of
         (_, Ace) => 11
       | (_, Num num) => num
       | (_, _) => 10

fun remove_card(cs: card list, c: card, e: exn) =
    case cs of
         [] => raise e
       | first::rest => if first=c
                        then rest
                        else
                            first::remove_card(rest, c, e) 

fun all_same_color(cs: card list) =
    case cs of
         [] => true
       | first::[] => true
       | first::second::rest => case first=second of 
                                     true => all_same_color(second::rest) 
                                   | false => false 
fun sum_cards(cards: card list) =
    case cards of
         [] => 0
       | (suit, rank) :: rest => let val rank_val = case rank of
                                                        Num x => x
                                                      | Ace => 11
                                                      | _ => 10  
                                 in
                                    rank_val + sum_cards(rest)
                                 end 
