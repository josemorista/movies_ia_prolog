is_member(_, []) :- false.
is_member(X, [H | Tail]) :- X = H; is_member(X, Tail).

has_starred(Actor, Movie) :- 
	starred_actors(Movie, Actors),
	is_member(Actor, Actors).


maxlist([],0, []).

maxlist([Head|Tail],Max, MaxEl) :-
    maxlist(Tail,TailMax, MaxEl),
		string_length(Head, Len),
    Len > TailMax,
		MaxEl is Head,
    Max is Head.

maxlist([Head|Tail],Max, MaxEl) :-
    maxlist(Tail,TailMax, MaxEl),
    string_length(Head, Len),
		Len =< TailMax,
		MaxEl is TailMax,
    Max is TailMax.

are_about(Search, Movie) :- 
	has_tags(Movie, Tags),
	is_member(Search, Tags).

includes(Str, SubString) :-
	sub_string(Str, _, _, _, SubString).

split_string_with_substring(String, Before, After, SubString) :-
  sub_string(String, Bef, _, Aft, SubString), !,
  sub_string(String, 0, Bef, _, NameString),
  atom_string(Before, NameString),
  sub_string(String, _, Aft, 0, After).

identify_question(Question, X) :-
	(includes(Question, "director");
	includes(Question, "directs")),
	includes(Question, Movie),
	directed_by(Movie, X).
	
identify_question(Question, X) :-
	(split_string_with_substring(Question, _, After, "are about");
	split_string_with_substring(Question, _, After, "be described")),
	findall(Y, (includes(After, Y),are_about(Y, _)), L),
	find_biggest(L, Y, 0),
	findall(Z, are_about(Y, Z), X).

identify_question(Question, X) :-
	(includes(Question, "acts");
	includes(Question, "did act");
	includes(Question, "starred")),
	findall(Y, (includes(Question, Y),has_starred(Y, _)), L),
	find_biggest(L, Y, 0),
	findall(Z, has_starred(Y, Z), X).

ask :-
	write("Hello human, what do you want to know about movies?"),nl,
	read(Question),
	includes(Question, "?"),
	identify_question(Question, X),
	write(X).
