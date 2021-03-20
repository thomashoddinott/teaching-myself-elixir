filename = IO.gets("File to count the words from: ") |> String.trim # using the pipeline syntax
words = File.read!(filename) 
  |> String.split(~r{(\\n|[^\w'.])+}) 
  |> Enum.filter(fn x -> x != "" end) # filter away EOF newline

#IO.inspect words
words |> Enum.count() |> IO.puts()