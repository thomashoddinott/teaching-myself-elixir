**Install Elixir on Windows**

Run PowerShell as administrator and install with chocolately: `choco install elixir`

https://chocolatey.org/packages/Elixir

**Running `iex`**

Ok, so `iex` is already an alias in PowerShell. 

Use `iex.bat` instead — sorted.

https://ppolyzos.com/2017/02/10/running-elixirs-interactive-shell-iex-in-powershell/

**Hello, World.**

```elixir
C:\Users\Thomas\git\teaching-myself-elixir [master +2 ~0 -0 !]> iex.bat
Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> c("hello-world.ex")
[HelloWorld]
iex(2)> HelloWorld.print
Hello, World.
:ok
iex(3)>
```