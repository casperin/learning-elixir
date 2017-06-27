defmodule GenSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    # Child.start_link is called with no args, the empty list is an args list.
    children = [
      worker(ChildOne, []),
      worker(ChildTwo, [])
    ]

    # :one_for_one = one dies, it gets restarted
    # :one_for_all = one dies, all gets restarted
    # :rest_for_one = one dies, all children after it gets restarted
    # :simple_one_for_one = Used for multiple children of the same type
    supervise(children, strategy: :one_for_one)

    # Children can also be made with a restart strategy, like this:
    # worker(Child, [], restart: :permanent)
    # The options are:
    # * :permanent = Always restarts, even when shut down nicely. (default) 
    # * :transient = Only when crashing. If this is set, the below will not work.
    # * :temporary = Never restarts.
  end
end

# Nothing new here. Just need a few of these
defmodule ChildOne do
  use GenServer
  def start_link do
    IO.puts "One started"
    GenServer.start_link(__MODULE__, [])
  end
end

defmodule ChildTwo do
  use GenServer
  def start_link do
    IO.puts "Two started"
    GenServer.start_link(__MODULE__, [])
  end
end

# Playing with the above:
#
# iex(1)> {:ok, pid} = GenSupervisor.start_link
# One started
# Two started
# {:ok, #PID<0.93.0>}
# iex(2)> Process.alive?(pid)
# true
# iex(3)> [dos, uno] = Supervisor.which_children(pid)
# [{ChildTwo, #PID<0.95.0>, :worker, [ChildTwo]},
#  {ChildOne, #PID<0.94.0>, :worker, [ChildOne]}]
# iex(4)> [_, one_pid, _, _] = uno
# PID<0.94.0>
# iex(8)> Process.alive?(one_pid)
# true
# iex(9)> GenServer.stop(one_pid)
# One started
# :ok
# iex(10)> Process.alive?(one_pid)
# false
#
# We see the child process being started when we stopped it (simulating a
# crash); however the new process means it has a new pid; so checking on the
# old pid we will be told it is no longer alive.
