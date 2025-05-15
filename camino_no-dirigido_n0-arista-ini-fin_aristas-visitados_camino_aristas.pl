
grafo1(
   g([a,b,c,d], [a(a,b),a(a,c), a(c,b), a(c,d)])
).

grafo2(
   g([a,b,c,d,e], 
   [a(a,b), a(a,c), a(b,c), a(b,d), a(d,e), a(e,c), a(d,c), a(b,e)])
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
	   es cierto si Camino unifica con una lista de aristas
	   para llegar desde Ini hasta fin, sin repetir las
	   aristas Visitados en el grafo g(Vertices, Aristas)
*/

camino(G, Ini, Fin, _, [a(Ini,Fin)]):- 
  conectado(G, Ini, Fin).

camino(g(Vertices, Aristas), Ini, Fin, Visitados, [a(Ini,TMP)|Camino]):-
  conectado(g(Vertices, Aristas), Ini, TMP),
  \+ member(a(Ini,TMP), Visitados), 
  camino(g(Vertices, Aristas), TMP, Fin, [a(Ini,TMP),a(TMP,Ini)|Visitados],
    Camino). 


conectado(g(_, Aristas), Ini, Fin):- 
  member(a(Ini,Fin), Aristas).   
  
conectado(g(_, Aristas), Ini, Fin):- 
  member(a(Fin, Ini), Aristas).   

/*
?- grafo2(G), camino(G, Ini, Ini, [], Camino).
G = g([a, b, c, d, e], [a(a, b), a(a, c), a(b, c), a(b, d), a(d, e), a(e, c), a(d, c), a(..., ...)]),
Ini = a,
Camino = [a(a, b), a(b, c), a(c, a)] 


?- grafo2(G), camino(G, Ini, Fin, [], Camino), length(Camino, 8).
G = g([a, b, c, d, e], [a(a, b), a(a, c), a(b, c), a(b, d), a(d, e), a(e, c), a(d, c), a(..., ...)]),
Ini = a,
Fin = b,
Camino = [a(a, b), a(b, c), a(c, e), a(e, b), a(b, d), a(d, c), a(c, a), a(a, b)] 
*/



