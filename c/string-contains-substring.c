#include <stdio.h>
#include <string.h>
#include <stdbool.h>

int main() {
    char s[] = "Fvnjailhgdi";
    printf("%s\n", s);
    char ss[] = "jail";
    printf("%s\n", ss);

    bool contains = strstr(s,ss);

    printf("%d\n", contains);
}
