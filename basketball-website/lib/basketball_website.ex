defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path, ".")
    |> helper_extract_from_path(data)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end

  defp helper_extract_from_path([], data), do: data
  defp helper_extract_from_path([k | t], data), do: helper_extract_from_path(t, data[k])
end
