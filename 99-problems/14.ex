# Duplicate the elements of a list.
# Example:
# * (dupli '(a b c c d))
# (A A B B C C C C D D)
defmodule P14 do
  def dupli([]), do: []
  def dupli([x|xs]), do: [x|[x|dupli(xs)]]
end
