1. Use comprehensions to generate a deck or cards from lists of suits (**C**lubs, **S**pades, **H**earts, **D**iamonds) and ranks (2-10, J, Q, K, A).

   [my_sol()](https://github.com/thomashoddinott/teaching-myself-elixir/blob/bd0804204bb9c7327463095406e41d21d7e6eb7a/alchemist-camp-elixir-beginner/comprehensions_challenge/list_comprehensions.ex#L2):

   ```elixir
   iex(4)> ListComps.my_sol
   [
     {'Club', 'Ace'},  
     {'Club', 2},      
     {'Club', 3},      
     {'Club', 4},      
     {'Club', 5},      
     {'Club', 6},      
     {'Club', 7},      
     {'Club', 8},      
     {'Club', 9},      
     {'Club', 10},     
     {'Club', 'Jack'}, 
     {'Club', 'Queen'},
     {'Club', 'King'}, 
     {'Spade', 'Ace'}, 
     {'Spade', 2},     
     {'Spade', 3},
     {'Spade', 4},
     {'Spade', 5},
     {'Spade', 6},
     {'Spade', 7},
     {'Spade', 8},
     {'Spade', 9},
     {'Spade', 10},
     {'Spade', 'Jack'},
     {'Spade', 'Queen'},
     {'Spade', 'King'},
     {'Heart', 'Ace'},
     {'Heart', 2},
     {'Heart', 3},
     {'Heart', 4},
     {'Heart', 5},
     {'Heart', 6},
     {'Heart', 7},
     {'Heart', 8},
     {'Heart', 9},
     {'Heart', 10},
     {'Heart', 'Jack'},
     {'Heart', 'Queen'},
     {'Heart', 'King'},
     {'Diamond', 'Ace'},
     {'Diamond', 2},
     {'Diamond', 3},
     {'Diamond', 4},
     {'Diamond', 5},
     {'Diamond', 6},
     {'Diamond', 7},
     {'Diamond', 8},
     {'Diamond', 9},
     {'Diamond', ...},
     {...},
     ...
   ]
   iex(5)>
   ```

   **solution: https://www.youtube.com/watch?v=YP9aQxpglbs**

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

   

