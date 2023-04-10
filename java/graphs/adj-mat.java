import java.util.LinkedList;

class AdjaMat {
    public static void main(String[] args) {
        Graph g = new Graph(5);
        g.add_edge(0, 1, 1);
        g.add_edge(0, 2, 15);
        g.add_edge(1, 3, 6);
        g.add_edge(1, 4, 2);
        g.add_edge(3, 1, 1);
        g.add_edge(3, 2, 5);
        g.add_edge(4, 3, 3);

        g.printGraph();
        int[] distances = g.BellmanFord(0);
        for(int d = 0; d < distances.length; d++) {
            System.out.println("De " + 0 + " a " + d + ": " + distances[d]);
        }
    }
}

class Graph {
    int[][] nodes;

    public Graph(int pn) {
        this.nodes = new int[pn][pn];
    }

    public void add_edge(int ini, int fin, int peso) {
        this.nodes[ini][fin] = peso;
    }

    public void printGraph() {
        for(int i = 0; i < this.nodes.length; i++) {
            System.out.print("(" + i + ")");
            for(int j = 0; j < this.nodes.length; j++) {
                if(this.nodes[i][j] > 0) {
                    System.out.print(" -" + this.nodes[i][j] + "> " + j);
                }
            }
            System.out.println();
        }
    }

    public int[] BellmanFord(int pn) {
        LinkedList<Integer> fila = new LinkedList<>();
        int[] dist = new int[this.nodes.length];
        for(int i = 0; i < dist.length; i++) {
            dist[i] = 100;
        }
        boolean[] procesado = new boolean[this.nodes.length];

        fila.add(pn);
        dist[pn] = 0;

        while(fila.size() > 0) {
            int act = fila.remove(0);
            for(int j = 0; j < this.nodes.length; j++) {
                if(this.nodes[act][j] > 0) {
                    if(dist[act] + this.nodes[act][j] < dist[j]) {
                        dist[j] = dist[act] + this.nodes[act][j];
                    }
                    if(!procesado[j]) {
                        fila.add(j);
                    }
                }
            }
            procesado[act] = true;
        }

        return dist;
    }
}
