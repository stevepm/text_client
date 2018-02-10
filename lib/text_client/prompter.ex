defmodule TextClient.Prompter do
  alias TextClient.State

  def accept_move(%State{} = state) do
    IO.gets("Your guess: ")
    |> check_input(state)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game ended: #{reason}")
    exit(:normal)
  end

  defp check_input(:eof, _) do
    IO.puts("Looks like you gave up...")
    exit(:normal)
  end

  defp check_input(input, state) do
    input = String.trim(input)

    cond do
      input =~ ~r/\A[a-z]\z/ ->
        %{state | guess: input}

      true ->
        IO.puts("Please enter a single lowercase letter")
        accept_move(state)
    end
  end
end
