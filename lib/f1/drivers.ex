defmodule F1.Drivers do
  alias __MODULE__.Driver
  alias F1.Repo

  def list do
    Repo.all(Driver)
  end

  def find!(id) do
    Repo.get!(Driver, id)
  end
end
