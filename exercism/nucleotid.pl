nucleotide_count(String, R2):-
   string_upper(String, String2),
   string_chars(String2, Chars),  maplist(valid, Chars), msort(Chars, Sort), compress(Sort, R),
fill(['A', 'C', 'G', 'T'], R, R2).

valid('A').
valid('C').
valid('G').
valid('T').

compress([],[]).
compress([E], [(E,1)]).
compress([H1, H1|Tail], [(H1,N2)|R]):-
  compress([H1|Tail], [(H1, N)|R]), N2 is N+1.
compress([H1, H2|Tail], [(H1,1)|R]):- H1 \= H2,
  compress([H2|Tail], R).

fill([], Compress, []).
fill([Head|Tail], Compress, [(Head,N)|R]):-
 member((Head, N), Compress), 
 fill(Tail, Compress, R).

fill([Head|Tail], Compress, [(Head,0)|R]):-
 \+ member((Head, N), Compress), 
 fill(Tail, Compress, R).
 
