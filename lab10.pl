% utilities
search(X, cons(X, _)).
search(X, cons(_, T)) :- search(X, T).

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

greater_equal(_, zero).
greater_equal(s(N), s(M)) :- greater_equal(N, M).

last(nil, X, cons(X, nil)). % append_last would be more appropriate
last(cons(H, T1), X, cons(H, T2)) :- last(T1, X, T2).

sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

% ex 1.3
% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
search_two(X, cons(X, cons(_, cons(X , _)))).
search_two(X, cons(_, Xs)) :- search_two(X, Xs).

% ex 1.4
% search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).

% ex 2.1
% size(List, Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))...
size(nil, zero).
size(cons(_, T), s(P)) :- size(T, P).

% ex 2.2
% sum_list(List, Sum)
sum_list(nil, zero).
sum_list(cons(X, T), R) :- sum_list(T, I), sum(X, I, R).

% ex 2.4
% max(List, Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max(cons(H, T), Max) :- max(T, H, Max).
max(nil, Max, Max).
max(cons(H, T), TempMax, Max) :- greater(H, TempMax), max(T, H, Max).
max(cons(H, T), TempMax, Max) :- greater_equal(TempMax, H), max(T, TempMax, Max).

% ex 2.5
% min_max(List, Min, Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element
min_max(cons(H, T), Min, Max) :- min_max(T, H, H, Min, Max).
min_max(nil, Min, Max, Min, Max).  
min_max(cons(H, T), TempMin, TempMax, Min, Max) :- greater_equal(H, TempMax), min_max(T, TempMin, H, Min, Max).
min_max(cons(H, T), TempMin, TempMax, Min, Max) :- greater_equal(TempMin, H), min_max(T, H, TempMax, Min, Max).
min_max(cons(H, T), TempMin, TempMax, Min, Max) :- greater(TempMax, H), greater(H, TempMin), min_max(T, TempMin, TempMax, Min, Max).

% ex 3.2
% all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2 , 1 by 1
all_bigger(nil, nil).
all_bigger(cons(H1, T1), cons(H2, T2)) :- greater(H1, H2), all_bigger(T1, T2).

% ex 3.3
% sublist(List1, List2)
% List1 should contain elements all also in List2
sublist(nil, _).
sublist(cons(H1, T), O) :- search(H1, O), sublist(T, O).

% ex 4.2
% seqR(N, List)
seqR(zero, nil).
seqR(s(N), cons(N, T)) :- seqR(N, T).

% ex 5 (fro simplicity, take and drop are the only parameterized computations)

% list_last(List, last) relates a list with the last element
% list_last(cons(a, cons(b, cons(c, nil))), X) --> X / c
list_last(cons(X, nil), X).
list_last(cons(_, T), X) :- list_last(T, X).

% map_increment(List, NewList) relates a list with a list where all elements are incremented
% map_increment(cons(zero, cons(s(s(zero)), nil)), L) --> L / cons(s(zero),cons(s(s(s(zero))),nil))
map_increment(nil, nil).
map_increment(cons(X, T1), cons(s(X), T2)) :- map_increment(T1, T2).

% filter_notzero(List, NewList) relates a list with a list without elements with value zero
% filter_notzero(cons(zero, cons(s(s(zero)), nil)), L) --> L / cons(s(s(zero)),nil)
filter_notzero(nil, nil).
filter_notzero(cons(zero, T), O) :- filter_notzero(T, O).
filter_notzero(cons(s(X), T), cons(s(X), O)) :- filter_notzero(T, O).

% count_notzero(List, Count) relates a list with the number of elements greater than zero
% count_notzero(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), L) --> L / s(s(zero))
count_notzero(nil, zero).
count_notzero(cons(zero, T), O) :- count_notzero(T, O).
count_notzero(cons(s(_), T), s(O)) :- count_notzero(T, O).

% find_notzero(List, FirstPositive) relates a list with the first element which is not zero
% find_notzero(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), L) --> L / s(s(zero))
find_notzero(cons(s(X), _), s(X)).
find_notzero(cons(zero, T), X) :- find_notzero(T, X).

% dropRight2(List, NewList) relates a list with a version of itself without the last 2 elements
% dropRight2(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), L) --> L / cons(zero,nil)
% dropRight2(cons(zero, cons(s(s(zero)), nil)), L) --> L / nil
dropRight2(cons(_, cons(_, nil)), nil).
dropRight2(cons(H, T), cons(H, O)) :- dropRight2(T, O).

% dropWhileZero(List, NewList) relates a list with the same without zeros at the beginning
% dropWhileZero(cons(zero, cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), L) --> L / cons(s(s(zero)),cons(s(zero),nil))
% dropWhileZero(cons(s(zero), cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), L) --> L / cons(s(zero),cons(zero,cons(s(s(zero)),cons(s(zero),nil)))) drop nothing
dropWhileZero(nil, nil).
dropWhileZero(cons(zero, T), O) :- dropWhileZero(T, O).
dropWhileZero(cons(s(X), T), cons(s(X), T)).

% partitionNotZero(List, Zeros, NotZeroes). relates a list with two list, generated from splitting zeroes from non zeroes
% partitionNotZero(cons(s(zero), cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), L1, L2) --> L1 / cons(zero,nil) L2 / cons(s(zero),cons(s(s(zero)),cons(s(zero),nil)))
partitionNotZero(nil, nil, nil).
partitionNotZero(cons(zero, T), cons(zero, Z), NZ) :- partitionNotZero(T, Z, NZ).
partitionNotZero(cons(s(X), T), Z, cons(s(X), NZ)) :- partitionNotZero(T, Z, NZ).

% reversed(List, ReversedList) relates a list with its reverse
% reversed(cons(zero, cons(s(s(zero)), cons(s(zero), nil))), L) --> L / cons(s(zero),cons(s(s(zero)),cons(zero,nil)))
reversed(nil, nil).
reversed(cons(X, T), O) :- reversed(T, W), last(W, X, O).


% drop(List, N, NewList) relates a list with a version of itself without the first N elements
% drop(cons(s(zero), cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), s(s(zero)), L) --> L / cons(s(s(zero)),cons(s(zero),nil))
% drop(cons(s(zero), cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), s(s(s(s(s(s(zero)))))), L) --> L / nil
% drop(cons(s(zero), cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), zero, L) --> L / cons(s(zero),cons(zero,cons(s(s(zero)),cons(s(zero),nil))))
drop(nil, _, nil).
drop(L, zero, L).
drop(cons(X, T), s(N), O) :- drop(T, N, O).

% take(List, n, NewList) relates a list and a number with a list of only the first N elements
% take(cons(s(zero), cons(zero, cons(s(s(zero)), cons(s(zero), nil)))), s(s(zero)), L) --> L / cons(s(zero),cons(zero,nil))
take(nil, _, nil).
take(_, zero, nil).
take(cons(X, T), s(N), cons(X, O)) :- take(T, N, O).

% zip(LIst1, List2, NewList) relates two lists with the zipped version of themselves
% zip(cons(zero, cons(s(zero), nil)), cons(s(s(zero)), cons(s(zero), nil)), L) --> L / cons((zero,s(s(zero))),cons((s(zero),s(zero)),nil))
% zip(cons(zero, cons(s(zero), nil)), cons(s(s(zero)), nil), L) --> L / cons((zero,s(s(zero))),nil) with different size lists
zip(nil, _, nil).
zip(_, nil, nil).
zip(cons(X, T1), cons(Y, T2), cons((X, Y), O)) :- zip(T1, T2, O).