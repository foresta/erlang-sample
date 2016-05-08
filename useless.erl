-module(useless).
-export([add/2, hello/0, greet_and_add_two/1, greet/2]).

-ifdef(DEBUG_MODE).
-define(DEBUG(S), io:format("dbg: "++S)).
-else.
-define(DEBUG(S), ok).
-endif.

add(A, B) ->
    A + B.

%% Shows greetings.
%%  io:format/1 is the standard function used to output text.
hello() ->
    Msg = "Hello, world!~n",
    ?DEBUG(Msg),
    io:format(Msg).

greet_and_add_two(X) ->
    hello(),
    add(X, 2).

greet(male, Name) ->
    io:format("Hello, Mr. ~s!~n", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!~n", [Name]);
greet(_, Name) ->
    io:format("Hello, ~s!~n", [Name]).
