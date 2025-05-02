% hamming_distance(Str1, Str2, Dist).

hamming_distance(Str1, Str2, R):-
  string_chars(Str1, List1), 
  string_chars(Str2, List2), 
  length(List1, L1), length(List2, L1),
  hamming2(List1, List2, R).

hamming2([], [], 0).

hamming2([H1|T1], [H1|T2], R):-
  hamming2(T1, T2, R).

hamming2([H1|T1], [H2|T2], R2):- H1 \= H2,
  hamming2(T1, T2, R), R2 is R + 1.
