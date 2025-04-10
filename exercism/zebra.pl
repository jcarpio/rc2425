:- use_module(library(clpfd)).
:- use_module(library(pairs)).

zebra_owner(Owner):- solution(Pairs, _, Zebra, Vs), label(Vs), member(Zebra-Owner, Pairs).

water_drinker(Drinker):- solution(Pairs, Water, _, Vs), label(Vs), member(Water-Drinker, Pairs).

solution(Pairs, Water, Zebra, Vs) :-
        Table   = [Houses,Nations,Drinks,Actions,Animals],
        Houses  = [Red,Green,Yellow,Blue,Ivory],
        Nations = [England,Spain,Ukraine,Norway,Japan],
        Names   = [englishman,spaniard,ukrainian,norwegian,japanese],
        Drinks  = [Coffee,Milk,OrangeJuice,Tea,Water],
        Actions = [Dance, Read, Paint, Chess, Soccer],
        Animals = [Dog,Snails,Horse,Fox,Zebra],
        pairs_keys_values(Pairs, Nations, Names),
        maplist(all_distinct, Table),
        append(Table, Vs),
        Vs ins 1..5,
        England #= Red,               % hint 1
        Spain #= Dog,                 % hint 2
        Coffee #= Green,              % hint 3
        Ukraine #= Tea,               % hint 4
        Green #= Ivory + 1,           % hint 5
        Dance #= Snails,              % hint 6
        Paint #= Yellow,              % hint 7
        Milk #= 3,                    % hint 8
        Norway #= 1,                  % hint 9
        next_to(Read, Fox),           % hint 10
        next_to(Paint, Horse),        % hint 11
        Soccer #= OrangeJuice,        % hint 12
        Japan #= Chess,               % hint 13
        next_to(Norway, Blue).        % hint 14

next_to(H, N) :- abs(H-N) #= 1.
    
