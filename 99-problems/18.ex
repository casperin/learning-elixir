# Extract a slice from a list.
# Given two indices, i and k, the slice is the list containing the elements
# between the i'th and k'th element of the original list (both limits
# included). Start counting the elements with 1.
# Example:
# * (slice '(a b c d e f g h i k) 3 7)
# (C D E F G)
defmodule P18 do
  def slice(xs, _, m) when m < 1, do: xs
  def slice(_, n, m) when n >= m, do: []
  def slice([], _, _), do: []
  def slice(xs, n, m) when n < 2, do: take(xs, m)
  def slice([_|xs], n, m), do: slice(xs, n-1, m-1)

  defp take(_, 0), do: []
  defp take([], _), do: []
  defp take([x|xs], m), do: [x]++take(xs, m-1)
end
