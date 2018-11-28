defmodule F1Web.DriversController do
  use F1Web, :controller
  alias F1.Drivers

  def show(conn, %{"id" => id}) do
    body =
      Drivers.find!(id)
      |> Jason.encode!

    conn
    |> put_resp_header("content-type", "application/json")
    |> resp(200, body)
  end
end
