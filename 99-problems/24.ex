# Lotto: Draw N different random numbers from the set 1..M.
#
# Example:
#
# * (rnd-select 6 49)
# (23 1 17 33 21 37)

defmodule P24 do
  def rnd_select(c, m) when m > 1, do: rnd([], c, 1..m)

  defp rnd(to, 0, _), do: to
  defp rnd(to, c, f), do: rnd([Enum.random(f)|to], c-1, f)
end
