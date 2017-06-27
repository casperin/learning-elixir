# Modified run-length encoding.
# Modify the result of problem 10 in such a way that if an element has no
# duplicates it is simply copied into the result list. Only elements with
# duplicates are transferred as (N E) lists. 
# Example:
# * (encode-modified '(a a a a b c c a a d e e e e))
# ((4 A) B (2 C) (2 A) D (4 E))
defmodule P11 do
  def encode([]), do: []
  def encode([x|xs]), do: enc(xs, [], {1, x})

  # source depleted
  defp enc([], to, next), do: to++[next]

  # The same, so we up the n of `next`
  defp enc([x|xs], to, {n, x}), do: enc(xs, to, {n+1, x})

  # Insert a special case where n = 1
  defp enc([x|xs], to, {1, y}), do: enc(xs, to++[y], {1, x})

  # Different, so we add `next` to `to`, and make a new `next`
  defp enc([x|xs], to, next), do: enc(xs, to++[next], {1, x})
end
