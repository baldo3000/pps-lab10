% same(List1, List2)
% are the two lists exactly the same?

% actually same(X, X). would do the trick but I'll write down a more complex one.
same(nil, nil).
same(cons(H, T1), cons(H, T2)) :- same(T1, T2).