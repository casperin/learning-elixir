defmodule GenHandleCast do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 1)
  end

  def get_state(pid) do
    GenServer.call(pid, {:get_state})
  end

  def handle_call({:get_state}, _from, state) do
    {:reply, state, state}
  end

  # This time we call `GenServer.cast` instead of call, and it is now magically
  # async, but can't return anything, so it just returns :ok
  def add_one(pid) do
    GenServer.cast(pid, {:add_one})
  end

  # Renamed no `handle_cast` that only takes two arguments, and only returns
  # two arguments in its return tuple.
  def handle_cast({:add_one}, state) do
    {:noreply, state + 1}
  end
end

# {_, pid} = GenHandleCall.start_link()
# GenHandleCall.get_state(pid) # 1
# GenHandleCall.add_one(pid) # :ok
# GenHandleCall.get_state(pid) # 2


