defmodule F1.Session.Timing do
  use GenServer

  def start_link(cars) do
    GenServer.start_link(__MODULE__, [cars: cars], name: __MODULE__)
  end

  def init(cars: cars) do
    times = for c <- cars, do: {c, nil}, into: %{}
    {:ok, times}
  end

  def handle_call(:timings, _from, times) do
    {:reply, times, times}
  end

  def handle_cast({:lap, car, time}, times) do
    {:noreply, record_time(times, car, time)}
  end

  defp record_time(times, car, time) do
    case Map.fetch(times, car) do
      {:ok, pb} ->
        if time < pb or pb == nil do
          Map.put(times, car, time)
        else
          times
        end

      :error ->
        # Ignore any cars that are
        # not in the session
        times
    end
  end
end
