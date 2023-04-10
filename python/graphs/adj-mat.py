class Graph:
    def __init__(self, pn):
        self.nodes = [[-1 for i in range(pn)] for j in range(pn)]

    def add_edge(self, ini, fin, peso):
        self.nodes[ini][fin] = peso

    def printGraph(self):
        i = 0
        while i < len(self.nodes):
            print("(" + str(i) + ")", end="")
            j = 0
            while j < len(self.nodes):
                if self.nodes[i][j] > 0:
                    print(" -" + str(self.nodes[i][j]) + "> " + str(j), end="")
                j = j + 1
            print("\n")
            i = i + 1

    def BellmanFord(self, pn):
        fila = []
        dist = [100] * len(self.nodes)
        procesado = [False] * len(self.nodes)

        fila.append(pn)
        dist[pn] = 0

        while len(fila) > 0:
            act = fila.pop(0)
            j = 0
            while j < len(self.nodes):
                if self.nodes[act][j] > 0:
                    if dist[act] + self.nodes[act][j] < dist[j]:
                        dist[j] = dist[act] + self.nodes[act][j]
                    if not procesado[j]:
                        fila.append(j)
                j = j + 1
            procesado[act] = True

        return dist


g = Graph(5)
g.add_edge(0, 1, 1)
g.add_edge(0, 2, 15)
g.add_edge(1, 3, 6)
g.add_edge(1, 4, 2)
g.add_edge(3, 1, 1)
g.add_edge(3, 2, 5)
g.add_edge(4, 3, 3)
g.printGraph()
distances = g.BellmanFord(0)
dis = 0
while dis < len(distances):
    print("De " + str(0) + " a " + str(dis) + ": " + str(distances[dis]))
    dis = dis + 1
