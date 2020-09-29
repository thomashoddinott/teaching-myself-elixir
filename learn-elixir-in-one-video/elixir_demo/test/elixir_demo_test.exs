defmodule ElixirDemoTest do
  use ExUnit.Case
  doctest ElixirDemo

  test "greets the world" do
    assert ElixirDemo.hello() == :world
  end
end
