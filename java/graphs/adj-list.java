import java.util.LinkedList;

class AdjaList {
    public static void main(String[] args) {
        Graph g = new Graph(5);
        g.add_edge(0, 1);
        g.add_edge(0, 4);
        g.add_edge(1, 2);
        g.add_edge(1, 3);
        g.add_edge(1, 4);
        g.add_edge(2, 3);
        g.add_edge(3, 4);

        g.printGraph();
        g.dfs();
        g.bfs();
    }
}

class Node {
    int id;
    Node next;
    public Node(int pid) {
        this.id = pid;
        this.next = null;
    }
}

class Graph {
    Node[] nodes;
    public Graph(int np) {
        this.nodes = new Node[np];
    }

    public void add_edge(int ini, int fin) {
        Node n1 = new Node(ini);
        n1.next = this.nodes[fin];
        this.nodes[fin] = n1;
        Node n2 = new Node(fin);
        n2.next = this.nodes[ini];
        this.nodes[ini] = n2;
    }

    public void printGraph() {
        for(int i = 0; i < this.nodes.length; i++) {
            System.out.print("(" + i +  ") ");
            Node temp = this.nodes[i];
            while(temp != null) {
                System.out.print("-> " + temp.id);
                temp = temp.next;
            }
            System.out.println();
        }
    }

    public void dfs() {
        boolean[] visitado = new boolean[this.nodes.length];
        procesar(visitado, 0);
        System.out.println();
    }

    private void procesar(boolean[] vis, int pid) {
        vis[pid] = true;
        System.out.print(pid + " -> ");
        Node temp = this.nodes[pid];
        while(temp != null) {
            if(!vis[temp.id]) {
                procesar(vis, temp.id);
            }
            temp = temp.next;
        }
    }

    public void bfs() {
        boolean[] visitado = new boolean[this.nodes.length];
        LinkedList<Integer> line = new LinkedList<>();
        line.add(0);
        visitado[0] = true;

        while(line.size() > 0) {
            int act = line.remove(0);
            System.out.print(act + " -> ");

            Node temp = this.nodes[act];
            while(temp != null) {
                if(!visitado[temp.id]) {
                    line.add(temp.id);
                    visitado[temp.id] = true;
                }
                temp = temp.next;
            }
        }
        System.out.println();
    }
}
