https://www.youtube.com/watch?v=aWgVeT8sFmg

https://www.youtube.com/watch?v=-i1NBDrSWPU

```powershell
iex(1)> c "minimal_todo.ex"
[MinimalTodo]
iex(2)> import MinimalTodo
MinimalTodo
iex(3)> start
Would you like to create a new csv? (y/n)
n
Name of csv to load: todo.csv
Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
r
You have the following todos:

See doctor
Take out trash


Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
d
Which todo would you like to delete?
Take out trash
ok
"Take out trash" has been deleted.
Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
r
You have the following todos:

See doctor


Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
q
"Goodbye!"

---

iex(1)> c "minimal_todo.ex"
[MinimalTodo]
iex(2)> import MinimalTodo
MinimalTodo
iex(3)> start
Would you like to create a new csv? (y/n)
y
What data should each Todo have?
Enter field names one by one and an empty line when you're done.

Add field: date
Add field: rating
Add field:
Enter the name of the new todo: pizza
rating: 3
date: 12/03/2021
New todo "pizza" added.
Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
a
Enter the name of the new todo: pasta
date: 10/03/2021
rating: 4
New todo "pasta" added.
Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
r
You have the following todos:

pasta
pizza


Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
s
Name of csv to save: food.csv
CSV saved
Type the first letter of the command you want to run

R)ead Todos    A)dd a Todo    D)elete a Todo    L)oad a CSV    S)save a CSV
q
"Goodbye!"
iex(4)> ls
food.csv            minimal_todo.ex     readme.md           todo.csv
iex(5)>
```

