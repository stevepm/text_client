defmodule TextClient.Summary do
  def display(%TextClient.State{tally: tally} = state) do
    IO.puts([
      "\n",
      "Word so far: #{Enum.join(tally.letters, " ")}\n",
      "Guesses left: #{tally.turns_left}\n"
    ])

    state
  end
end
