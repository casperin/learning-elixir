# Decode a run-length encoded list.
# Given a run-length code list generated as specified in problem 11. Construct
# its uncompressed version. 
defmodule P12 do
  def decode(xs), do: dec(xs, [])

  defp dec([], to), do: to
  defp dec([{1, x}|xs], to), do: dec(xs, to++[x])
  defp dec([{n, x}|xs], to), do: dec([{n-1, x}|xs], to++[x])
  defp dec([x|xs], to), do: dec(xs, to++[x])
end
