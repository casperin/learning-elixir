# Find the K'th element of a list. The first element in the list is number 1
defmodule P03 do
  def kth(_, n) when n < 0, do: {:error, "k must be 0 or more"}
  def kth([], _), do: {:error, "Out of bound error"}
  def kth([x | _], 0), do: {:ok, x}
  def kth([_ | xs], n), do: kth(xs, n-1)
end
