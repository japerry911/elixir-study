defmodule Sublist do
  @moduledoc """
  Module Documentation...
  """

  @type compare_result :: :equal | :superlist | :sublist | :unequal

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare(a :: list(), b :: list()) :: compare_result()
  def compare([], []), do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist
  def compare(a, b) do
    cond do
      a === b -> :equal
      is_sublist(a, b) or is_sublist(b, a) -> :sublist
      a !== b -> :unequal
    end
  end

  @spec is_sublist(x :: list(), y :: list()) :: boolean()
  defp is_sublist(x, y), do: Enum.all?(x, fn x2 -> x2 in y end)
end
