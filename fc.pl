is_member(_, []) :- false.
is_member(X, [H | Tail]) :- X = H; is_member(X, Tail).

has_starred(Movie, Actor) :- 
	starred_actors(Movie, Actors),
	is_member(Actor, Actors).

are_about(Movie, Tag) :- 
	has_tags(Movie, Tags),
	is_member(Tag, Tags).

includes(Str, SubString) :-
	sub_string(Str, _, _, _, SubString).


identify_question(Question, X) :-
	(includes(Question, "are about");
	includes(Question, "be described")).


identify_question(Question, X) :-
	(includes(Question, "director");
	includes(Question, "directs")),
	write("A directors question!!! Do you want to know who is the director of some movie or which movies a director did their magic?"),nl,
	read(Y),
	(findall(X, directed_by(Y, X), L), write(L));
	(directed_by(X, Y), write(X)).

identify_question(Question, X) :-
	(includes(Question, "acts");
	includes(Question, "did act");
	includes(Question, "starred")).

hi :-
	write("Hello human, what do you want to know about movies?"),nl,
	read(Question),
	identify_question(Question, X).

ask :- hi.
hello :- hi.