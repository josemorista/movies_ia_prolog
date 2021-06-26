# Movie Dialog dataset
## Autor: José Morista Carneiro da Silva

### Desenvolvimento

Para implementação do trabalho foi utilizado o compilador swi-prolog.

### Estrutura 

O projeto é dividido em dois arquivos, db.pl e fc.pl, o primeiro contém a base de fatos que serão utilizados pela inteligência para responder as perguntas do usuário. O segundo contém as funções extras para interação e resolução das perguntas informadas.

### Instruções de execução

Para executar os comandos disponíveis, devem ser carregados respectivamente os arquivos db.pl e fc.pl.
```

[db].
[fc].

```

### Interações disponíveis

Para iniciar uma interação com o agente utilize os comandos:

```
hi.
hello.
ask.
```

Em seguida, o agente imprime uma mensagem de boas vindas e realiza uma operação de leitura para identificar o assunto de sua pergunta. Assuntos disponíveis são: Diretores, atores, sugestões e descrições de filmes. O agente busca identificar por palavras comuns para inferir o assunto desejado. Exemplos de interações e perguntas para cada um dos temas são descritos abaixo:


```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "I want to know about what some movies are about".
AI: What movie or subject are you talking about?
Me: "dillinger".
AI: I found a nice list of movies for you: 
[Public Enemies]
```

```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "I want to know about what some movies are about".
AI: What movie or subject are you talking about?
Me: "Titanic".
This movie is about: 
[jean negulesco,leonardo dicaprio,love,love story,epic,kate winslet,tragedy,james cameron,disaster,shipwreck,titanic]
```

```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "About directors...".
AI: A directors question!!! Tell me the movie you want to know who is the director or the name of one director and i will tell which movies has his/her touch ;)
Me: "Avatar".
Directed by: 
[James Cameron]
```

```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "About directors...".
AI: A directors question!!! Tell me the movie you want to know who is the director or the name of one director and i will tell which movies has his/her touch ;)
Me: "James Cameron".
AI: Found this movies from this director, gold list here: 
[The Abyss,The Terminator,True Lies,Titanic,Aliens,Avatar]
```

```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "I want to tak about actors".
AI: An actors question!!! I love Meryl Streep, and you? Tell me a movie or actor/actress :)
Me: "Gene Kelly".
AI: These are the movies that i found: 
[Christmas Holiday,The Happy Road,The Three Musketeers,Take Me Out to the Ball Game,For Me and My Gal,Black Hand,The Pirate,Its Always Fair Weather,Thats Entertainment!,Anchors Aweigh,Les Girls,Xanadu,The Cross of Lorraine,Inherit the Wind,Summer Stock,Thats Entertainment, Part II,An American in Paris,Cover Girl,Singin in the Rain,Viva Knievel!,Marjorie Morningstar,On the Town,Brigadoon]
```

```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "I want to tak about actors".
AI: An actors question!!! I love Meryl Streep, and you? Tell me a movie or actor/actress :)
Me: "Gene Kelly".
AI: These are the movies that i found: 
[Christmas Holiday,The Happy Road,The Three Musketeers,Take Me Out to the Ball Game,For Me and My Gal,Black Hand,The Pirate,Its Always Fair Weather,Thats Entertainment!,Anchors Aweigh,Les Girls,Xanadu,The Cross of Lorraine,Inherit the Wind,Summer Stock,Thats Entertainment, Part II,An American in Paris,Cover Girl,Singin in the Rain,Viva Knievel!,Marjorie Morningstar,On the Town,Brigadoon]
```

```
Me: hi.
AI: Hello human, what do you want to know about movies?
Me: "I want to tak about actors".
AI: An actors question!!! I love Meryl Streep, and you? Tell me a movie or actor/actress :)
Me: "Brazil".
AI: These are the stars of this movie: 
[Robert De Niro,Ian Holm,Jonathan Pryce,Katherine Helmond]
```

```
Me: Hi.
AI: Hello human, what do you want to know about movies?
Me: "Can you give me a recomendation?".
AI: Tell me a list of movies you like and i will find the right movie for you!
Me: ["Titanic","Life of Pi"].
AI: My recomendation is: Slumdog Millionaire, Hope you like it ;)
```

Obs: Recomendações são feitas buscando filmes que tenham gêneros e assuntos em comum com os filmes presentes na lista fornecida.
