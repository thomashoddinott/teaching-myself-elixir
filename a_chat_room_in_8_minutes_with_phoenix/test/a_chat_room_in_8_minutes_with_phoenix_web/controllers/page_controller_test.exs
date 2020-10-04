defmodule AChatRoomIn8MinutesWithPhoenixWeb.PageControllerTest do
  use AChatRoomIn8MinutesWithPhoenixWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
