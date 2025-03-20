
/*
isogram(String).
 es ciero si la cadena String es un isograma excluyendo
 guines y espacios en blanco.

*/



/*

quitar_blancos(Lista, R)
  es cierto si R unifica con una lista con los 
  caracters de Lista eliminando espacios en blanco
  y guiones.
  
*/

blanco(' ').
blanco('-').

quitar_blancos([],[]).
quitar_blancos([Cab|Resto], R):-
  quitar_blancos(Resto, R), blanco(Cab).
quitar_blancos([Cab|Resto], [Cab|R]):-
  quitar_blancos(Resto, R), \+ blanco(Cab).  
 

/*

lower_case(Lista, R)

  downcase_atom(+AnyCase, -LowerCase)
*/

lower_case([], []).
lower_case([Cab|Resto],[R2|R]):-
   lower_case(Resto, R), downcase_atom(Cab, R2). 
