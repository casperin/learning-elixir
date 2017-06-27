# Replicate the elements of a list a given number of times.
# Example:
# * (repli '(a b c) 3)
# (A A A B B B C C C)
defmodule P15 do
  def replicate([], _), do: []
  def replicate(_, n) when n < 1, do: []
  def replicate(xs, n), do: repl(xs, [], n, n)

  defp repl([], to, _, _), do: to
  defp repl([_|xs], to, 0, n), do: repl(xs, to, n, n)
  defp repl([x|xs], to, m, n), do: repl([x|xs], to++[x], m-1, n)
end
