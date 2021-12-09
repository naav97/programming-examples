package main

import (
    "fmt"
    "os"
)

func main() {
    file, err := os.OpenFile("file.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0600)
    if err != nil {
        panic(err)
    }
    _, err = fmt.Fprintln(file,"Hi!")
    if err != nil {
        fmt.Println(err)
        file.Close()
    }
    file.Close()

    fileR, err := os.ReadFile("file.txt")
    if err != nil {
        panic(err)
    }
    fmt.Print(string(fileR))
}
