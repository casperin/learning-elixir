defmodule GenHandleCall do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 1)
  end

  def init(data) do
    {:ok, data + 1} # State is set to 2
  end

  # Public function. The one we want to call when using this module.
  def get_state(pid) do
    GenServer.call(pid, {:get_state})
  end

  # Handles above call via pattern matching on :get_state.
  #
  # `handle_call` is synchronous or "blocking".
  #
  # The from is (I think) the pid of the caller, and the state is the current
  # state of the genserver.
  #
  # We respond with a :reply and the value that we want to return to the
  # caller, and an updated version of the state.
  def handle_call({:get_state}, _from, state) do
    {:reply, state, state}
  end
end

# Call this like this:
# {_, pid} = GenHandleCall.start_link()
# GenHandleCall.get_state(pid) # Should output 2
