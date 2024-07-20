defmodule Graph do
  defp insertNode(graph, ini, fin) do
    li = Map.get(graph, ini, [])
    nli = [fin | li]
    Map.put(graph, ini, nli)
  end
  def addEdge(graph, ini, fin) do
    insertNode(insertNode(graph, ini, fin), fin, ini)
  end

  defp formatTail([]) do
    ""
  end
  defp formatTail([h | t]) do
    " -> #{h}" <> formatTail(t)
  end
  defp formatAdj([]) do
    ""
  end
  defp formatAdj([h | t]) do
    "#{h}" <> formatTail(t)
  end
  defp formatRow(node, adj) do
    "(#{node}) -> " <> formatAdj(adj)
  end
  def printGraph(graph) do
    nodes = Map.keys(graph)
    Enum.each(nodes, fn node ->
      IO.puts(formatRow(node, Map.get(graph, node, [])))
    end)
  end

  defp procesar([], _vis, _graph) do
    IO.write("")
  end
  defp procesar([node | stack], vis, graph) do
    if Enum.member?(vis, node) do
      procesar(stack, vis, graph)
    else
      IO.write("#{node} -> ")
      adj = Enum.filter(Map.get(graph, node, []), fn n-> 
        not Enum.member?(vis, n)
      end)
      procesar(adj ++ stack, [node | vis], graph)
    end
  end
  def dfs(graph) do
    procesar([0], [], graph)
    IO.puts("")
  end

  def bfs([], _vis, _graph) do
    IO.write("")
  end
  def bfs([act | line], vis, graph) do
    if Enum.member?(vis, act) do
      bfs(line, vis, graph)
    else
      IO.write("#{act} -> ")
      temps = Enum.filter(Map.get(graph, act, []), fn n -> 
        not Enum.member?(vis, n)
      end)
      bfs(line ++ temps, [act | vis], graph)
    end
  end
end

g = Graph.addEdge(Graph.addEdge(Graph.addEdge(Graph.addEdge(Graph.addEdge(Graph.addEdge(Graph.addEdge(%{}, 0, 1), 0, 4), 1, 2), 1, 3), 1, 4), 2, 3), 3, 4)
#g = Graph.addEdge(%{}, 0, 1)
Graph.printGraph(g)
Graph.dfs(g)
Graph.bfs([0], [], g)
IO.puts("")
