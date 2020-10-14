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

Again, we can abstract away our struct:

```elixir
def new(a, b) do
	%Fraction{a: a, b: b}
end
```

So the client doesn't even have to know it's there!

Testing Fraction.add/2:

```elixir
iex(2)> Fraction.add(Fraction.new(1,2), Fraction.new(1,4)) |> Fraction.value()
0.75
```

**Structs vs. Maps**

Structs are really just maps. But, a struct is a functional abstraction and should therefore behave according to the implementation of the module where it's defined. 

e.g.

```elixir
iex(1)> f1 = Fraction.new(1,10)
%Fraction{a: 1, b: 10}
iex(2)> Enum.to_list(f1)
** (Protocol.UndefinedError) protocol Enumerable not implemented for %Fraction{a: 1, b: 10} of type Fraction (a struct)
# ^ because fraction is not enumerable, we cannot convert use Enum.to_list
iex(2)> Enum.to_list(%{a: 1, b: 10})
[a: 1, b: 10]
# ^ however we can pass in an ordinary map to Enum.to_list
iex(3)> Map.to_list(f1)
[__struct__: Fraction, a: 1, b: 10]
# ^ if we use Map.to_list instead, we can pass in our struct (which is just a map)
```

in addition: 

```elixir
iex(4)> %Fraction{} = %{a: 1, b: 2}
** (MatchError) no match of right hand side value: %{a: 1, b: 2}
# ^ a struct can't match a map
iex(4)> %{a: a, b: b} = %Fraction{a: 1, b: 2}
%Fraction{a: 1, b: 2}
iex(5)> a
1
iex(6)> b
2
# ^ but a plain map pattern can match a struct
```

Another way to structure data is with [Records](https://hexdocs.pm/elixir/Record.html):

```elixir
iex(7)> require Record
Record
iex(8)> Record.is_record({User, "john", 27})
true
```

Records are mostly present for historical reasons. You may need to access or interface with them, but they won't be explained in this book.

**4.1.5 Data Transparency**

Data in Elixir is always transparent. Clients can read any information from your structs (and any other data type). In that sense, [encapsulation](https://www.google.com/search?client=firefox-b-d&q=encapsulation+OO) works differently than in typical OO languages. In Elixir, modules are in charge of abstracting the data and providing operations to manipulate and query that data, but the data is never hidden. 

_$ iex todo_entry_map.ex_:

```elixir
iex(1)> todo_list = TodoList.new() |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
%{~D[2018-12-19] => [%{date: ~D[2018-12-19], title: "Dentist"}]}
```

Automatically, we see the to-do list is powered by a map and we see how the individual entries are kept.

*skipping section on mapsets*

**4.2 Working with hierarchical data**

We'll extend the TodoList to to provide basic CRUD support. We already did the C and R parts with add_entry/3 and entries/1, respectively.

**4.2.1**

We need to uniquely identify entries, so let's attach a unique ID to each.

*$ iex [todo_crud.ex](./todo_crud.ex)*

```elixir
iex(1)> todo_list = TodoList.new() |>
...(1)> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"}) |>
...(1)> TodoList.add_entry(%{date: ~D[2018-12-20], title: "Shopping"}) |>
...(1)> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Movies"})
%TodoList{
  auto_id: 4,
  entries: %{
    1 => %{date: ~D[2018-12-19], id: 1, title: "Dentist"},
    2 => %{date: ~D[2018-12-20], id: 2, title: "Shopping"},
    3 => %{date: ~D[2018-12-19], id: 3, title: "Movies"}
  }
}
iex(2)> TodoList.entries(todo_list, ~D[2018-12-19])
[
  %{date: ~D[2018-12-19], id: 1, title: "Dentist"},
  %{date: ~D[2018-12-19], id: 3, title: "Movies"}
]
```

**Updating entries**

??? - check forum post for any help

**Deleting entries**

```elixir
iex(1)> todo_list = TodoList.new() |> TodoList.add_entry(%{date: ~D[2018-12-19], title: "Dentist"})
%TodoList{
  auto_id: 2,
  entries: %{1 => %{date: ~D[2018-12-19], id: 1, title: "Dentist"}}
}
iex(2)> TodoList.delete_entry(todo_list, 1)
%TodoList{auto_id: 2, entries: %{}}
```





*todo - get vscode elixir extensions properly set up before proceeding - see Trello card*



