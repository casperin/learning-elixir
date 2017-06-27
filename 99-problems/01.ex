# Find the last element of a list. 
defmodule P01 do
  def last([x]), do: {:ok, x}
  def last([_ | xs]), do: last(xs)
end

