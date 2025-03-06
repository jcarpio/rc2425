chatty(gustavo).
chatty(valeria).

likes(esteban, malena).
likes(malena, esteban).
likes(gustavo, valeria).

pairing(A, _):- chatty(A), A \= B.
pairing(_, A):- chatty(A), A \= B.
% a /\ b -> c
pairing(A, B):- likes(A,B), likes(B,A), A \= B. 

seating(A, B, C, D, E):- pairing(A,B), pairing(B, C), pairing(C,D), pairing(D, E). 
