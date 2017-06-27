# Extract a given number of randomly selected elements from a list.
#
# Example:
#
# * (rnd-select '(a b c d e f g h) 3)
# (E D A)

defmodule P23 do
  def rnd_select(xs, n) when n >= 0, do: rnd(xs, [], n)

  defp rnd(_, to, 0), do: to
  defp rnd(xs, to, n), do: rnd(xs, [Enum.random(xs)|to], n-1)
end
