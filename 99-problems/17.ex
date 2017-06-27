# Split a list into two parts; the length of the first part is given.
# Do not use any predefined predicates.
# Example:
# * (split '(a b c d e f g h i k) 3)
# ( (A B C) (D E F G H I K))
defmodule P17 do
  def split(xs, n) when n < 1, do: [[], xs]
  def split(xs, n), do: split_(xs, [[], []], n)

  defp split_([], to, _), do: to
  defp split_([x|xs], [a, b], 0), do: split_(xs, [a, b++[x]], 0)
  defp split_([x|xs], [a, b], n), do: split_(xs, [a++[x], b], n-1)
end
