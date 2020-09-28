defmodule M do
  def main do
    do_stuff()
  end

    def do_stuff do
      #strings
      my_str = "Lorem ipsum"
      IO.puts "Length : #{String.length(my_str)}"

      #concat strings
      longer_str = my_str <> " " <> "is longer"
      IO.puts "#{longer_str}"

      #compare strings
      IO.puts "Equal : #{"Egg" === "egg"}" #test equality + data type
    
      #String contains...?
      IO.puts "My ? #{String.contains?(my_str, "Lorem")}"

      #Return first char
      IO.puts "First : #{String.first(my_str)}"

      #or at any index...
      IO.puts "Index 4 : #{String.at(my_str, 4)}"

      #substrings
      IO.puts "Substring : #{String.slice(my_str, 3, 8)}"

      #split string into list
      IO.inspect String.split(longer_str, " ")
      #prints internal representation of a value

      #reverse a string
      IO.puts String.reverse(longer_str)
      #uppercase
      IO.puts String.upcase(longer_str)
      #lowercase
      IO.puts String.downcase(longer_str)
      #capitalise
      IO.puts String.capitalize(longer_str)

      #pipe operator
      4 * 10 |> IO.puts #e.g. pass onto IO.puts (print)
      #or any other function
      #Elixir is functional!

    end
end
