defmodule FlattenArray do
  @moduledoc """
  Module documentation for FlattenArray.
  """

  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list()) :: list()
  def flatten(list) do
    list
    |> flatten_helper()
    |> Enum.filter(fn x -> not is_nil(x) end)
  end

  defp flatten_helper([]), do: [nil]
  defp flatten_helper([h | t]) when is_list(h) do
    flatten_helper(h) ++ flatten_helper(t)
  end
  defp flatten_helper([h | t]) when not is_list(h) do
    [h | flatten_helper(t)]
  end
end
