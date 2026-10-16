% Practical 5
% Query: ?- result(Student, Category).

mark(alice, 92).
mark(bob, 70).
mark(carol, 50).
mark(david, 30).

result(Student, topper) :- mark(Student, M), M >= 85.
result(Student, average) :- mark(Student, M), M >= 40, M < 85.
result(Student, fail) :- mark(Student, M), M < 40.
