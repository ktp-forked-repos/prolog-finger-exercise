%% family tree

father(zeb, john_boy_sr).
father(john_boy_sr, john_boy_jr).

ancestor(X,Y) :-
    father(X,Y).
ancestor(X,Y) :-
    father(X,Z), ancestor(Z,Y).

%% maths

count(0, []).
count(Count, [Head|Tail]) :-
    count(TailCount, Tail), Count is TailCount + 1.

sum(0,[]).
sum(Sum, [Head|Tail]) :-
    sum(TailSum, Tail), Sum is TailSum + Head.

average(Average, L) :-
    sum(Sum, L), count(Count, L), Average is Sum/Count.
