is_member(_, []) :- false.
is_member(X, [H | Tail]) :- X = H; is_member(X, Tail).

has_starred(Actor, Movie) :- 
	starred_actors(Movie, Actors),
	is_member(Actor, Actors).

are_about(Search, Movie) :- 
	has_tags(Movie, Tags),
	is_member(Search, Tags).
	
be_described_by(X, Movie) :-
	are_about(X, Movie);
	has_starred(X, Movie);
	directed_by(X, Movie).

identify_question(Question) :-
	split_string(Question, "\s", "\s", L),
	is_member("directed", L),
	write('A question about directors, nice!').