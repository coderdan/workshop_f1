defmodule F1.Drivers do
  alias __MODULE__.Driver
  alias F1.Repo
  import Ecto.Query

  def list do
    Repo.all(Driver)
  end

  def list(numbers: numbers) when is_list(numbers) do
    from(d in Driver, where: d.number in ^numbers) |> Repo.all
  end

  def find!(id) do
    Repo.get!(Driver, id)
  end
end
