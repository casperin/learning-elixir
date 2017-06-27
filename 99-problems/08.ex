# Eliminate consecutive duplicates of list elements
defmodule P08 do
  def compress([]), do: []
  def compress([x|xs]), do: comp(xs, [x], x)

  defp comp([], to, _), do: to
  defp comp([l|xs], to, l), do: comp(xs, to, l)
  defp comp([n|xs], to, _), do: comp(xs, to++[n], n)
end
