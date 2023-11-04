defmodule HighScore do
  @zero 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @zero)
  def add_player(scores, name, score), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.put(scores, name, @zero)

  def update_score(scores, name, score), do: Map.update(scores, name, score, fn existing_value -> existing_value + score end)

  def get_players(scores), do: Map.keys(scores)
end
