fun f g =
    let 
        val x = 3
    in
        g 2
    end

val x = 4

fun h y = x + y
val z = f h
