defmodule RomanNumerals do
  @moduledoc """
  Module Documentation for RomanNumerals.
  """

  @roman_numerals [
    {"M", 1000}, {"CM", 900}, {"D", 500}, {"CD", 400},
    {"C", 100}, {"XC", 90}, {"L", 50}, {"XL", 40},
    {"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: from_integer(number)

  @spec from_integer(n :: non_neg_integer()) :: String.t()
  defp from_integer(0), do: ""
  defp from_integer(n) when n > 0 do
    {numeral, value} = Enum.find(@roman_numerals, fn {_, v} -> v <= n end)
    numeral <> from_integer(n - value)
  end
end
