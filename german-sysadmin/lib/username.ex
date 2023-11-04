defmodule Username do
  @spec sanitize(username :: charlist()) :: charlist()
  def sanitize([]), do: ~c""
  def sanitize([head | tail]) do
    case head do
      head when (head >= ?a and head <= ?z) or head === ?_ -> [head] ++ sanitize(tail)
      head when head === ?ä -> ~c"ae" ++ sanitize(tail)
      head when head === ?ö -> ~c"oe" ++ sanitize(tail)
      head when head === ?ü -> ~c"ue" ++ sanitize(tail)
      head when head === ?ß -> ~c"ss" ++ sanitize(tail)
      _ -> sanitize(tail)
    end
  end
end
