% seqR2(N, List) --> is cons(0, cons(1, cons(..., cons(N-1, nil))))

last(nil, X, cons(X, nil)).
last(cons(H, T1), X, cons(H, T2)) :- last(T1, X, T2).

seqR2(zero, nil).
seqR2(s(N), R) :- seqR2(N, W), last(W, N, R).
