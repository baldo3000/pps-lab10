sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

% sum_list(List, Sum)
sum_list(nil, zero).
sum_list(cons(X, T), R) :- sum_list(T, I), sum(X, I, R).