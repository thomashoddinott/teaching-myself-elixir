defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    list1 = [1,2,3]
    list2 = [4,5,6]

    list3 = list1 ++ list2
    IO.write("list3 = list1 ++ list2 : ")
    IO.inspect list3, charlists: :as_lists

    list4 = list3 -- list1
    IO.write("list4 = list3 -- list1: ")
    IO.inspect list4, charlists: :as_lists

    IO.puts("is 6 in list4? : #{6 in list4}")

    [head | tail] = list3
    IO.puts("Head : #{head}")
    ##write - no new line
    IO.write("Tail : ")
    IO.inspect(tail)

    #inspect prints internal representation - may return odd results!
    IO.inspect [97, 98], charlists: :as_lists

    IO.puts "Enumerate a list"
    Enum.each tail, fn item ->
      IO.puts item
    end

    IO.puts "Anotha one"
    words = ["Random", "words", "in", "a", "list"]
    Enum.each words, fn word ->
      IO.puts word
    end

    #try recursion
    display_list(words)

    #insert and delete stuff into a list - I though Elixir was immutable?
    IO.puts display_list(List.delete(words, "Random"))
    IO.puts display_list(List.delete_at(words, 1)) #or at an index
    IO.puts display_list(List.insert_at(words, 4, "yeah"))

    IO.puts List.first(words)
    IO.puts List.last(words)

    IO.puts display_list([])

    my_stats = [name: "Derek", height: 6.25]
    #IO.inspect my_stats, charlists: :as_lists
  end

  def display_list([word|words]) do
    IO.puts word
    display_list(words)
  end
  def display_list([]), do: IO.puts "--- nothing left see here!"
  #^ base case - in recursion you need to tell it when to stop!

end
