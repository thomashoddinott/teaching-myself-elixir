defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    l = 1..3
    dbl_list = for n <- l, do: n * 2
    IO.inspect dbl_list

    even_list = for n <- [1,2,3,4], rem(n,2) == 0, do: n
    IO.inspect even_list

  end

end
