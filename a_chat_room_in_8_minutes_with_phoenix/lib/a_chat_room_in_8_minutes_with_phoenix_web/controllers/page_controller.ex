defmodule AChatRoomIn8MinutesWithPhoenixWeb.PageController do
  use AChatRoomIn8MinutesWithPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
