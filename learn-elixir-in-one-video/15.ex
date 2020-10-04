defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    #concurrency

    spawn(fn() -> loop(5, 1) end)
    spawn(fn() -> loop(10, 5) end)

    #send(self(), {:french, "Jean-Luc"})
    send(self(), {:german, "Jurgen"})
    #send(self(), {:english, "Jerry"})
    receive do
      {:german, name} -> IO.puts "Guten tag #{name}"
      {:french, name} -> IO.puts "Bonjour #{name}"
      {:english, name} -> IO.puts "Hello #{name}"

    after
      500 -> IO.puts "Time up"
    end
  end

  def loop(0,_), do: nil
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num : #{max}"
      loop(max - 1, min)
    end
  end

end
