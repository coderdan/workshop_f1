defmodule F1.Session do
  alias __MODULE__.Timing

  @spec start([integer()]) :: :ok | any()
  def start(cars) when is_list(cars) do
    with {:ok, _} <- Timing.start_link(cars) do
      :ok
    else
      {:error, {:already_started, _}} ->
        {:error, "Already Started"}
    end
  end

  def lap(car, time) do
    GenServer.call(Timing, {:lap, car, time})
  end

  def timings do
    GenServer.call(Timing, :timings)
  end

  def cars_on_track do
    GenServer.call(Timing, :cars_on_track)
  end

  def stop do
    GenServer.stop(Timing)
  end
end
