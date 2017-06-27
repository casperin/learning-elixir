# Drop every N'th element from a list.
# Example:
# * (drop '(a b c d e f g h i k) 3)
# (A B D E G H K)
defmodule P16 do
  def drop(_, n) when n < 2, do: []
  def drop([], _), do: []
  def drop([x|xs], n), do: drop_(xs, [x], n-1, n)

  defp drop_([], to, _, _), do: to
  defp drop_([_|xs], to, 1, n), do: drop_(xs, to, n, n)
  defp drop_([x|xs], to, c, n), do: drop_(xs, to++[x], c-1, n)
end
