defmodule F1Web.PageController do
  use F1Web, :controller
  alias F1.{Drivers, Session}

  def index(conn, _params) do
    timings = Session.timings()

    drivers_with_times =
      Drivers.list(numbers: Session.cars_on_track())
      |> Enum.map(fn %{number: number} = driver ->
        {driver, Map.get(timings, number)}
      end)

    conn
    |> assign(:drivers_with_times, drivers_with_times)
    |> render("index.html")
  end
end
