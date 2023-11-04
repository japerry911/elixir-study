defmodule BoutiqueInventory do
  @type item() :: %{
          name: String.t(),
          price: non_neg_integer(),
          quantity_by_size: %{
            s: non_neg_integer(),
            m: non_neg_integer(),
            l: non_neg_integer(),
            xl: non_neg_integer()
          }
        }

  @spec sort_by_price(inventory :: list(item())) :: list(item())
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  @spec with_missing_price(inventory :: list(item())) :: list(item())
  def with_missing_price(inventory) do
    Enum.filter(inventory, &(is_nil(&1.price)))
  end

  @spec update_names(inventory :: list(item()), old_word :: String.t(), new_word :: String.t()) :: list(item())
  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn x -> %{name: String.replace(x.name, old_word, new_word), price: x.price, quantity_by_size: x.quantity_by_size} end)
  end

  @spec increase_quantity(it :: item(), count :: non_neg_integer()) :: item()
  def increase_quantity(it, count) do
    increases = Map.new(it.quantity_by_size, fn {key, value} -> {key, value + count} end)
    %{name: it.name, price: it.price, quantity_by_size: increases}
  end

  @spec total_quantity(it :: item()) :: non_neg_integer()
  def total_quantity(it) do
    Enum.reduce(it.quantity_by_size, 0, fn {_key, value}, acc -> acc + value end)
  end
end
