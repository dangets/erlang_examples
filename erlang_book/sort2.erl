% explicity importing at beginning
-module(sort2).
-import(lists1, [reverse/1]).
-export([reverse_sort/1, sort/1]).

reverse_sort(L) ->
    reverse(sort(L)).

sort(L) ->
    lists:sort(L).



%@export
%def reverse_sort(L):
%    return lists1.reverse(sort(L))
%
%@export
%def sort(L):
%    return lists.sort(L)
