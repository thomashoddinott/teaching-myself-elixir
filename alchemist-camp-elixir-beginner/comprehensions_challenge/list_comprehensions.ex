defmodule ListComps do
  def MySol() do
    for suits <- ['Clubs', 'Spade', 'Heart', 'Diamond'],
        ranks <- ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King' ],
        do: {suits, ranks}
  end
end
