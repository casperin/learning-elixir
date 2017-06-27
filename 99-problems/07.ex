# Flatten a nested list structure
defmodule P07 do
  def flat(xs), do: addFlat(xs, [])

  defp addFlat(xs, acc) when is_list(xs) do
    Enum.reduce(xs, acc, &addFlat/2)
  end
  defp addFlat(x, acc), do: acc++[x]
end
