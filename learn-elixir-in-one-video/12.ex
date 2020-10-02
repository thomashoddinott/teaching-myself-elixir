defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do

    IO.puts "Even List : #{Enum.all?[1,2,3]}"

  end

end
