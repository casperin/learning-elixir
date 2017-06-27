#Find the last but one element of a list. 
defmodule P02 do
  def but_last([]), do: {:error, "Need two or more elements"}
  def but_last([_]), do: but_last []
  def but_last(xs) do
    xs
    |> Enum.reduce({nil, nil}, &reducer/2)
    |> ok
  end

  defp reducer(x, {_, b}), do: {b, x}
  defp ok({x, _}), do: {:ok, x}
end
