#include <stdio.h>

void add_edge(int s, int nodes[s][s], int ini, int fin, int peso) {
    nodes[ini][fin] = peso;
}

void printGraph(int size, int nodes[size][size]) {
    for(int i = 0; i < size; i++) {
        printf("(%d)",i);
        for(int j = 0; j < size; j++) {
            if(nodes[i][j] > 0) {
                printf(" -%d> %d", nodes[i][j], j);
            }
        }
        printf("\n");
    }
}

void new_list(int list[], int size) {
    for(int i = 0; i < size; i++) {
        list[i] = -1;
    }
}

void add_back(int list[], int size, int n) {
    for(int i = 0; i < size; i++) {
        if(list[i] == -1) {
            list[i] = n;
            break;
        }
    }
}

int pop_front(int list[], int size) {
    int re = list[0];
    for(int i = 0; i < size-1; i++) {
        list[i] = list[i+1];
    }
    return re;
}

int list_size(int list[], int size) {
    int re = 0;
    for(int i = 0; i < size; i++) {
        if(list[i] == -1) {
            break;
        }
        re++;
    }
    return re;
}

void BellmanFord(int size, int nodes[size][size], int pn, int dist[]) {
    int fila[size];
    new_list(fila, size);
    int procesado[size];
    for(int i = 0; i < size; i++) {
        dist[i] = 100;
        procesado[i] = 0;
    }

    add_back(fila, size, pn);
    dist[pn] = 0;

    while(list_size(fila, size) > 0) {
        int act = pop_front(fila, size);
        for(int j = 0; j < size; j++) {
            if(nodes[act][j] > 0) {
                if(dist[act] + nodes[act][j] < dist[j]) {
                    dist[j] = dist[act] + nodes[act][j];
                }
                if(!procesado[j]) {
                    add_back(fila, size, j);
                }
            }
        }
        procesado[act] = 1;
    }
}

int main() {
    int nodes[5][5];
    for(int i = 0; i < 5; i++) {
        for(int j = 0; j < 5; j++) {
            nodes[i][j] = 0;
        }
    }
    add_edge(5, nodes, 0, 1, 1);
    add_edge(5, nodes, 0, 2, 15);
    add_edge(5, nodes, 1, 3, 6);
    add_edge(5, nodes, 1, 4, 2);
    add_edge(5, nodes, 3, 1, 1);
    add_edge(5, nodes, 3, 2, 5);
    add_edge(5, nodes, 4, 3, 3);

    printGraph(5, nodes);
    int dist[5];
    BellmanFord(5, nodes, 0, dist);
    for(int d = 0; d < 5; d++) {
        printf("De 0 a %d: %d\n", d, dist[d]);
    }
    return 0;
}
