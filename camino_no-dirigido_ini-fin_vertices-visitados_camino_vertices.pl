
grafo1(
   g([a,b,c,d], [a(a,b),a(a,c), a(c,b), a(c,d)])
).

/*
     Ini --Arista-- TMP ------- Camino -------- Fin

Formas de representar el camino
 1. Lista de vertices
 2. Lista de aristas

Casos más sencillos
 1. Ini = Fin
 2. Existe una arista entre Ini y Fin 
 
Lista de Visitados
 1. Lista de aristas
 2. Lista de vertices

Tipo de grafo
 1. Dirigido
 2. No dirigido 
	 
Inducción
1) P(n0)    
	 1.a) camino(Grafo, Ini, Ini,   ).
	 1.b) camino(Grafo, Ini, Fin    ):- arista(Ini, Fin, Grafo).
	 

	 
1. Camino: No dirigido, 
           Camino = Lista de vertices, 
		   Visitados = Vertices, 
		   n0 = Ini=Fin
*/	 
	 
/*
	 camino(g(Vertices, Aristas), Ini, Fin, Visitados, Camino)
	   es cierto si Camino unifica con una lista de vértices
	   para llegar desde Ini hasta fin, sin repetir los
	   vertices Visitados en el grafo g(Vertices, Aristas)
*/

camino(_, Ini, Ini, _, [Ini]).

camino(g(Vertices, Aristas), Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(g(Vertices, Aristas), Ini, TMP),
  \+ member(TMP, Visitados),
  camino(g(Vertices, Aristas), TMP, Fin, [TMP|Visitados], Camino). 



conectado(g(_, Aristas), Ini, Fin):- 
  member(a(Ini,Fin), Aristas).   
  
conectado(g(_, Aristas), Ini, Fin):- 
  member(a(Fin, Ini), Aristas).   
