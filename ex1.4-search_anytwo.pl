search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

% search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).