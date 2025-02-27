:- use_module(library(clpfd)).

% gustavo=1, valeria=2, esteban=3, malena=4, jaime=5
list([gustavo-1, valeria-2, esteban-3, malena-4, jaime-5]).

% Define the 'chatty' fact
chatty_n(1).
chatty_n(2).

chatty(Name):- translate([Number], [Name]), chatty_n(Number).


% Define the 'likes' fact
likes_n(3, 4).
likes_n(4, 3).
likes_n(1, 2).

likes(Name1, Name2):- translate([Number1, Number2],
                                [Name1, Name2]), likes_n(Number1, Number2).

% Define the 'pairing' rule
pairing_n(A, B):- likes_n(A,B), likes_n(B,A).
pairing_n(A,_):- chatty_n(A).
pairing_n(_,A):- chatty_n(A).

pairing(Name1, Name2):- translate([Number1, Number2], [Name1, Name2]),
    pairing_n(Number1, Number2).

translate([],[]).
translate([HX|TX], [HN|TN]):-
    list(L),
    member(HN-HX, L),
    translate(TX, TN).
    

% Define the 'seating' rule
seating2(A, B, C, D, E):- pairing_n(A,B), pairing_n(B,C),
  pairing_n(C,D), pairing_n(D,E), all_distinct([A,B,C,D,E]).

seating(N1, N2, N3, N4, N5):- seating2(A, B, C, D, E), translate([A,B,C,D,E], [N1,N2,N3,N4,N5]).
