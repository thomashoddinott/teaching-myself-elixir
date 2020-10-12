[simple_todo.ex](./simple_todo.ex)

```powershell
iex(1)> l = TodoList.new
%{}     
iex(2)> l = add_entry(l, "09/10/2020", "my first entry")
%{"09/10/2020" => ["my first entry"]}
iex(3)> l = TodoList.add_entry(l, "09/10/2020", "my second entry")
%{"09/10/2020" => ["my second entry", "my first entry"]}
iex(4)> l = TodoList.add_entry(l, "02/10/2020", "my 0th entry")    
%{
  "02/10/2020" => ["my 0th entry"],
  "09/10/2020" => ["my second entry", "my first entry"]
}
iex(5)> TodoList.entries(l, "02/10/2020")
["my 0th entry"]
iex(6)> TodoList.entries(l, "09/10/2020")
["my second entry", "my first entry"]
```

We can abstract some stuff out into a new module and call it from another

[todo_multi_dict.ex](./todo_multi_dict.ex)

```powershell
iex(1)> l = TodoList.new()
%{}
iex(2)> l = TodoList.add_entry(l, "10/10/2010", "another entry")
%{"10/10/2010" => ["another entry"]}
iex(3)> TodoList.entries(l, "10/10/2010")
["another entry"]
```

Better still, lets represent entries as *maps*

[todo_entry_map.ex](./todo_entry_map.ex)

```powershell
iex(1)> todo_list = TodoList.new() |> TodoList.add_entry(%{date: ~D[2020-10-12], title: "Dentist"})
%{~D[2020-10-12] => [%{date: ~D[2020-10-12], title: "Dentist"}]}
iex(2)> TodoList.entries(todo_list, ~D[2020-10-12]) 
[%{date: ~D[2020-10-12], title: "Dentist"}]
```

The code is more verbose, but we're rewarded with better data retrieval.

**4.1.4 Abstracting with structs**   

When something has a well-defined structure, we can use a struct to specify and enforce data correctness.

For example, [fraction.ex](./fraction.ex)

```elixir
iex(5)> f1 = %Fraction{a: 1, b: 2}
%Fraction{a: 1, b: 2}
iex(6)> f2 = %Fraction{a: 2, b: 3}
%Fraction{a: 2, b: 3}
```

We can do pattern matching: 

```elixir
iex(7)> %Fraction{a: a, b: b} = f1
%Fraction{a: 1, b: 2}
iex(8)> a
1
iex(9)> b
2
```

And we can assert that we're really using a struct:

```elixir
iex(10)> %Fraction{} = f2
%Fraction{a: 2, b: 3}
iex(11)> %Fraction{} = %{a: 1, b: 2}
** (MatchError) no match of right hand side value: %{a: 1, b: 2}
```

Updating a struct works similarly to the way it works with maps:

```elixir
iex(11)> f3 = %Fraction{f1 | b: 4}
%Fraction{a: 1, b: 4}
```

