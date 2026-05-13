% seq(N, E, List) --> List is cons(E, cons(..., cons(E, nil))) with size N
% example: seq(s(s(s(zero))), a, cons(a, cons(a, cons(a,nil)))).
seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).
