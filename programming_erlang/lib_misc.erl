-module(lib_misc).
-export([
        pythag/1
    ]).

%% Generate a list of triplets {A, B, C}
%% where A^2 + B^2 = C^2 and A + B + C < N
pythag(N) ->
    [
        {A, B, C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(1, N),
        C <- lists:seq(1, N),
        A + B + C < N,
        A*A + B*B =:= C*C
    ].


%% find all permutations of a list
perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].


% simple sqrt wrapper to give better error on negative input
sqrt(X) when X < 0 ->
    erlang:error({squareRootNegativeArgument, X});
sqrt(X) ->
    math:sqrt(X).


sleep(T) ->
    receive
    after T ->
            true
    end.


flush_buffer() ->
    receive
        _Any ->
            flush_buffer()
    after 0 ->
        true
    end.


priority_receive() ->
    receive
        {alarm, X} -> {alarm, X}
    after 0
        receive
            Any -> Any
        end
    end.


