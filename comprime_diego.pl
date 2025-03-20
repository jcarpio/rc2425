/*
comprime(Lista, R)
es cierto si R unifica con una lista de la siguiente forma:
comprime([a,a,a,b,b,c,a,a], R).
R=[(a,3),(b,2),(c,1),(a,2)]
*/

comprime([], []).

comprime([Cabeza | Resto], [(Cabeza, N) | R]) :- 
  vecesRepetido(Cabeza, Resto, N, Resto2), 
  comprime(Resto2, R).

vecesRepetido(X, [Y | Resto], 1, [Y | Resto]) :- 
  X \= Y.

vecesRepetido(_, [], 1, []).

vecesRepetido(X, [X | Resto], N, Resto2) :- 
  vecesRepetido(X, Resto, N1, Resto2), N is N1 + 1.
