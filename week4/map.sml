fun map(f, xs) =
    case xs of
         [] => []
       | first::rest => f first :: map(f, rest)  

fun filter(f, xs) =
    case xs of
         [] => []
       | first::rest => if f first
                        then first :: filter(f, rest)
                        else filter(f, rest)  
