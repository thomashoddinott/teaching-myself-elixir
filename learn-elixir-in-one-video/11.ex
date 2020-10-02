defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    #recursion

    IO.puts "Factorial of 3 : #{factorial(3)}"
    IO.puts "Factorial of 4 : #{factorial(4)}"

    IO.puts "Sum : #{sum([1,2,3])}"

    loop(5, 1)

  end

  #Enum module takes care of this
  def loop(0,_), do: nil
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num : #{max}"
      loop(max - 1, min)
    end
  end

  #like wise, use Enum.sum([...]) e.g. --> Enum.sum(1..10)
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def factorial(num) do
    if num <= 1 do
      1 #returns 1
    else
      result = num * factorial(num - 1)
      result #returns result
    end
  end

end
