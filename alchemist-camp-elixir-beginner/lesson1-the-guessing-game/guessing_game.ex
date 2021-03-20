defmodule GuessingGame do
  def guess(a, b) when a > b do
    guess(b, a)
  end
  # ^ guard against incorrect, i.e. guess(high, low) -> guess(low, high)

  # multi fn defs in Elixir - whichever one matches gets executed
  def guess(low, high) do
    answer = IO.gets "Hmm... maybe you're thinking of #{mid(low, high)}?\n"
    case String.trim(answer) do
      "bigger" -> bigger(low, high)
      "smaller" -> smaller(low, high)
      "yes" -> "I knew I could guess your number!"
      _ -> 
        IO.puts ~s(Type "bigger", "smaller", or "yes")
        guess(low, high)
      # _ = wildcard
      # ~s(hello world) = "hello world"

    end
  end
  
  def mid(low, high) do
    div low + high, 2
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end

end
