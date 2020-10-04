defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    l = 1..3
    #enumerables
    IO.puts "Even List :
      #{
        Enum.all?(l,
        fn(n) -> rem(n, 2) == 0 end)
      }
      "

    Enum.each(l, fn(n) -> IO.puts n end)

    double_list = Enum.map(l, fn(n) -> n * 2 end)
    IO.inspect double_list

    sum_values = Enum.reduce(l, fn(n, sum) -> n + sum end)
    IO.puts "Sum : #{sum_values}"

    IO.inspect Enum.uniq([1,2,2])
  end

end
