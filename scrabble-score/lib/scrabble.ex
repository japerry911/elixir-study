defmodule Scrabble do
  @moduledoc """
  Scrabble Module Documentation.
  """

  @score_conversions %{
    65 => 1,
    66 => 3,
    67 => 3,
    68 => 2,
    69 => 1,
    70 => 4,
    71 => 2,
    72 => 4,
    73 => 1,
    74 => 8,
    75 => 5,
    76 => 1,
    77 => 3,
    78 => 1,
    79 => 1,
    80 => 3,
    81 => 10,
    82 => 1,
    83 => 1,
    84 => 1,
    85 => 1,
    86 => 4,
    87 => 4,
    88 => 8,
    89 => 4,
    90 => 10
  }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    String.upcase(word)
    |> String.to_charlist()
    |> calculate_score()
  end

  @doc """
  Helper method for calculating score, loops through charlist.
  """
  @spec calculate_score(charlist()) :: non_neg_integer()
  def calculate_score([]), do: 0
  def calculate_score([chr | rst]) do
    Map.get(@score_conversions, chr, 0) + calculate_score(rst)
  end
end
