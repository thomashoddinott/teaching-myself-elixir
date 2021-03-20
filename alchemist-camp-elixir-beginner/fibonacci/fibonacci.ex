# https://gist.github.com/drincruz/7700681371eff71da8da706cf998dc85

defmodule Fibonacci do
  # Recursive
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)
end