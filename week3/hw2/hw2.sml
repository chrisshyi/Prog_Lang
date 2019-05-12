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
       | first::second::rest => case card_color(first) = card_color(second) of 
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
fun score(cards: card list, goal: int) =
    let 
        val sum_of_cards = sum_cards(cards)
        val same_color = all_same_color(cards)
        val prelim_score = if sum_of_cards > goal
                           then 3 * (sum_of_cards - goal)
                           else goal - sum_of_cards 
    in
        if same_color
        then prelim_score div 2
        else prelim_score
    end

(* Takes a deck of cards, a list of moves, a goal, and returns the score at the end of
   the game
*)   
fun officiate(card_deck: card list, moves: move list, goal: int) =
    let
        fun proc_move(card_deck: card list, moves: move list, held_cards: card list) = 
            case moves of
                    [] => score(held_cards, goal)             
                  | first_moves::rest_moves => case first_moves of
                                        Discard c => let val new_held = remove_card(held_cards, c, IllegalMove)
                                                     in
                                                        proc_move(card_deck, rest_moves, new_held)
                                                     end
                                      | Draw => case card_deck of
                                                    [] => score(held_cards, goal)   
                                                  | first_deck::rest_deck => let val new_held = first_deck::held_cards
                                                                                 val goal_exceeded = sum_cards(new_held) > goal 
                                                                             in
                                                                                 if goal_exceeded
                                                                                 then score(new_held, goal)
                                                                                 else
                                                                                     proc_move(rest_deck, rest_moves, new_held)
                                                                             end 
    in
        proc_move(card_deck, moves, [])
    end
                                                                         
                                                       
fun score_challenge(cards: card list, goal: int) =
    let
        fun count_aces(cards: card list) =
            let fun helper(cards: card list, count: int) =
                case cards of
                     [] => count
                   | (first_suit, first_rank)::rest_cards => if first_rank = Ace
                                               then helper(rest_cards, count + 1)
                                               else helper(rest_cards, count)
            in
                helper(cards, 0)
            end
        (* adjust the sum by changing some aces to count as 1 instead of 11 *)
        fun adjust_sum(prelim_sum: int, num_aces: int, goal: int) =
            if prelim_sum <= goal orelse num_aces = 0
            then prelim_sum
            else
                let val diff = prelim_sum - goal
                in
                    if diff = 1 orelse diff = 2
                    then 
                        prelim_sum
                    else
                        adjust_sum(prelim_sum - 10, num_aces - 1, goal)
                end
 
        val sum_card_val = sum_cards(cards)
        val num_aces = count_aces(cards)
        val sum_of_cards = adjust_sum(sum_card_val, num_aces, goal)
        val same_color = all_same_color(cards)
        val prelim_score = if sum_of_cards > goal
                           then 3 * (sum_of_cards - goal)
                           else goal - sum_of_cards 
    in
        if same_color 
        then prelim_score div 2
        else prelim_score
    end
             
        

            
    
