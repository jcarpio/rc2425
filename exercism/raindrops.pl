convert(N, R):-
 divisors([3,5,7], N, R), R \= "".

convert(N, R2):-
 divisors([3,5,7], N, R), R = "", number_string(N, R2).
 
convert(N, R2):-
 \+ divisors([3,5,7], N, R), number_string(N, R2). 

divisors([], _, "").

divisors([3|Tail], N, R2):-
  0 is N mod 3,
  divisors(Tail, N, R),
  string_concat("Pling", R, R2).
  
divisors([3|Tail], N, "Pling"):-
  0 is N mod 3,
  \+ divisors(Tail, N, _).
  
  
divisors([3|Tail], N, R):-
  Rest is N mod 3, Rest \= 0,
  divisors(Tail, N, R).
  
  
divisors([5|Tail], N, R2):-
  0 is N mod 5,
  divisors(Tail, N, R),
  string_concat("Plang", R, R2).

divisors([5|Tail], N, "Plang"):-
  0 is N mod 5,
  \+ divisors(Tail, N, _).

divisors([5|Tail], N, R):-
  Rest is N mod 5, Rest \= 0,
  divisors(Tail, N, R).
  

divisors([7|Tail], N, R2):-
  0 is N mod 7,
  divisors(Tail, N, R),
  string_concat("Plong", R, R2).
  
divisors([7|Tail], N, "Plong"):-
  0 is N mod 7,
  \+ divisors(Tail, N, _).
  
divisors([7|Tail], N, R):-
  Rest is N mod 7, Rest \= 0,
  divisors(Tail, N, R).
