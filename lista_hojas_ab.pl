
arbol1( 
       a(1, a(2,nil,nil), a(3,nil,nil))
	  ).
	  
arbol2(
       a(1, a(2, a(4,nil,nil), a(5,nil,nil)), 
	        a(3, a(6, nil,nil), a(7, a(8,nil,nil), nil)))
      ).


/* 

lista_hojas(+Arbol_binario, ?Lista_hojas)
es cierto cuando Lista_hojas unifica con una lista que con-
tiene las etiquetas de las hojas del árbol “Arbol_binario”

Principio de inducción
1) P(n0)
2) n > n0, P(n-1) -> P(n)
*/


lista_hojas(nil, []).

lista_hojas(A, [Et]):- hoja(A), etiqueta(A, Et).

lista_hojas(A, R):- \+ hoja(A), 
  A = a(_, AI, AD), 
  lista_hojas(AI, RI),
  lista_hojas(AD, RD),
  append(RI, RD, R).


hoja(a(_, nil, nil)).

etiqueta(a(Et,_,_), Et).
