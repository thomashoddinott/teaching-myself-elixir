defmodule Tictac do
  alias Tictac.Square

  def check_player(player) do
    case player do
      :x      -> {:ok, player}
      :o      -> {:ok, player}
      _       -> {:error, :invalid_player}
    end
  end

  def place_piece(board, place, player) do
    case board[place] do
      nil       -> {:error, :invalid_location}
      :x        -> {:error, :occupied}
      :o        -> {:error, :occupied}
      :empty    -> {:ok, %{board | place => player}}
    end
  end

  def play_at(board, col, row, player) do
    with {:ok, valid_player}      <- check_player(player),
         {:ok, square}            <- Square.new(col, row),
         {:ok, new_board}         <- place_piece(board, square, valid_player),
    do: new_board
  end


end
