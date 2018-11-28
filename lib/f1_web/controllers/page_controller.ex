defmodule F1Web.PageController do
  use F1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
