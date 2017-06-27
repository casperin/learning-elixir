# Remove the K'th element from a list.
#
# Example in Prolog:
#
# ?- remove_at(X,[a,b,c,d],2,R).
# X = b
# R = [a,c,d]
#
# Example in Lisp:
#
# * (remove-at '(a b c d) 2)
# (A C D)

defmodule P20 do
  def remove_at(xs, 0), do: xs
  def remove_at([], _), do: []
  def remove_at(xs, n), do: rm([], xs, n)

  defp rm(f, [], _), do: f
  defp rm(f, [_|xs], 1), do: f++xs
  defp rm(f, [x|xs], n), do: rm(f++[x], xs, n-1)
end
