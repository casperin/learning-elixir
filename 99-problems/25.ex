# Generate a random permutation of the elements of a list.
#
# Example:
#
# * (rnd-permu '(a b c d e f))
# (B A D C E F)
#

defmodule P25 do
  # okay, I'm lazy. Enough with the random!
  def rnd_permu(xs), do: Enum.shuffle(xs)
end
