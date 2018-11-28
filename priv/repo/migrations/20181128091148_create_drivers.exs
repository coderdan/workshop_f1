defmodule F1.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table("drivers") do
      add :name, :string, null: false
      add :number, :integer, null: false
    end
  end
end
