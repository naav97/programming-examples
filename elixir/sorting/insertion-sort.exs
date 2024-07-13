defmodule InsertionSort do
  def insert(x, []) do
    [x]
  end

  def insert(x, [h | t]) do
    if x <= h do
      [x] ++ [h] ++ t
    else
      [h] ++ insert(x, t)
    end
  end

  def sort([]) do
    []
  end

  def sort([h | t]) do
    insert(h, sort(t))
  end
end

IO.inspect([12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222], char_list: :as_list)
IO.inspect(InsertionSort.sort([12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222]), char_list: :as_list)
