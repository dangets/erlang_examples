-module(ring).
-export([
    start/0,
    stop/1,
    rpc/2
]).


start() -> spawn(fun loop/0).

stop(Pid) ->
    rpc(Pid, stop).


rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} -> Response
    end.


loop() ->
    receive
        {From, stop} ->
            From ! {self(), okay},
            void;

        % --------------------------
        {From, Any} ->
            io:format("Received: ~p~n", [Any]),
            From ! {self(), okay},
            loop();
        Any ->
            io:format("Received: ~p~n", [Any]),
            loop()
    end.

