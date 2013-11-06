-module(rpsgame).
-export([play/1]).

%% Play a game of rock-paper-scissors
play(PlayerChoice) ->
    case lists:member(PlayerChoice, possible_choices()) of
        true ->
            ComputerChoice = get_computer_choice(),
            Result = get_result(PlayerChoice, ComputerChoice),
            {Result, {player, PlayerChoice}, {computer, ComputerChoice}};
        false ->
            {error, invalid_attack}
    end.

possible_choices() ->
    [rock, paper, scissors].

get_computer_choice() ->
    Choices = possible_choices(),
    %% Get an index position at random
    Index = random:uniform(length(Choices)),
    %% Pull out an attack
    lists:nth(Index, Choices).

%% Determine outcome of the game
get_result(PlayerChoice, ComputerChoice) ->
    case {PlayerChoice, ComputerChoice} of
        {rock, scissors} -> win;
        {paper, rock} -> win;
        {scissors, paper} -> win;
        {Same, Same} -> draw;
        {_, _} -> lose
    end.
