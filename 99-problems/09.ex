# Pack consecutive duplicates of list elements into sublists. If a list
# contains repeated elements they should be placed in separate sublists.
# Example:
# * (pack '(a a a a b c c a a d e e e e))
# ((A A A A) (B) (C C) (A A) (D) (E E E E))
defmodule P09 do
  def pack([]), do: []
  def pack([x|xs]), do: pack_(xs, [], [x], x)

  # source depleted
  defp pack_([], to, next, _), do: to++[next]

  # The same, so we add it to `next`
  defp pack_([x|xs], to, next, x), do: pack_(xs, to, next++[x], x)

  # Different, so we add `next` to `to`, and make a new `next`
  defp pack_([x|xs], to, next, _), do: pack_(xs, to++[next], [x], x)
end
