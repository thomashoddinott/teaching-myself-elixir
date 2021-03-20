defmodule Tictac.Square do
  alias __MODULE__
  @enforce_keys [:row, :col]
  defstruct [:row, :col]

  @board_size 1..3

  def new(col, row) when col in @board_size and row in @board_size do
    {:ok, %Square{row: row, col: col}}
  end
  def new(_row, _col), do: {:error, :invalid_square}

  def new_board() do
    for s <- squares(), into: %{}, do: {s, :empty}
  end

  def squares do
    for c <- @board_size, r <- @board_size, into: MapSet.new(), do: %Square{col: c, row: r}
  end
end
