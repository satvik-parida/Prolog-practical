% Practical 3
% Query: ?- list_operations([1,2], [3,4], 2, Result).

list_operations(A, B, Item, result(Append, Reverse, Found, Length)) :-
    append(A, B, Append),
    reverse(Append, Reverse),
    ( member(Item, Append) -> Found = yes ; Found = no ),
    length(Append, Length).
