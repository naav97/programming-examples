#include <iostream>
#include <string>
#include <vector>
#include <list>

using namespace std;

class Node {
    public:
        int id;
        Node * next;
};

class Graph {
    public:
        vector<Node*> nodes;
        explicit Graph(size_t np): nodes(np) {}
        void add_edge(int ini, int fin) {
            Node * n1 = new Node();
            n1->id = ini;
            n1->next = nodes[fin];
            nodes[fin] = n1;
            Node * n2 = new Node();
            n2->id = fin;
            n2->next = nodes[ini];
            nodes[ini] = n2;
        }
        void printGraph() {
            for(int i = 0; i < nodes.size(); i++) {
                cout << "(" << i << ") ";
                Node * temp = nodes[i];
                while(temp != 0) {
                    cout << "-> " << temp->id;
                    temp = temp->next;
                }
                cout << endl;
            }
        }
        void procesar(bool * vis, int pid) {
            vis[pid] = true;
            cout << pid << " -> ";
            Node * temp = nodes[pid];
            while(temp != 0) {
                if(!vis[temp->id]) {
                    procesar(vis, temp->id);
                }
                temp = temp->next;
            }
        }
        void dfs() {
            bool visitado[nodes.size()];
            procesar(visitado, 0);
            cout << endl;
        }
        void bfs() {
            bool visitado[nodes.size()];
            list<int> line;
            line.push_front(0);
            visitado[0] = true;

            while(line.size() > 0) {
                int act = line.front();
                line.pop_front();
                cout << act << " -> ";

                Node * temp = nodes[act];
                while(temp != 0) {
                    if(!visitado[temp->id]) {
                        line.push_back(temp->id);
                        visitado[temp->id] = true;
                    }
                    temp = temp->next;
                }
            }
            cout << endl;
        }
};

int main() {
    Graph g(5);
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
    return 0;
}
