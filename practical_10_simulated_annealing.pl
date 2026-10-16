% Practical 10: Simulated Annealing
% Query: ?- anneal(0, 10.0, 0.8, 10, Best, Value).

:- use_module(library(random)).

value(X, Y) :- Y is -((X - 3) * (X - 3)) + 10.

anneal(X, _, _, 0, X, Y) :- value(X, Y).
anneal(X, Temp, Cooling, Steps, Best, Value) :-
    Steps > 0,
    value(X, Current),
    ( random_between(0, 1, R), R =:= 0 -> Next is X - 1 ; Next is X + 1 ),
    value(Next, NextValue),
    Difference is NextValue - Current,
    Random is random_float,
    ( (Difference >= 0 ; Random < exp(Difference / Temp)) -> Candidate = Next ; Candidate = X ),
    NewTemp is Temp * Cooling,
    NewSteps is Steps - 1,
    anneal(Candidate, NewTemp, Cooling, NewSteps, Best, Value).
