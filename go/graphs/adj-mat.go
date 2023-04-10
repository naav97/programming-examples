package main

import "fmt"
import "container/list"

func printGraph(nodes [5][5]int) {
    for i := 0; i < len(nodes); i++ {
        fmt.Printf("(%d)", i)
        for j := 0; j < len(nodes); j++ {
            if nodes[i][j] > 0 {
                fmt.Printf(" -%d> %d", nodes[i][j], j)
            }
        }
        fmt.Println()
    }
}

func BellmanFord(nodes [5][5]int, pn int) ([]int) {
    fila := list.New()
    dist := make([]int, len(nodes))
    for i := 0; i < len(dist); i++ {
        dist[i] = 100;
    }
    procesado := make([]bool, len(nodes))

    fila.PushBack(pn)
    dist[pn] = 0

    for fila.Len() > 0 {
        act := fila.Remove(fila.Front())
        for j := 0; j < len(nodes); j++ {
            if nodes[act.(int)][j] > 0 {
                if dist[act.(int)] + nodes[act.(int)][j] <  dist[j] {
                    dist[j] = dist[act.(int)] + nodes[act.(int)][j]
                }
                if !procesado[j] {
                    fila.PushBack(j)
                }
            }
        }
        procesado[act.(int)] = true
    }

    return dist
}

func main() {
    var nodes [5][5]int
    nodes[0][1] = 1
    nodes[0][2] = 15
    nodes[1][3] = 6
    nodes[1][4] = 2
    nodes[3][1] = 1
    nodes[3][2] = 5
    nodes[4][3] = 3

    printGraph(nodes)
    distances := BellmanFord(nodes, 0)
    for d := 0; d < len(distances); d++ {
        fmt.Printf("De 0 a %d: %d\n", d, distances[d])
    }
}
