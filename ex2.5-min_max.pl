greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

greater_equal(_, zero).
greater_equal(s(N), s(M)) :- greater_equal(N, M).

% min_max(List, Min, Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element
min_max(cons(H, T), Min, Max) :- min_max(T, H, H, Min, Max).
min_max(nil, Min, Max, Min, Max).  
min_max(cons(H, T), TempMin, TempMax, Min, Max) :- greater_equal(H, TempMax), min_max(T, TempMin, H, Min, Max).
min_max(cons(H, T), TempMin, TempMax, Min, Max) :- greater_equal(TempMin, H), min_max(T, H, TempMax, Min, Max).
min_max(cons(H, T), TempMin, TempMax, Min, Max) :- greater(TempMax, H), greater(H, TempMin), min_max(T, TempMin, TempMax, Min, Max).
