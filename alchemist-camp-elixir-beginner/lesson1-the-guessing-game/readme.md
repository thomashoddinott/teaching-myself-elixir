https://www.youtube.com/watch?v=G3JRv2dHU9A

```elixir
iex(1)> c "guessing_game.ex"
[GuessingGame]
iex(3)> # The number I'm thinking of is 45. We will search between 1 and 100.
nil
iex(4)> GuessingGame.guess 1, 100                                            
Hmm... maybe you're thinking of 50?
smaller
Hmm... maybe you're thinking of 25?
bgger
Type "bigger", "smaller", or "yes"
Hmm... maybe you're thinking of 25?
bigger
Hmm... maybe you're thinking of 37?
bigger
Hmm... maybe you're thinking of 43?
bigger
Hmm... maybe you're thinking of 46?
smaller
Hmm... maybe you're thinking of 44?
bigger
Hmm... maybe you're thinking of 45?
yes
"I knew I could guess your number!"
iex(5)>
```

