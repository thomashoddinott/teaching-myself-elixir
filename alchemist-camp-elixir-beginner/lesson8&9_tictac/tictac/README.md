https://www.youtube.com/watch?v=jLC2Aw5xBs8

https://www.youtube.com/watch?v=elBAk6iZ2fc (didn't complete)

```elixir
iex(2)> Tictac.squares
#MapSet<[
  %Square{col: 1, row: 1},
  %Square{col: 1, row: 2},
  %Square{col: 1, row: 3},
  %Square{col: 2, row: 1},
  %Square{col: 2, row: 2},
  %Square{col: 2, row: 3},
  %Square{col: 3, row: 1},
  %Square{col: 3, row: 2},
  %Square{col: 3, row: 3}
]>
```

```elixir
iex(3)> import Tictac
Tictac
iex(4)> gb = new_board
%{
  %Square{col: 1, row: 1} => :empty,
  %Square{col: 1, row: 2} => :empty,
  %Square{col: 1, row: 3} => :empty,
  %Square{col: 2, row: 1} => :empty,
  %Square{col: 2, row: 2} => :empty,
  %Square{col: 2, row: 3} => :empty,
  %Square{col: 3, row: 1} => :empty,
  %Square{col: 3, row: 2} => :empty,
  %Square{col: 3, row: 3} => :empty
}
iex(5)> gb |> play_at(1, 1, :x)
%{
  %Square{col: 1, row: 1} => :x,
  %Square{col: 1, row: 2} => :empty,
  %Square{col: 1, row: 3} => :empty,
  %Square{col: 2, row: 1} => :empty,
  %Square{col: 2, row: 2} => :empty,
  %Square{col: 2, row: 3} => :empty,
  %Square{col: 3, row: 1} => :empty,
  %Square{col: 3, row: 2} => :empty,
  %Square{col: 3, row: 3} => :empty
}
iex(6)> gb = gb |> play_at(1, 1, :x) 
%{
  %Square{col: 1, row: 1} => :x,
  %Square{col: 1, row: 2} => :empty,
  %Square{col: 1, row: 3} => :empty,
  %Square{col: 2, row: 1} => :empty,
  %Square{col: 2, row: 2} => :empty,
  %Square{col: 2, row: 3} => :empty,
  %Square{col: 3, row: 1} => :empty,
  %Square{col: 3, row: 2} => :empty,
  %Square{col: 3, row: 3} => :empty
}
iex(7)> gb = gb |> play_at(1, 1, :x)
{:error, :occupied}
iex(8)> gb = gb |> play_at(1, 4, :x) 
{:error, :invalid_square}
iex(9)> gb = gb |> play_at(1, 3, :t) 
{:error, :invalid_player}
```

use `recompile` when in an `iex -S mix` session to recompile everything



