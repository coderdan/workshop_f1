defmodule F1Web.PageView do
  use F1Web, :view

  def driver_display(%{name: name, number: number}) do
    "[#{number}] #{name}"
  end

  def time_display(nil) do
    "NO TIME"
  end
  def time_display(time) do
    :io_lib.format("~*.*.0f~n", [7, 3, time])
    |> List.flatten
    |> List.to_string
    |> String.trim
  end
end
