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

  def handle_call(:cars_on_track, _from, times) do
    {:reply, Map.keys(times), times}
  end

  def handle_call({:lap, car, time}, _from, times) do
    response =
      times
      |> Map.get(car)
      |> assess_time(time, fastest_overall(times))

    {
      :reply,
      response,
      Map.put(times, car, time)
    }
  end

  defp assess_time(_, time, nil) do
    # No previous fastest time
    {:fastest, time}
  end
  defp assess_time(_, time, fastest) when time < fastest do
    # Purple
    {:fastest, time}
  end
  defp assess_time(nil, time, _) do
    # Green (my first time)
    {:pb, time}
  end
  defp assess_time(prev_time, time, _) when time < prev_time do
    # Green (fastest so far)
    {:pb, time}
  end
  defp assess_time(_, time, _) do
    # Yellow :(
    {:normal, time}
  end

  defp fastest_overall(times) do
    times
    |> Enum.min_by(fn {_, v} -> v end)
    |> elem(1)
  end
end
