-module(temp).
-export([convert/2]).

convert({fahrenheit, Temp}, celsius) ->
    {celsius, 5 * (Temp - 32) / 9};
convert({celsius, Temp}, fahrenheit) ->
    {farenheit, 32 + Temp * 9 / 5};
convert({reaumur, Temp}, celsius) ->
    {celsius, 10 * Temp / 8};
convert({celsius, Temp}, reaumur) ->
    {reaumur, 8 * Temp / 10};

% DG addition ---------------
convert({fahrenheit, Temp}, reaumur) ->
    Celsius = convert({fahrenheit, Temp}, celsius),
    %io:format("~w~n", [Celsius]),
    convert(Celsius, reaumur);
convert({reaumur, Temp}, fahrenheit) ->
    Celsius = convert({reaumur, Temp}, celsius),
    convert(Celsius, fahrenheit);
% ---------------------------

convert({X, _}, Y) ->
    {cannot, convert, X, to, Y}.

