-module(shop).
-export([
    buy/2
]).

buy(Item, 0) ->
    io:format("You cannot buy zero of ~p~n", [Item]),
    {error, invalid_quantity};
buy(bread, Quantity) ->
    {bread, Quantity * 10.0};
buy(milk, Quantity) ->
    {milk, Quantity * 8.50};
buy(beer, Quantity) ->
    {beer, Quantity * 34.50};
buy(_, _) ->
    io:format("Sorry, we don't keep that.~n", []),
    {error, no_stock}.
