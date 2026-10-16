% Practical 9: Hill Climbing
% Query: ?- hill_climb(0, Best, Value).

value(X, Y) :- Y is -((X - 3) * (X - 3)) + 10.

hill_climb(X, Best, Value) :-
    value(X, Current),
    X1 is X - 1, X2 is X + 1,
    value(X1, V1), value(X2, V2),
    ( V1 > Current, V1 >= V2 -> hill_climb(X1, Best, Value)
    ; V2 > Current -> hill_climb(X2, Best, Value)
    ; Best = X, Value = Current
    ).
