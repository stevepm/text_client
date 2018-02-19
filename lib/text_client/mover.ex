defmodule TextClient.Mover do
  alias TextClient.State

  def move(%State{guess: guess, game_service: game} = state) do
    tally = Hangman.make_move(game, guess)
    %{state | tally: tally}
  end
end
