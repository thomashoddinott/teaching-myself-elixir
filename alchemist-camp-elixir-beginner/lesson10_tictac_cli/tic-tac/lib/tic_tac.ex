defmodule TicTac do
  @moduledoc """
  Documentation for `TicTac`.
  """
  alias TicTac.Game

  def play(first_player), do: Game.start(first_player)
  def o, do: play(:o)
  def x, do: play(:x)
end
