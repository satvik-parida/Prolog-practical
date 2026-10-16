% Practical 1
% Query: ?- enrolled(alice, Course).

enrolled(alice, ai).
enrolled(alice, machine_learning).
enrolled(bob, databases).
enrolled(carol, ai).

likes(alice, ai).
likes(bob, databases).

classmate(X, Y, Course) :-
    enrolled(X, Course),
    enrolled(Y, Course),
    X \= Y.
