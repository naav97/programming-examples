package main

import "fmt"

func sort(arr []int, n int){
    for i := 0; i < n; i++ {
        for j := i; j > 0 && arr[j] < arr[j-1]; j-- {
            var t int = arr[j-1]
            arr[j-1] = arr[j]
            arr[j] = t
        }
    }
}

func main() {
    a := []int{12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222}
    fmt.Println(a)
    sort(a,len(a))
    fmt.Println(a)
}
