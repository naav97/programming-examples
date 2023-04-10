#include <stdio.h>

struct Node {
    int id;
    struct Node * next;
};

void add_edge(struct Node * nodes[],struct Node * n1,struct Node * n2, int ini, int fin) {
    n1->id = ini;
    n1->next = nodes[fin];
    nodes[fin] = n1;
    n2->id = fin;
    n2->next = nodes[ini];
    nodes[ini] = n2;
}

void printGraph(struct Node * nodes[], int size) {
    for(int i = 0; i < size; i++) {
        printf("(%d) ",i);
        struct Node * temp = nodes[i];
        while(temp != NULL) {
            printf("-> %d",temp->id);
            temp = temp->next;
        }
        printf("\n");
    }
}

void procesar(struct Node * nodes[], int vis[], int pid) {
    vis[pid] = 1;
    printf("%d -> ",pid);
    struct Node * temp = nodes[pid];
    while(temp != NULL) {
        if(!vis[temp->id]) {
            procesar(nodes, vis, temp->id);
        }
        temp = temp->next;
    }
}

void dfs(struct Node * nodes[], int size) {
    int visitado[size];
    procesar(nodes, visitado, 0);
    printf("\n");
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

void bfs(struct Node * nodes[], int size) {
    int visitado[size];
    for(int i = 0; i < size; i++) {
        visitado[i] = 0;
    }
    int line[size];
    new_list(line, size);
    add_back(line, size, 0);
    visitado[0] = 1;

    while(list_size(line, size) > 0) {
        int act = pop_front(line, size);
        printf("%d -> ",act);

        struct Node * temp = nodes[act];
        while(temp != NULL) {
            if(!visitado[temp->id]) {
                add_back(line, size, temp->id);
                visitado[temp->id] = 1;
            }
            temp = temp->next;
        }
    }
    printf("\n");
}

int main() {
    struct Node * nodes[5];
    int size = sizeof(nodes)/sizeof(struct Node *);
    for(int i = 0; i < size; i++) {
        nodes[i] = NULL;
    }
    struct Node n01;
    struct Node n10;
    struct Node n04;
    struct Node n40;
    struct Node n12;
    struct Node n21;
    struct Node n13;
    struct Node n31;
    struct Node n14;
    struct Node n41;
    struct Node n23;
    struct Node n32;
    struct Node n34;
    struct Node n43;
    add_edge(nodes, &n01, &n10, 0, 1);
    add_edge(nodes, &n04, &n40, 0, 4);
    add_edge(nodes, &n12, &n21, 1, 2);
    add_edge(nodes, &n13, &n31, 1, 3);
    add_edge(nodes, &n14, &n41, 1, 4);
    add_edge(nodes, &n23, &n32, 2, 3);
    add_edge(nodes, &n34, &n43, 3, 4);

    printGraph(nodes, size);
    dfs(nodes, size);
    bfs(nodes, size);
}
