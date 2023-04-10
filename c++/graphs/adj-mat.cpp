#include <iostream>
#include <string>
#include <vector>
#include <list>

using namespace std;

class Graph {
    public:
        vector<vector<int>> nodes;
        Graph(int pn) {
            for(int i = 0; i < pn; i++) {
                vector<int> v;
                for(int j = 0; j < pn; j++) {
                    v.push_back(0);
                }
                nodes.push_back(v);
            }
        }
        void add_edge(int ini, int fin, int peso) {
            nodes[ini][fin] = peso;
        }
        void printGraph() {
            for(int i = 0; i < nodes.size(); i++) {
                cout << "(" << i << ")";
                for(int j = 0; j < nodes.size(); j++) {
                    if(nodes[i][j] > 0) {
                        cout << " -" << nodes[i][j] << "> " << j;
                    }
                }
                cout << endl;
            }
        }
        void BellmanFord(int pn, int * dist, int size) {
            list<int> fila;
            for(int i = 0; i < size; i++) {
                dist[i] = 100;
            }
            bool procesado [nodes.size()];

            fila.push_front(pn);
            dist[pn] = 0;

            while(fila.size() > 0) {
                int act = fila.front();
                fila.pop_front();
                for(int j = 0; j < nodes.size(); j++) {
                    if(nodes[act][j] > 0) {
                        if(dist[act] + nodes[act][j] < dist[j]) {
                            dist[j] = dist[act] + nodes[act][j];
                        }
                        if(!procesado[j]) {
                            fila.push_back(j);
                        }
                    }
                }
                procesado[act] = true;
            }
        }
};

int main() {
    Graph g(5);
    g.add_edge(0, 1, 1);
    g.add_edge(0, 2, 15);
    g.add_edge(1, 3, 6);
    g.add_edge(1, 4, 2);
    g.add_edge(3, 1, 1);
    g.add_edge(3, 2, 5);
    g.add_edge(4, 3, 3);

    g.printGraph();
    int dist [5];
    g.BellmanFord(0, dist, sizeof(dist)/sizeof(int));
    for(int d = 0; d < sizeof(dist)/sizeof(int); d++) {
        cout << "De " << 0 << " a " << d << ": " << dist[d] << endl;
    }
    return 0;
}
