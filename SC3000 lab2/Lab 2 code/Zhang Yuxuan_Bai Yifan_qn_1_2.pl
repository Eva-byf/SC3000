% Facts
competitor(sumsum, appy).
boss(stevey, appy).
developed(galactica_s3, sumsum).
stole(stevey, galactica_s3).
smartphone(galactica_s3).

% Rule: A smartphone technology is business
business(T) :-
    smartphone(T),
    developed(T, _).

% Rule: A competitor is a rival (and vice versa)
rival(X, Y) :-
    competitor(X, Y).

competitor(X, Y) :-
    rival(X, Y).

% Rule: It is unethical for a boss to steal business developed by a rival
unethical(Boss) :-
    boss(Boss, Company),
    stole(Boss, Tech),
    business(Tech),
    developed(Tech, Rival),
    rival(Rival, Company).
