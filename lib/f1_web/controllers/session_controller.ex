defmodule F1Web.SessionController do
  use F1Web, :controller
  alias F1.{Drivers, Session}

  def start(conn, _) do
    cars = for %{number: number} <- Drivers.list(), do: number

    with :ok <- Session.start(cars) do
      resp(conn, 200, "Started")
    else
      {:error, message} ->
        resp(conn, 400, message)
    end
  end
end
