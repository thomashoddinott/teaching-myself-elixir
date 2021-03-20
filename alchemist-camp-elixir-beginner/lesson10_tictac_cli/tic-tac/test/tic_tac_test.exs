defmodule TicTacTest do
  use ExUnit.Case
  doctest TicTac

  test "greets the world" do
    assert TicTac.hello() == :world
  end
end
