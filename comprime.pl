/*
comprime(Lista, R)
es cierto si R unifica con una lista de la siguiente forma:
comprime([a,a,a,b,b,c,a,a], R).
R=[(a,3),(b,2),(c,1),(a,2)]

comprime([d,a,a,a,b,b,c,a,a], R).
R=[(d,1),(a,3),(b,2),(c,1),(a,2)]

comprime([a,a,a,b,b,c,a,a], R).
R=[(a,3),(b,2),(c,1),(a,2)]


Inducción
1) p(n0)
2) p(n-1) -> p(n)

comprime([a,a,b,b,c,a,a], R).
R=[(a,2),(b,2),(c,1),(a,2)]


*/

comprime([], []).

comprime([Elem], [(Elem,1)]).

comprime([Cab1, Cab1|Resto], [(Cab1,N2)|R]):- 
  comprime([Cab1|Resto], [(Cab1,N)|R]), N2 is N+1.

comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2,
  comprime([Cab2|Resto], R).
