defmodule Graph do
  defp printEdges(edges, j) do
    cond do
      j >= length(edges) ->
        IO.puts("")
      Enum.at(edges, j) > 0 ->
        IO.write(" -#{Enum.at(edges, j)}> #{j}")
        printEdges(edges, j+1)
      true ->
        printEdges(edges, j+1)
    end
  end
  def printGraph(g, i) do
    cond do
      i >= length(g) ->
        :ok
      true ->
        IO.write("(#{i})")
        printEdges(Enum.at(g, i), 0)
        printGraph(g, i+1)
    end
  end
end

g = [
  [-1, 1, 15, -1, -1],
  [-1, -1, -1, 6, 2],
  [-1, -1, -1, -1, -1],
  [-1, 1, 5, -1, -1],
  [-1, -1, -1, 3, -1]
]
Graph.printGraph(g, 0)
