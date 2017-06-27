# Reverse a list
defmodule P05 do
  def my_reverse([]), do: []
  def my_reverse([y|xs]), do: move(xs, [y])

  defp move([], ys), do: ys
  defp move([x|xs], ys), do: move(xs, [x|ys])
end
