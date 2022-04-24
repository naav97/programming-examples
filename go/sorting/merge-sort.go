package main

import "fmt"

func merge(arr []int, i int, j int, m int) {
    var l = i
    var r = m + 1
    var tempArr = make([]int, (j-i) + 1)
    var count = 0

    for l <= m && r <= j {
        if arr[l] <= arr[r] {
            tempArr[count] = arr[l]
            l = l + 1
            count = count + 1
        } else {
            tempArr[count] = arr[r]
            r = r + 1
            count = count + 1
        }
    }

    for l <= m {
        tempArr[count] = arr[l]
        l = l + 1
        count = count + 1
    }

    for r <= j {
        tempArr[count] = arr[r]
        r = r + 1
        count = count + 1
    }

    var k = i
    for k <= j {
        arr[k] = tempArr[k-i]
        k = k + 1
    }
}

func sort(arr []int, i int, j int) {
    if(j > i) {
        var mitad = ((j-i)/2) + i
        sort(arr, i, mitad)
        sort(arr, mitad + 1, j)
        merge(arr, i, j, mitad)
    }
}

func main() {
    a := []int{43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76576,45,777,556,64}
    fmt.Println(a)
    sort(a,0,len(a)-1)
    fmt.Println(a)
}
