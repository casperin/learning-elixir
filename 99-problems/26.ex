# Generate the combinations of K distinct objects chosen from the N elements of
# a list
#
# In how many ways can a committee of 3 be chosen from a group of 12 people? We
# all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the
# well-known binomial coefficients). For pure mathematicians, this result may
# be great. But we want to really generate all the possibilities in a list.
#
# Example:
#
# * (combinations 3 '(a b c d e f))
# ((A B C) (A B D) (A B E) ... )
#
# Solution below is based off of this one in Haskell:
# combinations :: Int -> [a] -> [[a]]
# combinations 0 _ = [[]]
# combinations _ [] = []
# combinations n (x:xs) =
#   (map (x:) (combinations (n-1) xs)) ++ (combinations n xs)

defmodule P26 do
  def combinations(0, _), do: [[]]
  def combinations(_, []), do: [[]]
  def combinations(n, [x|xs]) when n > 0 do
    combinations(n-1, xs)
    |> Stream.map(fn ys -> [x|ys] end)
    |> Enum.concat(combinations n, xs)
  end
end
