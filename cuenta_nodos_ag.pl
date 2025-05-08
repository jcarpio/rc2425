
ag1(
  a(1, [a(2,[a(5,[])]),a(3,[]),a(4,[])])
).


/* cuenta_nodos(+Arbol_generico, ?Num_nodos)
es cierto cuando Num_nodos unifica con el
numero de nodos del Arbol_generico
*/

cuenta_nodos(a(_, ListaHijos), R):-
  cuenta_nodos(ListaHijos, RLH),
  R is RLH + 1.
  
cuenta_nodos([], 0).
cuenta_nodos([Cab|Resto], R):-
   cuenta_nodos(Cab, RCa),
   cuenta_nodos(Resto, RR),
   R is RCa + RR.
