# Find out whether a list is a palindrome. A palindrome can be read forward or backward

# The tactic used is to first reverse the list, and then jog through each item
# and compare.
defmodule P06 do
  def palindrome?(xs), do: alike?(xs, rev(xs, []))

  # alike (compare two lists)
  defp alike?([], []), do: true
  defp alike?([x|xs], [x|ys]), do: alike?(xs, ys)
  defp alike?(_, _), do: false

  # Reverse
  defp rev([], ys), do: ys
  defp rev([x|xs], ys), do: rev(xs, [x|ys])
end
