class Node:
    def __init__(self, pid):
        self.id = pid
        self.next = None

class Graph:
    def __init__(self, pn):
        self.nodes = [None] * pn

    def add_edge(self, ini, fin):
        n1 = Node(ini)
        n1.next = self.nodes[fin]
        self.nodes[fin] = n1
        n2 = Node(fin)
        n2.next = self.nodes[ini]
        self.nodes[ini] = n2

    def printGraph(self):
        i = 0
        while i < len(self.nodes):
            print("(" + str(i) + ") ", end="")
            temp = self.nodes[i]
            while temp != None:
                print("-> " + str(temp.id), end="")
                temp = temp.next
            print("\n")
            i = i + 1

    def dfs(self):
        visitado = [False] * len(self.nodes)
        self.procesar(visitado,0)
        print()

    def procesar(self, vis, pid):
        vis[pid] = True
        print(str(pid) + " -> ", end="")
        temp = self.nodes[pid]
        while temp != None:
            if not vis[temp.id]:
                self.procesar(vis,temp.id)
            temp = temp.next

    def bfs(self):
        visitado = [False] * len(self.nodes)
        line = []
        line.append(0)
        visitado[0] = True

        while len(line) > 0:
            act = line.pop(0)
            print(str(act) + " -> ", end="")

            temp = self.nodes[act]
            while temp != None:
                if not visitado[temp.id]:
                    line.append(temp.id)
                    visitado[temp.id] = True
                temp = temp.next
        print()


g = Graph(5)
g.add_edge(0, 1)
g.add_edge(0, 4)
g.add_edge(1, 2)
g.add_edge(1, 3)
g.add_edge(1, 4)
g.add_edge(2, 3)
g.add_edge(3, 4)

g.printGraph()
g.dfs()
g.bfs()
