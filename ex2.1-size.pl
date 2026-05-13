% size(List, Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))...
size(nil, zero).
size(cons(_, T), s(P)) :- size(T, P).