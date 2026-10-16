% Practical 7: Greedy Best-First Search
% Query: ?- greedy(a, g, Path).

edge(a, b). edge(a, c).
edge(b, d). edge(b, e).
edge(c, f).
edge(d, g). edge(e, g). edge(f, g).

h(a, 7). h(b, 6). h(c, 4). h(d, 5).
h(e, 3). h(f, 2). h(g, 0).

greedy(Start, Goal, Path) :-
    greedy([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

greedy([[Goal|Rest]|_], Goal, [Goal|Rest]).
greedy([[Node|Rest]|Open], Goal, Path) :-
    findall([Next,Node|Rest],
            (edge(Node, Next), \+ member(Next, [Node|Rest])),
            Children),
    append(Open, Children, All),
    sort_by_h(All, Sorted),
    greedy(Sorted, Goal, Path).

sort_by_h(Paths, Sorted) :- predsort(compare_h, Paths, Sorted).
compare_h(Order, [A|_], [B|_]) :- h(A, HA), h(B, HB), compare(Order, HA, HB).
