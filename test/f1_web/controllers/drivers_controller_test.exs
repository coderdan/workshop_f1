defmodule F1Web.DriversControllerTest do
  use F1Web.ConnCase

  alias F1.Repo
  alias F1.Drivers.Driver

  describe "GET /api/drivers/:id" do
    setup do
      # TODO: ExMachina and put its own seeds
      {:ok, driver} = Repo.insert(%Driver{name: "Mick", number: 1})
      [driver: driver]
    end

    test "GET /", %{conn: conn, driver: %{id: id}} do
      conn = get(conn, "/api/drivers/#{id}")
      assert json_response(conn, 200) == %{"name" => "Mick", "number" => 1}
    end
  end
end
