defmodule Square do
  @board_size Board.size()
  @max_pos Board.max_pos()

  @enforce_keys [:pos]
  defstruct [:x, :y, :val, :pos]

  def is_empty?(%Square{val: v}), do: !v

  def new(pos) when pos in 1..@max_pos do
    %Square{pos: pos, y: y(pos), x: x(pos)}
  end

  def x(pos), do: rem(pos - 1, @board_size) + 1
  def y(pos), do: div(pos - 1, @board_size) + 1

  def update_at(squares, pos, value) do
    Enum.map(squares, fn square ->
      if square.pos == pos do
        %Square{square | val: value}
      else
        square
      end
    end)
  end
end
