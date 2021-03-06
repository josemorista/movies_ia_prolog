is_member(_, []) :- false.
is_member(X, [H | Tail]) :- X = H; is_member(X, Tail).

has_starred(Movie, Actor) :- 
	starred_actors(Movie, Actors),
	is_member(Actor, Actors).

are_about(Movie, Tag) :- 
	has_tags(Movie, Tags),
	is_member(Tag, Tags).

has_common_member([], _) :- false.
has_common_member([H| Tail], L) :- 
	is_member(H, L);
	has_common_member(Tail, L).

suggest_me([], _) :- true.

suggest_me([Movie| Tail], X) :- 
	((has_genre(Movie, G),
	has_genre(X, GCand),
	has_common_member(GCand, G)),
	not(X = Movie),
	(has_tags(Movie, A),
		has_tags(X, ACand),
		has_common_member(ACand, A))),
		suggest_me(Tail, X).

includes(Str, SubString) :-
	sub_string(Str, _, _, _, SubString).

identify_question(Question) :-
	(includes(Question, "suggest");
	includes(Question, "recomend")),
	write("Tell me a list of movies you like and i will find the right movie for you!"),nl,
	read(Y),
	suggest_me(Y, L),
	write("My recomendation is: "),
	write(L),
	write(", Hope you like it ;)").

identify_question(Question) :-
	(includes(Question, "are about");
	includes(Question, "be described")),
	write("What movie or subject are you talking about?"),nl,
	read(Y),
	((are_about(Y, _),findall(Z, are_about(Y,Z), L), write("This movie is about: "));
	(are_about(_, Y),findall(Z, are_about(Z,Y), L), write("I found a nice list of movies for you: "))),
	nl, 
	write(L).

identify_question(Question) :-
	(includes(Question, "director");
	includes(Question, "directed");
	includes(Question, "directs")),
	write("A directors question!!! Tell me the movie you want to know who is the director or the name of one director and i will tell which movies has his/her touch ;)"),nl,
	read(Y),
	((directed_by(Y, _),findall(Z, directed_by(Y,Z), L), write("Directed by: "));
	(directed_by(_, Y),findall(Z, directed_by(Z,Y), L),write("Found this movies from this director, gold list here: "))),
	nl,
	write(L).

identify_question(Question) :-
	(includes(Question, "acts");
	includes(Question, "did act");
	includes(Question, "actor");
	includes(Question, "actress");
	includes(Question, "starred")),
	write("An actors question!!! I love Meryl Streep, and you? Tell me a movie or actor/actress :)"),nl,
	read(Y),
	((has_starred(_, Y),findall(Z, has_starred(Z,Y), L), write("These are the movies that i found: "));
	(starred_actors(Y, L),write("These are the stars of this movie: "))),
	nl, 
	write(L).
	

hi :-
	write("Hello human, what do you want to know about movies?"),nl,
	read(Question),
	identify_question(Question).

ask :- hi.
hello :- hi.
