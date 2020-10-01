defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    #maps
    capitals = %{"Alabama" => "Montgomery",
                 "Alaska" => "Juneau",
                 "Arizona" => "Phoenix"
    }

    #need double quotes
    IO.puts "capital of Alaska is #{capitals["Alaska"]}"

    #using atoms instead
    capitals2 = %{alabama: "Montgomery",
                  alaska: "Juneau",
                  arizona: "Phoenix"
    }

    IO.puts "Capital of Arizona is #{capitals2.arizona}"

    capitals3 = Dict.put_new(capitals, "Arkansas", "Little Rock")


  end

end
