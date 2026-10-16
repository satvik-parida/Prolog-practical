% Practical 8: A* Search
% Query: ?- astar(a, g, Path, Cost).

edge(a, b, 1). edge(a, c, 4).
edge(b, d, 2). edge(b, e, 5).
edge(c, f, 1).
edge(d, g, 5). edge(e, g, 1). edge(f, g, 3).

h(a, 6). h(b, 5). h(c, 4). h(d, 5).
h(e, 1). h(f, 3). h(g, 0).

astar(Start, Goal, Path, Cost) :-
    astar([node(Start, [Start], 0)], Goal, ReversePath, Cost),
    reverse(ReversePath, Path).

astar(Open, Goal, Path, Cost) :-
    predsort(compare_f, Open, [node(Goal, Path, Cost)|_]).
astar(Open, Goal, Path, Cost) :-
    predsort(compare_f, Open, [node(Node, RevPath, G)|Rest]),
    findall(node(Next, [Next|RevPath], NewG),
            (edge(Node, Next, Step), \+ member(Next, RevPath), NewG is G + Step),
            Children),
    append(Rest, Children, NewOpen),
    astar(NewOpen, Goal, Path, Cost).

compare_f(Order, node(A, _, GA), node(B, _, GB)) :-
    h(A, HA), h(B, HB),
    FA is GA + HA, FB is GB + HB,
    compare(Order, FA, FB).
