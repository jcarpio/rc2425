
ag1(
  a(1, [a(2,[a(5,[])]),a(3,[]),a(4,[])])
).


/* 
lista_hojas_ag(+ArbolGenerico, ?Lista_hojas)
es cierto cuando Lista_hojas unifica con una lista que con-
tiene las etiquetas de las hojas del ArbolGenerico

Principio de inducción
1) P(n0)
2) n > n0, P(n-1) -> P(n)

*/

hoja(a(_, [])).

lista_hojas_ag(A, [Et]):- hoja(A), etiqueta(A, Et).
lista_hojas_ag(A, R):- \+ hoja(A), 
  lista_hijos(A, ListaHijos),
  lista_hojas(ListaHijos, R).

lista_hijos(A, L):- a(_, L) = A.  
  
lista_hojas([], []).
lista_hojas([Cab|Resto], R):-
  lista_hojas_ag(Cab, RCa),
  lista_hojas(Resto, RR),
  append(RCa, RR, R).
    
etiqueta(a(Et, _), Et).
