defmodule F1.Drivers do
  alias __MODULE__.Driver
  alias F1.Repo

  def list do
    Repo.all(Driver)
  end
end
