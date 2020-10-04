defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    #exception handling

    err = try do
      5 / 0 #force error
    rescue
      ArithmeticError -> "Can't divide by Zero"
    end
    IO.puts err



  end

end
