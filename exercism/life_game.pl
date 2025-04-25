:- use_module(library(clpfd)).

/*
tick(Current, Next).
*/

matrix_1([
            [1, 1, 0],
            [0, 0, 0],
            [1, 0, 0]
        ]).
		
/*		
neighbors(X, Y, Matix, List).


neighbors(0, 0, Matix1, List).
List=[1,1,0,0]
*/  


select(Matrix, X, R):-
  length(Matrix, LM), N1 is X - 1,
  N12 is max(0, N1), 
  length(L1, N12),
  N3 is LM - (X + 2), N32 is max(0, N3),
  length(L3, N32),  
  append([L1, R, L3], Matrix).

neighbors(X, Y, Matrix, List):- select(Matrix, Y, Rows),
  transpose(Rows, Cols), select(Cols, X, R), transpose(R, R2), append(R2, List).

tick(M,X,Y, 1):- pos(X,Y, M, Pos), Pos = 1, neighbors(X, Y, M, List), R2 in 2..3, sum_list(List, R), R2 is R - Pos.
tick(M,X,Y, 1):- pos(X,Y, M, Pos), Pos = 0, neighbors(X, Y, M, List), sum_list(List, R), 3 is R - Pos.
tick(M,X,Y, 0):- pos(X,Y, M, Pos), Pos = 1, neighbors(X, Y, M, List), sum_list(List, R), R2 is R - Pos,  R2 > 3.
tick(M,X,Y, 0):- pos(X,Y, M, Pos), Pos = 1, neighbors(X, Y, M, List), sum_list(List, R), R2 is R - Pos,  R2 < 2.
tick(M,X,Y, 0):- pos(X,Y, M, Pos), Pos = 0, neighbors(X, Y, M, List), sum_list(List, R), R2 is R - Pos, R2 \= 3.

pos(X, Y, M, Pos):- nth0(Y, M, Row), nth0(X, Row, Pos). 
  
tick(M, Row, R):- length(M, L), pop(L, L2), pop2(Row, L, L3), maplist(tick(M), L2, L3, R).  

tick(M, R):- length(M,L), pop(L, L2), maplist(tick(M), L2, R).
  
pop(N, R2):- populate(N, R), reverse(R, R2).  
populate(0, []).  
populate(N, [N2|R]):- N > 0, N2 is N - 1, populate(N2, R).

pop2(_, 0, []).
pop2(N, L, [N|R]):- L > 0, L2 is L-1, pop2(N, L2, R).
