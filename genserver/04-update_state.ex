defmodule GenUpdateState do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 1)
  end

  def get_state(pid) do
    GenServer.call(pid, {:get_state})
  end

  # Added a function to add one to the state
  def add_one(pid) do
    GenServer.call(pid, {:add_one})
  end

  def handle_call({:get_state}, _from, state), do: {:reply, state, state}
  def handle_call({:add_one}, _from, state), do: {:reply, :ok, state + 1} # Its handler
end

# {_, pid} = GenHandleCall.start_link()
# GenHandleCall.get_state(pid) # 1
# GenHandleCall.add_one(pid) # :ok
# GenHandleCall.get_state(pid) # 2

