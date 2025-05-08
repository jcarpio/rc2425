
arbol1( 
       a(1, a(2,nil,nil), a(3,nil,nil))
	  ).
	  
arbol2(
       a(1, a(2, a(4,nil,nil), a(5,nil,nil)), 
	        a(3, a(6, nil,nil), a(7, a(8,nil,nil), nil)))
      ).


/*
crea_ab(Lista, ArbolBinario)
  es cierto si ArbolBinario unifica con un ábol binario
  balanceado que contiene todas las etiquetas de Lista.
*/

crea_ab([], nil).
crea_ab([Cab|Resto], a(Cab, A1, A2)):-
  length(Resto, L),
  Med is L div 2,
  length(L1, Med),
  append(L1, L2, Resto),
  crea_ab(L1, A1),
  crea_ab(L2, A2).

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
