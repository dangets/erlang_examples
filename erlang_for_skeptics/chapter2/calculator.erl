-module(calculator).
-export([subtract/2,
         add/2,
         add/1,
         multiply/2,
         divide/2
        ]).

%% Subtract two numbers %%%%%%%%%%%%%%
subtract(Num1, Num2) ->
    Num1 - Num2.

%% Add two numbers %%%%%%%%%%%%%%%%%%%
add(Num1, Num2) ->
    Num1 + Num2.

%% Add list of numbers %%%%%%%%%%%%%%%
add([Head | Rest]) ->
    Head + add(Rest);
add([]) ->
    0.

%% Multiply two numbers %%%%%%%%%%%%%%
multiply(Num1, Num2) ->
    Num1 * Num2.

%% Divide two numbers %%%%%%%%%%%%%%%%
%% By using a "guard"
%divide(Num1, Num2) when Num2 =/= 0 ->
%    Num1 / Num2;
%divide(Num1, Num2) ->
%    infinity.

%% By using pattern matching
divide(Num1, 0) ->
    infinity;
divide(Num1, Num2) ->
    Num1 / Num2.
