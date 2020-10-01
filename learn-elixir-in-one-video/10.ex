defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    #anom fn
    get_sum = fn (x, y) -> x + y end
    IO.puts "5 + 5 = #{get_sum.(5,5)}"

    #shorthand version for subtract fn
    get_less = &(&1 - &2)
    IO.puts "7 - 6 = #{get_less.(7,6)}"

    #multiple number params
    add_sum = fn
      {x, y} -> IO.puts "#{x} + #{y} = #{x + y}"
      {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x + y + z}"
    end
    add_sum.({1,2})
    add_sum.({1,2,3})

    IO.puts do_it()

  end

  #set default values - not an anom fn
  def do_it(x \\ 1, y \\ 1) do
    x + y
  end

end
