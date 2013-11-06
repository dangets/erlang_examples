-module(recursion).
-export([
    len/1,
    tail_len/1,
    fac/1,
    tail_fac/1
]).

%%%%%%%%%%%%%%%%%%%%%%%
len([]) ->
    0;
len([_|T]) ->
    len(T) + 1.


tail_len(L) ->
    tail_len(L, 0).

tail_len([], Acc) ->
    Acc;
tail_len([_|T], Acc) ->
    tail_len(T, Acc+1).
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%
fac(0) ->
    1;
fac(N) ->
    N * fac(N - 1).


tail_fac(N) when N > 0 ->
    tail_fac(N, 1).

tail_fac(1, Acc) ->
    Acc;
tail_fac(N, Acc) ->
    tail_fac(N-1, Acc*N).
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%
duplicate(0, _) ->
    [];
duplicate(N, Term) when N > 0 ->
    [Term | duplicate(N-1, Term)].


tail_duplicate(N, Term) ->
    tail_duplicate(N, Term, []).

tail_duplicate(0, _, List) ->
    List.
tail_duplicate(N, Term, List) when N > 0 ->
    tail_duplicate(N-1, Term, [Term|List]).
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%
reverse([]) ->
    [];
reverse([H|T]) ->
    [reverse(T)|H].


tail_reverse(List) ->
    tail_reverse(List, []).

tail_reverse([], Acc) ->
    Acc;
tail_reverse([H|T], Acc) ->
    tail_reverse(T, [H|Acc]).
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%
sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 ->
    [H|sublist(T, N-1)];


tail_sublist(List, N) when N >= 0 ->
    tail_reverse(tail_sublist(List, N, [])).

tail_sublist([], _, Acc) ->
    Acc;
tail_sublist(_, 0, Acc) ->
    Acc;
tail_sublist([H|T], N, Acc) ->
    tail_sublist(T, N-1, [H|Acc]).
