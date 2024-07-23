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

  defp updateD(graph, act, dist, processed) do
    Enum.zip_with(Enum.with_index(dist), processed, fn {d, j}, _pro -> 
      if Enum.at(Enum.at(graph,act), j) > 0 and d > Enum.at(dist, act) + Enum.at(Enum.at(graph,act), j) do
        Enum.at(dist, act) + Enum.at(Enum.at(graph, act), j)
      else
        d
      end
    end)
  end
  defp updateP([_h | t], 0) do
    [true | t]
  end
  defp updateP([h | t], ix) do
    [h | updateP(t, ix-1)]
  end
  defp checkN(_, [], dist, _) do
    dist
  end
  defp checkN(graph, [act | rest], dist, processed) do
    newD = updateD(graph, act, dist, processed)
    newP = updateP(processed, act)
    newQueue = Enum.uniq(rest ++ for {p, j} <- Enum.with_index(newP), not p, do: j)
    checkN(graph, newQueue, newD, newP)
  end
  defp initD(g) do
    [0 | List.duplicate(100, length(g)-1)]
  end
  defp initP(g) do
    List.duplicate(false, length(g))
  end
  def bellmanFord(graph, pn) do
    checkN(graph, [pn], initD(graph), initP(graph))
  end

  def printDist(dist, i) do
    if i >= 0 do
      printDist(dist, i-1)
      IO.puts("De 0 a #{i}: #{Enum.at(dist, i)}")
    else
      IO.puts("")
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
distances = Graph.bellmanFord(g, 0)
Graph.printGraph(g, 0)
Graph.printDist(distances, length(distances)-1)
