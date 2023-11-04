defmodule NameBadge do
  @doc """
  Prints Badge name.
  """
  @spec print(id :: non_neg_integer(), name :: String.t(), department :: String.t()) :: String.t()
  def print(id, name, department) do
    if id === nil or department == nil do
      if id === nil and department === nil do
        "#{name} - OWNER"
      else
        if id === nil do
          "#{name} - #{String.upcase(department)}"
        else
          "[#{id}] - #{name} - OWNER"
        end
      end
    else
      "[#{id}] - #{name} - #{String.upcase(department)}"
    end
  end
end
