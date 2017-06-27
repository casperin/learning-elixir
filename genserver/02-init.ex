defmodule GenInit do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 1)
  end

  # If we add this function, we can modify whatever the initial state that the
  # genserver starts with. It will now be 2 (I believe).
  def init(data) do
    {:ok, data + 1}
  end
end
