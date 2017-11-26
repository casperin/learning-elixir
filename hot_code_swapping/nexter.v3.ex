defmodule Nexter do
  use GenServer

  @vsn "3"

  def start_link(msg) do
    GenServer.start_link __MODULE__, {0, msg}
  end

  def next(pid, msg) do
    GenServer.call(pid, {:next, msg})
  end

  def handle_call({:next, msg}, _from, {n, prev_msg}) do
    new_state = {n + 1, msg}
    {:reply, "here: #{n}. Prev person said #{prev_msg}", new_state}
  end

  def code_change("2", n, _extra) do
    new_state = {n, "nothing"}
    {:ok, new_state}
  end
end
