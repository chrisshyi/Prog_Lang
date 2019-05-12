datatype set = S of { insert: int -> set,
                      member: int -> bool,
                      size: unit -> int }

val empty_set = let
                    fun make_set xs =
                        let fun contains i =
                              List.exists (fn j => i=j) xs
                        in
                            S { insert = fn i => if contains i
                                               then make_set xs
                                               else make_set (i::xs),
                                member = contains,
                                size = fn () => length xs}
                        end
                 in
                     make_set []
                 end

