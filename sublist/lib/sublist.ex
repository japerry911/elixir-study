defmodule Sublist do
  @moduledoc """
  Given any two lists `A` and `B`, determine if:

  - List `A` is equal to list `B`; or
  - List `A` contains list `B` (`A` is a superlist of `B`); or
  - List `A` is contained by list `B` (`A` is a sublist of `B`); or
  - None of the above is true, thus lists `A` and `B` are unequal

  Specifically, list `A` is equal to list `B` if both lists have the same values in the same order.
  List `A` is a superlist of `B` if `A` contains a sub-sequence of values equal to `B`.
  List `A` is a sublist of `B` if `B` contains a sub-sequence of values equal to `A`.
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
      sublist?(a, b) -> :sublist
      superlist?(a, b) -> :superlist
      a !== b -> :unequal
    end
  end

  @doc """
  Returns whether x is a sublist of y.
  """
  @spec sublist?(x :: list(), y :: list()) :: boolean()
  def sublist?(_x, []), do: false
  def sublist?(x, y) do
    case List.starts_with?(y, x) do
      true -> true
      false -> sublist?(x, tl(y))
    end
  end

  @doc """
  Returns whether x is a superlist of y.
  """
  @spec superlist?(x :: list(), y :: list()) :: boolean()
  def superlist?(x, y), do: sublist?(y, x)
end
