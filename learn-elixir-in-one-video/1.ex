defmodule M do
  def main do
    data_stuff()
  end

    def data_stuff do
      ##some data types
      my_int = 123
      IO.puts "Integer? - #{is_integer(my_int)}!"
      my_float = 123.123
      IO.puts "Integer? - #{is_float(my_float)}!"
      #is_string, etc...

      #Atoms
      IO.puts "Atom? - #{is_atom(:Portsmouth)}!"
      #spaces work fine in atoms - :"New York"

      #ranges
      one_to_ten = 1..10
    end
end
