

/*
  Problema de Estados: Jarras
   
  1. Definir el estado
  2. Definir EstadoInicial y EstadoFinal
  3. Definir los movimientos
  4. Definir el Camino desde el Ei al Ef

*/  


/*
1. Definir el estado
estado(L3, L5).
*/



/*
  2. Definir EstadoInicial y EstadoFinal

  Ei = estado(0,0)
  Ef = estado(_,4)
  
*/

/*
  3. Definir los movimientos
*/

mov(llenar_3, estado(_, L5), estado(3, L5)).
mov(llenar_5, estado(L3, _), estado(L3, 5)).
mov(vaciar_3, estado(_, L5), estado(0, L5)).
mov(vaciar_5, estado(L3, _), estado(L3, 0)).
mov(pasar_3a5, estado(L3, L5), estado(0, Suma)):- 
  Suma is L3 + L5, Suma =< 5.
mov(pasar_3a5, estado(L3, L5), estado(Suma2, 5)):- 
  Suma is L3 + L5, Suma > 5, Suma2 is Suma - 5.
mov(pasar_5a3, estado(L3, L5), estado(Suma, 0)):- 
  Suma is L3 + L5, Suma =< 3.
mov(pasar_5a3, estado(L3, L5), estado(3, Suma2)):- 
  Suma is L3 + L5, Suma > 3, Suma2 is Suma - 3.
  
  
/*

4. Camino

camino(Ei, Ef, Visitados, Camino)  

*/  

camino(Ei, Ei, _, []).

camino(Ei, Ef, Visitados, [Mov|Camino]):-
  mov(Mov, Ei, ETMP),
  \+ member(ETMP, Visitados),
  camino(ETMP, Ef, [ETMP|Visitados], Camino).  
