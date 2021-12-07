package main

import (
    "fmt"
    "strings"
)

func main() {
    str := "Fvnjailhgdi"
    fmt.Println(str)
    ss := "jail"
    fmt.Println(ss)

    fmt.Println(strings.Contains(str,ss))
}
