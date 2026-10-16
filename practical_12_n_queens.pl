% Practical 12: N-Queens
% Query: ?- queens(8, Solution).

queens(N, Queens) :-
    numlist(1, N, Rows),
    permutation(Rows, Queens),
    safe(Queens).

safe([]).
safe([Row|Rows]) :-
    safe(Row, Rows, 1),
    safe(Rows).

safe(_, [], _).
safe(Row, [Other|Rows], Distance) :-
    Row =\= Other,
    abs(Row - Other) =\= Distance,
    NextDistance is Distance + 1,
    safe(Row, Rows, NextDistance).
