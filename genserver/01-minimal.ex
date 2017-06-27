defmodule GenMinimal do
  use GenServer

  # Starts a genserver (that won't do anything) and sets its initial state to
  # `1`. The `__MODULE__` is a shorthand for this entire module (`Minimal`),
  # which is needed so that the GenServer has access to all the functions
  # defined in here.
  #
  # The name `start_link` seems to be by convention, and because it the same as
  # what you call on the GenServer.
  def start_link do
    GenServer.start_link(__MODULE__, 1)
  end
end
