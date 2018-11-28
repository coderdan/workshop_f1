defmodule F1.Session do
  alias __MODULE__.Timing

  @spec start([integer()]) :: :ok | any()
  def start(cars) when is_list(cars) do
    with {:ok, _} <- Timing.start_link(cars),
      do: :ok
  end

  def lap(car, time) do
    GenServer.cast(Timing, {:lap, car, time})
    :ok
  end

  def timings do
    GenServer.call(Timing, :timings)
  end

  def stop do
    GenServer.stop(Timing)
  end
end
