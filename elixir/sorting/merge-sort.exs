defmodule MergeSort do
  def merge([], x) do
    x
  end
  def merge(x, []) do
    x
  end
  def merge([xh | xt], [yh | yt]) do
    if xh <= yh do
      [xh] ++ merge(xt, [yh] ++ yt)
    else
      [yh] ++ merge([xh] ++ xt, yt)
    end
  end

  def sort([]) do
    []
  end
  def sort([x]) do
    [x]
  end
  def sort(arr) do
    {l, r} = Enum.split(arr, div(length(arr), 2))
    merge(sort(l), sort(r))
  end
end

IO.inspect([43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76575,234,45,777,556,64], char_list: :as_list)
IO.inspect(MergeSort.sort([43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76575,234,45,777,556,64]), char_list: :as_list)
