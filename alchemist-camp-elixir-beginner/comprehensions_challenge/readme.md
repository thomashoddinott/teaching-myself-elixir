1. Use comprehensions to generate a deck or cards from lists of suits (**A**ce, **S**pades, **H**earts, **D**iamonds) and ranks (2-10, J, Q, K, A).

2. http://elixir-lang.github.io/getting-started/comprehensions.html

   experiment!

   e.g.

   ```elixir
   iex(1)> for a <- 1..10, b <- 1..10, a * b < 10, do: {a, b}
   [
     {1, 1},
     {1, 2},
     {1, 3},
     {1, 4},
     {1, 5},
     {1, 6},
     {1, 7},
     {1, 8},
     {1, 9},
     {2, 1},
     {2, 2},
     {2, 3},
     {2, 4},
     {3, 1},
     {3, 2},
     {3, 3},
     {4, 1},
     {4, 2},
     {5, 1},
     {6, 1},
     {7, 1},
     {8, 1},
     {9, 1}
   ]
   ```

   

