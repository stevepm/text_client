defmodule TextClient.Mover do
  alias TextClient.State

  def move(%State{guess: guess, game_service: game} = state) do
    {new_game, new_tally} = Hangman.make_move(game, guess)
    %{state | game_service: new_game, tally: new_tally}
  end
end
