
%% wallace & grommit

likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X,Y) :-
    X \= Y, likes(X,Z), likes(Y,Z).

%% foods

food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

food_flavor(X, Y) :-
    food_type(X, Z), flavor(Y, Z).

%% country colors

different(red, green).
different(red, blue).
different(green, red).
different(green, blue).
different(blue, red).
different(blue, green).

coloring(France, Germany, Belgium, Poland, Denmark, Austria) :-
    different(France, Germany),
    different(Belgium, Poland),
    different(Denmark, Germany),
    different(Poland, Austria).

%% ohmy

cat(lion).
cat(tiger).

dorothy(X,Y,Z) :-
    X = lion, Y = tiger, Z = bear.
twin_cats(X, Y) :-
    cat(X), cat(Y).

%% exercises

wrote(hesse, siddharta).
wrote(philpotts, petrology).
wrote(hesse, glasperlenspiel).
wrote(schopenhauer, wille_und_vorstellung).

plays(kerr_king, guitar).
plays(dave_lombardo, drums).
plays(phil_collins, drums).
plays(james_hetfield, guitar).
