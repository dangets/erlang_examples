-module(shop2).
-export([
    buy/1,
    bulk_order/1
]).

price(_, Quantity) when Quantity =< 0 ->
    invalid_quantity;
price(_, Quantity) when erlang:is_float(Quantity) ->
    invalid_quantity;
price(bread, Quantity) ->
    10.0 * Quantity;
price(milk, Quantity) ->
    8.50 * Quantity;
price(beer, Quantity) ->
    34.50 * Quantity;
price(_, _) ->
    invalid_item.


buy({Item, Quantity}) ->
    {Item, Quantity, price(Item, Quantity)}.


bulk_order([{Item, Quantity} | Rest]) ->
    io:format("Processing ~p ~p~n", [Item, Quantity]),
    [buy({Item, Quantity}) | bulk_order(Rest)];
bulk_order([]) ->
    io:format("End of list~n", []),
    [];
bulk_order(_) ->
    io:format("Invalid list format~n", []),
    {error, invalid_list_format}.
