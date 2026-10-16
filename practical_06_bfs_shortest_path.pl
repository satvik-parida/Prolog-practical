% Practical 6: Breadth-First Search
% Query: ?- bfs(a, g, Path).

edge(a, b). edge(a, c).
edge(b, d). edge(b, e).
edge(c, f).
edge(d, g). edge(e, g). edge(f, g).

bfs(Start, Goal, Path) :-
    bfs([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

bfs([[Goal|Rest]|_], Goal, [Goal|Rest]).
bfs([[Node|Rest]|Queue], Goal, Path) :-
    findall([Next,Node|Rest],
            (edge(Node, Next), \+ member(Next, [Node|Rest])),
            NewPaths),
    append(Queue, NewPaths, NewQueue),
    bfs(NewQueue, Goal, Path).
