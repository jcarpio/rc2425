
:- use_module(library(clpfd)).

/*
combinations(Size, Sum, Exclude, Combinations).

*/

combinations(Size, Sum, Exclude, R4):- setof(R, combinations2(Size, Sum, _, R), R2),
  filter_all(Exclude, R2, R3), remove_repeated_set(R3, R4).

remove_repeated_set([], []).  
  
remove_repeated_set([Head|Tail], R):-
  set_member(Head, Tail),
  remove_repeated_set(Tail, R).

remove_repeated_set([Head|Tail], [Head|R]):-
  \+ set_member(Head, Tail),
  remove_repeated_set(Tail, R).
    
/*
set_member(Set, List).
*/

set_member(Set, [Head|_]):-
  
  equal_set(Set, Head).
set_member(Set, [_|Tail]):-
  set_member(Set, Tail).
  
equal_set(Set1, Set2):- difference(Set1, Set2, []).
  
combinations2(Size, Sum, _, List):- Sum > 9, length(List, Size), 
  List ins 1..9, all_distinct(List), my_sum_list(List, Sum), label(List).
  
combinations2(Size, Sum, _, List):- Sum =< 9, length(List, Size), 
  List ins 1..Sum, 
  all_distinct(List), my_sum_list(List, Sum), label(List).
  
filter_all([], List, List).  
 
filter_all([Head|Tail], List, R2):-
 filter_all(Tail, List, R),
 my_filter(Head, R, R2).
  
/*  
my_filter(E, List, R) 
*/

my_filter(_, [], []).

my_filter(E, [Head|Tail], [Head|R]):-
  \+ memberchk(E, Head),
  my_filter(E, Tail, R).

my_filter(E, [Head|Tail], R):-
  memberchk(E, Head),
  my_filter(E, Tail, R).
  
my_sum_list([], 0).
my_sum_list([Head|Tail], R2):-
 my_sum_list(Tail, R),
 R2 #= Head + R.
 
/* Set Difference */ 

difference([], _, []).
difference(Set1, [], Set1).
difference(Set1, [H|T], R):- difference(Set1, T, Difference), append(L1, [H|L2], Difference), append(L1, L2, R).

difference(Set1, [H|T], Difference):- difference(Set1, T, Difference), \+ member(H, Difference).
