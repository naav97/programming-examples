package main

import "fmt"

func main() {
    cars := [3]string{"Ford", "Volvo", "BMW"}

    fmt.Println(cars)

    newArr := [len(cars)-1]string{}
    var j int = 0
    for i := 0; i < len(cars); i++ {
        if cars[i] != "Volvo" {
            newArr[j] = cars[i]
            j++
        }
    }

    fmt.Println(newArr)
}
