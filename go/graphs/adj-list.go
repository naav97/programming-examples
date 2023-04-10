package main

import "fmt"
import "container/list"

func add_edge(nodes []list.List, ini int, fin int)  {
    nodes[fin].PushFront(ini)
    nodes[ini].PushFront(fin)
}

func printGraph(nodes []list.List) {
    for i := 0; i < len(nodes); i++ {
        fmt.Printf("(%d) ", i)
        for temp := nodes[i].Front(); temp != nil; temp = temp.Next() {
            fmt.Printf("->  %d", temp.Value)
        }
        fmt.Println()
    }
}

func procesar(nodes []list.List, vis []bool, pid int) {
    vis[pid] = true
    fmt.Printf("%d -> ", pid)
    for temp := nodes[pid].Front(); temp != nil; temp = temp.Next() {
        if !vis[temp.Value.(int)] {
            procesar(nodes, vis, temp.Value.(int))
        }
    }
}

func dfs(nodes []list.List) {
    visitado := make([]bool, len(nodes))
    procesar(nodes, visitado, 0)
    fmt.Println("")
}

func bfs(nodes []list.List) {
    visitado := make([]bool, len(nodes))
    line := list.New()
    line.PushFront(0)
    visitado[0] = true

    for line.Len() > 0 {
        act := line.Remove(line.Front())
        fmt.Printf("%d -> ", act)

        for temp := nodes[act.(int)].Front(); temp != nil; temp = temp.Next() {
            if !visitado[temp.Value.(int)] {
                line.PushBack(temp.Value.(int))
                visitado[temp.Value.(int)] = true
            }
        }
    }
    fmt.Println("")
}

func main() {
    nodes := make([]list.List,5)
    add_edge(nodes,0,1)
    add_edge(nodes,0,4)
    add_edge(nodes,1,2)
    add_edge(nodes,1,3)
    add_edge(nodes,1,4)
    add_edge(nodes,2,3)
    add_edge(nodes,3,4)

    printGraph(nodes)
    dfs(nodes)
    bfs(nodes)
}
