% Facts about the offspring of Queen Elizabeth
offspring(prince_charles, male, 1).
offspring(princess_ann, female, 2).
offspring(prince_andrew, male, 3).
offspring(prince_edward, male, 4).

% Custom comparison: males come before females; within same gender, order by birth
compare_offspring_old(<, X, Y) :-
    offspring(X, male, OX),
    offspring(Y, female, _), !.

compare_offspring_old(>, X, Y) :-
    offspring(X, female, _),
    offspring(Y, male, OY), !.

compare_offspring_old(Order, X, Y) :-
    offspring(X, _, OX),
    offspring(Y, _, OY),
    compare(Order, OX, OY).

% Rule to compute old-style succession list
new_line_of_succession(SuccessionList) :-
    findall(Name, offspring(Name, _, _), Offspring),
    predsort(compare_offspring_old, Offspring, SuccessionList).

