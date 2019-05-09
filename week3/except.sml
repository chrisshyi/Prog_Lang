exception myException of (int*int);

fun someFun(raiseExp: bool) =
    if not raiseExp
    then "no exception!"
    else
        raise myException(5, 7)

