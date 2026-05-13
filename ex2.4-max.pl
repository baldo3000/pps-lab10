greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

greater_equal(_, zero).
greater_equal(s(N), s(M)) :- greater_equal(N, M).

% max(List, Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max(cons(H, T), Max) :- max(T, H, Max).
max(nil, Max, Max).
max(cons(H, T), TempMax, Max) :- greater(H, TempMax), max(T, H, Max).
max(cons(H, T), TempMax, Max) :- greater_equal(TempMax, H), max(T, TempMax, Max).
