arbol1( 
       a(1, a(2,nil,nil), a(3,nil,nil))
	  ).
	  
arbol2(
       a(1, a(2, a(4,nil,nil), a(5,nil,nil)), 
	        a(3, a(6, nil,nil), a(7, a(8,nil,nil), nil)))
      ).

/*
inorden(ArbolBinario, ListaRecorrido)
  es cierto si ListaRecorrido unifica con las etiquetas
  de ArbolBinario recorridas en inorden.

*/

inorden(nil, []).

inorden(a(Et, HI, HD), R):-
 inorden(HI, RI),
 inorden(HD, RD),
 append(RI, [Et|RD], R).


/*
preorden(ArbolBinario, ListaRecorrido)
  es cierto si ListaRecorrido unifica con las etiquetas
  de ArbolBinario recorridas en preorden.

*/

preorden(nil, []).

preorden(a(Et, HI, HD), R):-
 preorden(HI, RI),
 preorden(HD, RD),
 append([Et|RI], RD, R).


/*
postorden(ArbolBinario, ListaRecorrido)
  es cierto si ListaRecorrido unifica con las etiquetas
  de ArbolBinario recorridas en postorden.

*/

postorden(nil, []).

postorden(a(Et, HI, HD), R):-
 postorden(HI, RI),
 postorden(HD, RD),
 append([RI, RD, [Et]], R).
