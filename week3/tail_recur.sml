fun fib(n: int) =
    let 
        fun aux(n, a, b) =
            if n = 0 orelse n = 1
            then a + b 
            else
                aux(n - 1, a + b, a) 
    in
        aux(n, 1, 0)
    end
