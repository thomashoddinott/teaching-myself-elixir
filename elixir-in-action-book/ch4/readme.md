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