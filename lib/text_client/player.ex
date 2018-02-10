defmodule TextClient.Player do
  alias TextClient.{State, Summary, Prompter, Mover}

  def play(%State{
        tally: %{
          game_state: :won
        }
      }) do
    exit_with_message("You WON!")
  end

  def play(%State{
        tally: %{
          game_state: :lost
        }
      }) do
    exit_with_message("You LOST!")
  end

  def play(
        %State{
          tally: %{
            game_state: :good_guess
          }
        } = state
      ) do
    continue_with_message(state, "Good guess!")
  end

  def play(
        %State{
          tally: %{
            game_state: :bad_guess
          }
        } = state
      ) do
    continue_with_message(state, "Sorry, that isn't in the word.")
  end

  def play(
        %State{
          tally: %{
            game_state: :already_used
          }
        } = state
      ) do
    continue_with_message(state, "You've already used that letter.")
  end

  def play(%State{} = state) do
    continue(state)
  end

  defp continue_with_message(state, message) do
    IO.puts(message)
    continue(state)
  end

  defp continue(%State{} = state) do
    state
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.move()
    |> play()
  end

  defp exit_with_message(message) do
    IO.puts(message)
    exit(:normal)
  end
end
