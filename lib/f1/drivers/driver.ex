defmodule F1.Drivers.Driver do
  use Ecto.Schema

  schema "drivers" do
    field :name
    field :number, :integer
  end
end
