chatty(gustavo).
chatty(valeria).

no_juntos(A, B):- likes(A,B), \+ likes(B,A).
no_juntos(A, B):- likes(B,A), \+ likes(A,B).

likes(esteban, malena).
likes(malena, esteban).
likes(gustavo, valeria).

pairing(A, B):- chatty(A), A \= B, \+ no_juntos(A,B).
pairing(B, A):- chatty(A), A \= B, \+ no_juntos(A,B).
% a /\ b -> c
pairing(A, B):- likes(A,B), likes(B,A), A \= B. 

seating(A, B, C, D, E):- pairing(A,B), pairing(B, C), pairing(C,D), pairing(D, E),
  all_dif([A,B,C,D,E]).

/*
all_dif(Lista)
  es cierto si todos los elementos de Lista son diferentes.

Inducción:
1)P(n0)
2) Para todo n > n0, P(n-1) -> P(n)  

para conseguir el n-1 lista utilizamos el operador "|"

dif/2
dif(A1, A2)

maplist(dif(1), [2,3,4,5]). 



*/

all_dif([]).
all_dif([Cab|Resto]):- all_dif(Resto), maplist(dif(Cab), Resto). 
                       


