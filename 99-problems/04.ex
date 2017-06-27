# Find the number of elements of a list
defmodule P04 do
  def my_length([]), do: 0
  def my_length([_|xs]), do: 1 + my_length(xs)
end
