defmodule F1Web.SessionChannel do
  use Phoenix.Channel

  def join("session:current", _message, socket) do
    {:ok, socket}
  end

  def handle_in("lap", data, socket) do
    broadcast!(socket, "lap", data)
    {:noreply, socket}
  end
end
