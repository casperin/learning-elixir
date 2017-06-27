# Run-length encoding of a list. Use the result of problem P09 to implement the
# so-called run-length encoding data compression method. Consecutive duplicates
# of elements are encoded as lists (N E) where N is the number of duplicates of
# the element E.
# Example:
# * (encode '(a a a a b c c a a d e e e e))
# ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))
defmodule P10 do
  def encode([]), do: []
  def encode([x|xs]), do: enc(xs, [], {1, x})

  # source depleted
  defp enc([], to, next), do: to++[next]

  # The same, so we up the n of `next`
  defp enc([x|xs], to, {n, x}), do: enc(xs, to, {n+1, x})

  # Different, so we add `next` to `to`, and make a new `next`
  defp enc([x|xs], to, next), do: enc(xs, to++[next], {1, x})
end
