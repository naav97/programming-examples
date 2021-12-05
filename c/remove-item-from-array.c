#include <stdio.h>
int main() {
    int nums[3] = {1, 2, 3};

    printf("[ ");
    int size = sizeof nums / sizeof nums[0];
    for(int i = 0; i < size; i++) {
        printf("%d, ", nums[i]);
    }
    printf(" ]\n");

    char newArr[size-1];
    int j = 0;
    for(int i = 0; i < size; i++) {
        if(nums[i] != 2) {
            newArr[j] = nums[i];
            j++;
        }
    }

    printf("[ ");
    for(int i = 0; i < size-1; i++) {
        printf("%d, ", newArr[i]);
    }
    printf(" ]\n");

    return 0;
}
