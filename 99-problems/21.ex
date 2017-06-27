# Insert an element at a given position into a list.
#
# Example:
#
# * (insert-at 'alfa '(a b c d) 2)
# (A ALFA B C D)
#

defmodule P21 do
  def insert_at(a, xs, n), do: do_insert_at(a, xs, [], n-1)

  defp do_insert_at(a, from, to, 0), do: to++[a|from]
  defp do_insert_at(_, [], to, _), do: to
  defp do_insert_at(a, [x|xs], to, n), do: do_insert_at(a, xs, to++[x], n-1)
end
