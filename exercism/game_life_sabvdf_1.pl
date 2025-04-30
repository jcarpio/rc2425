:- use_module(library(clpfd)).

        
matrix_1([
	[1, 1, 0, 1, 1, 0, 0, 0],
	[1, 0, 1, 1, 0, 0, 0, 0],
	[1, 1, 1, 0, 0, 1, 1, 1],
	[0, 0, 0, 0, 0, 1, 1, 0],
	[1, 0, 0, 0, 1, 1, 0, 0],
	[1, 1, 0, 0, 0, 1, 1, 1],
	[0, 0, 1, 0, 1, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 1, 1]

]).


matrix_2([
	[0, 1, 0],
	[1, 0, 0],
	[1, 1, 0]
]).
          


        

          

countrow([X | [Y | [Z | []]]], Counts) :-

        

          

    A is X + Y,

        

          

    B is X + Y + Z,

        

          

    C is Y + Z,

        

          

    Counts = [A | [B | [C | []]]].

        

          

countrow([X | [Y | [Z | More]]], Counts) :-

        

          

    countrow([Y | [Z | More]], [_ | [SubCount | Rest]]),

        

          

    A is X + Y,

        

          

    B is X + Y + Z,

        

          

    C is SubCount,

        

          

    Counts = [A | [B | [C | Rest]]].

        

          


        

          

countcross([X1 | [Y1 | [Z1 | []]]], [X2 | [Y2 | [Z2 | []]]], Counts) :-

        

          

    A is X1 + Y2,

        

          

    B is X2 + Y1 + Z2,

        

          

    C is Y2 + Z1,

        

          

    Counts = [A | [B | [C | []]]].

        

          

countcross([X1 | [Y1 | [Z1 | More1]]], [X2 | [Y2 | [Z2 | More2]]], Counts) :-

        

          

    countcross([Y1 | [Z1 | More1]], [Y2 | [Z2 | More2]], [_ | [SubCount | Rest]]),

        

          

    A is X1 + Y2,

        

          

    B is X2 + Y1 + Z2,

        

          

    C is SubCount,

        

          

    Counts = [A | [B | [C | Rest]]].

        

          


        

          

crosssum(A, B, C, D) :- D is A + B - (2 * C).

        

          


        

          

count_neighbors(Matrix, Neighbors) :-

        

          

    maplist(countrow, Matrix, HNeighbors),

        

          

    transpose(Matrix, Transpose),

        

          

    transpose(HNeighbors, TrNeighbors),

        

          

    maplist(countcross, Transpose, TrNeighbors, TrDNeighbors),

        

          

    transpose(TrDNeighbors, DNeighbors),

        

          

    maplist(maplist(crosssum), HNeighbors, DNeighbors, Matrix, Neighbors).

        

          


        

          

life(Current, Neighbors, Next) :-

        

          

    (Current == 1, Neighbors == 2;

        

          

        Neighbors == 3) -> Next = 1; Next = 0.

        

          


        

          

tick(Current, Next) :-

        

          

    count_neighbors(Current, Neighbors),

        

          

    maplist(maplist(life), Current, Neighbors, Next).