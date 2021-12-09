#include <stdio.h>

int main() {
    FILE *file;
    file = fopen("file.txt", "a");
    fprintf(file, "Hi!\n");
    fclose(file);

    file = fopen("file.txt", "r");
    char ch = getc(file);
    while(ch != EOF) {
        putchar(ch);
        ch = getc(file);
    }
    fclose(file);

    return 0;
}
