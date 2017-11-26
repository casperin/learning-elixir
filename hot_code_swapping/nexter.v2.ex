defmodule Nexter do
  use GenServer

  @vsn "2"

  def start_link do
    GenServer.start_link __MODULE__, 0
  end

  def next(pid) do
    GenServer.call(pid, :next)
  end

  def handle_call(:next, _from, n) do
    {:reply, "here: #{n}", n + 1}
  end
end
