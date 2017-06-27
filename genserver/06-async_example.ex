defmodule GenAsyncEx do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, nil)
  end

  def take_this(pid, name), do: GenServer.cast(pid, {:handle, name})

  def handle_cast({:handle, n}, state) do
    :timer.sleep(500) # btw this (I think) is how you call an erlang process
    IO.puts("I got #{n}")
    {:noreply, state}
  end
end

defmodule GenAsyncExRun do
  def run do
    names = ["Alice", "Bob", "Carol", "Dan"]
    {:ok, pid} = GenAsyncEx.start_link()
    Enum.each(names, fn name ->
      IO.puts "Calling `take_this` with #{name}"
      GenAsyncEx.take_this(pid, name)
    end)
    IO.puts "Loop done"
  end
end

# Use like:
#
# iex(1)> GenAsyncExRun.run
# Calling `take_this` with Alice
# Calling `take_this` with Bob
# Calling `take_this` with Carol
# Calling `take_this` with Dan
# Loop done
# :ok
# I got Alice
# I got Bob
# I got Carol
# I got Dan
#
# The last four names pops up with 500ms intervals.
