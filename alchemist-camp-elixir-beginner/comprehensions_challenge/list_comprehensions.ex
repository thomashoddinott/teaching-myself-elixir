defmodule ListComps do
  def my_sol() do
    for suits <- ['Club', 'Spade', 'Heart', 'Diamond'],
        ranks <- ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King' ],
        do: {suits, ranks}
  end
end
