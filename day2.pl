%% family tree

father(zeb, john_boy_sr).
father(john_boy_sr, john_boy_jr).

ancestor(X,Y) :-
    father(X,Y).
ancestor(X,Y) :-
    father(X,Z), ancestor(Z,Y).

%% maths

count(0, []).
count(Count, [_|Tail]) :-
    count(TailCount, Tail), Count is TailCount + 1.

sum(0,[]).
sum(Sum, [Head|Tail]) :-
    sum(TailSum, Tail), Sum is TailSum + Head.

average(Average, L) :-
    sum(Sum, L), count(Count, L), Average is Sum/Count.

%% self written concat

concat([],List,List).
concat([Head|Tail1], List1, [Head|Tail2]) :-
    concat(Tail1, List1, Tail2).


%% exercises

%% reversing a list

reverse([],[]).
reverse([Head|Tail], B) :-
    reverse(Tail, Tail2),
    concat(Tail2, [Head], B).

% find minimum in a list

min([Head|[]],Head).
min([Head|Tail], Head) :-
    min(Tail,TailMin),
    Head =< TailMin.
min([Head|Tail], TailMin) :-
    min(Tail,TailMin),
    Head > TailMin.

% sort a list
sorted([]).
sorted([_]).
sorted([A,B|Tail]) :-
    A =< B,
    sorted([B|Tail]).

sort2(List,Sorted) :-
    permutation(List, Sorted),
    sorted(Sorted).
