% Practical 11: Map Coloring CSP
% Query: ?- color_map(WA, NT, SA, Q, NSW, V, T).

color(red). color(green). color(blue).

color_map(WA, NT, SA, Q, NSW, V, T) :-
    color(WA), color(NT), color(SA), color(Q), color(NSW), color(V), color(T),
    WA \= NT, WA \= SA,
    NT \= SA, NT \= Q,
    SA \= Q, SA \= NSW, SA \= V,
    Q \= NSW, NSW \= V.
