defmodule F1.Drivers.Driver do
  use Ecto.Schema
  @derive {Jason.Encoder, only: [:name, :number]}

  schema "drivers" do
    field :name
    field :number, :integer
  end
end
