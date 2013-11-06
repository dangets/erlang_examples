-module(area_server0).
-export([loop/0]).

loop() ->
    receive
        {rectangle, Width, Height} ->
            io:format("Area of rectangle is ~p~n", [Width * Height]),
            loop();
        {circle, Radius} ->
            io:format("Area of circle is ~p~n", [3.14159 * Radius * Radius]),
            loop();
        Other ->
            io:format("I don't know what the area of a ~p is~n", [Other]),
            loop()
    end.

