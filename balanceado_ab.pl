
arbol1( 
       a(1, a(2,nil,nil), a(3,nil,nil))
	  ).
	  
arbol2(
       a(1, a(2, a(4,nil,nil), a(5,nil,nil)), 
	        a(3, a(6, nil,nil), a(7, a(8,nil,nil), nil)))
      ).

/*
balanceado(Arbol)
  es cierto si <<para todo nodo>> de Arbol la diferencia
  entre la altura del sub árbol izquiero y la altura 
  del sub árbol derecho sea como máximo 1.
*/

balanceado(nil).
balanceado(a(_, AI, AD)):-
  altura(AI, RI),
  altura(AD, RD),
  Dif is abs(RI - RD),
  Dif =< 1,
  balanceado(AI),
  balanceado(AD).  

/*
altura(ArbolBinario, Alt)
  es cierto si Alt unifica con la altura del ArbolBinario.
*/

altura(nil, 0).
altura(a(_, AI, AD), R):-
  altura(AI, RI),
  altura(AD, RD),
  Alt is max(RI, RD),
  R is Alt + 1.
