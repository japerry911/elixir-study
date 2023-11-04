defmodule Darts do
  @moduledoc """
  Module documentation...
  """

  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    case :math.pow((x * x + y * y), 0.5) do
      value when value <= 1 -> 10
      value when value <= 5 -> 5
      value when value <= 10 -> 1
      _ -> 0
    end
  end
end
