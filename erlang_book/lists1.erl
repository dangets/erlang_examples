-module(lists1).
-export([reverse/1]).

reverse(L) ->
    dg_shift_insert(L, []).

%reverse([Head|Tail], L) ->
%    reverse(Tail, [Head|L]);
%reverse([], L) ->
%    L.

dg_shift_insert([Head|Tail], L) ->
    dg_shift_insert(Tail, [Head|L]);
dg_shift_insert([], L) ->
    L.
