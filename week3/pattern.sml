exception ListLengthMismatch

fun zip3(trip_list) =
    case trip_list of
        ([],[],[]) => []
      | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3) :: zip3(tl1, tl2, tl3)
      | _ => raise ListLengthMismatch

fun non_dec(xs) =
    case xs of
        [] => true
      | x1::[] => true
      | x1::x2::rest => x1 <= x2 andalso non_dec(x2::rest) 

datatype sgn = P | N | Z

fun mult_sign(x1, x2) =
    let 
        fun sign x = if x = 0 then Z else if x < 0 then N else P
    in
        case (sign(x1), sign(x2)) of
             (P, P) => P
           | (N, N) => P
           | (Z, _) => Z
           | (_, Z) => Z
           | _ => N
    end

datatype mytype = Cons1 of int*int | Cons2 of string

fun what_type x =
    case x of
         Cons1 (_, _) => "Cons1!"
       | Cons2 _ => "Cons2!"

