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

  @doc """
  Call with:

  ```
  curl -v -H "Content-Type: application/json" -d '{"car" : 44, "time" : 1.32}' http://localhost:4000/api/sessions/lap
  ```
  """
  def lap(conn, %{"car" => car, "time" => time}) when is_float(time) do
    {status, _time} = Session.lap(car, time)
    F1Web.Endpoint.broadcast!("session:current", "lap", %{car: car, time: time, status: status})
    resp(conn, 200, "OK")
  end
  def lap(conn, _) do
    resp(conn, 400, "Invalid time")
  end
end
