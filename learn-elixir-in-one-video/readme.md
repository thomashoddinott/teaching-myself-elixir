https://www.youtube.com/watch?v=pBNOavRoNL0

A nice easy one to start off [0.ex](./0.ex):

```powershell
C:\Users\Thomas\git\teaching-myself-elixir\learn-elixir-in-one-video [master 
≡ +1 ~0 -0 !]> iex.bat
Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> c("0.ex")
[M]
iex(2)> M.main
What is your name? Thomas
Hello Thomas
:ok
iex(3)>
```

Some datatypes [1.ex](./1.ex):

```powershell
C:\Users\Thomas\git\teaching-myself-elixir\learn-elixir-in-one-video [master ≡ +1 ~0 -0 !]> iex.bat
Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> c("1.ex")
warning: variable "one_to_ten" is unused (if the variable is not meant to be used, prefix it with an underscore)
  1.ex:19: M.data_stuff/0

[M]
iex(2)> M.main
Integer? - true!
Integer? - true!
Atom? - true!   
1..10
iex(3)>	
```

Strings [2.ex](./2.ex):

```powearshell
iex(14)> c("2.ex")
warning: redefining module M (current version defined in memory)
  2.ex:1

[M]
iex(15)> M.main
Length : 11
Lorem ipsum is longer
Equal : false
My ? true
First : L
Index 4 : m
Substring : em ipsum
["Lorem", "ipsum", "is", "longer"]
regnol si muspi meroL
LOREM IPSUM IS LONGER
lorem ipsum is longer
Lorem ipsum is longer
40
:ok
iex(16)>
```

Some math [3.ex](./3.ex)

```powershell
iex(4)> M.main
5 + 4 = 9
5 - 4 = 1
5 * 4 = 20
5 / 4 = 1.25
5 div 4 = 1
5 rem 4 = 1
:ok
iex(5)>
```

Comparison and logical operators [4.ex](./4.ex)

```
iex(8)> M.main    
4 == 4.0 : true
4 === 4.0 : false
4 != 4.0 : false
4 !== 4.0 : true
5 > 4 : true
5 >= 4 : true
5 < 4 : false
5 <= 4 : false
Vote & Drive : false
Vote OR Drive : true
false
:ok
iex(9)>
```

Decision making [5.ex](./5.ex)

```powershell
iex(14)> M.main    
Can't Vote
You're not 18
You can drive
Entered 2
Ternary : Can't Vote
:ok
iex(15)>
```

Tuples [6.ex](./6.ex)

```powershell
iex(4)> M.main
Tuple : true
Age : 42
Size : 4
Weight : 175
:ok
iex(5)>
```

Lists [7.ex](./7.ex)

```powershell
...
```

