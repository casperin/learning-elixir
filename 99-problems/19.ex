# Rotate a list N places to the left.
#
# Examples:
#
# * (rotate '(a b c d e f g h) 3)
# (D E F G H A B C)
#
# * (rotate '(a b c d e f g h) -2)
# (G H A B C D E F)

defmodule P19 do
  def rotate(xs, 0), do: xs
  def rotate([], _), do: []
  def rotate(xs, n) when n < 0, do: rotate(xs, n+len(xs))
  def rotate([x|xs], n), do: rotate(xs++[x], n-1)

  defp len([]), do: 0
  defp len([_|xs]), do: 1+len(xs)
end
