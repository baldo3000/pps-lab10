search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

% sublist(List1, List2)
% List1 should contain elements all also in List2
sublist(nil, _).
sublist(cons(H1, T), O) :- search(H1, O), sublist(T, O).
