# Create a list containing all integers within a given range.
#
# Example:
#
# * (range 4 9)
# (4 5 6 7 8 9)

defmodule P22 do
  def range(n, m) when n <= m, do: do_range([], n, m)

  defp do_range(xs, n, n), do: [n|xs]
  defp do_range(xs, n, m), do: do_range([m|xs], n, m-1)
end
