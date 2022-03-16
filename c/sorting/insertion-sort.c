#include <stdio.h>

void sort(int arr[], int n){
    for(int i = 0; i < n; i++){
        for(int j = i; j > 0 && arr[j] < arr[j-1]; j--){
            int t = arr[j-1];
            arr[j-1] = arr[j];
            arr[j] = t;
        }
    }
}

void printArray(int arr[], int n){
    printf("[");
    for(int i = 0; i < n; i++){
        if(i == n-1){
            printf("%d", arr[i]);
            break;
        }
        printf("%d, ", arr[i]);
    }
    printf("]\n");
}

int main(){
    int a[] = {12,4,23,5,14,73,1,435,76,2,24,6,143,54,7,122,234,7564,1222};
    int n = sizeof a / sizeof a[0];
    printArray(a,n);
    sort(a,n);
    printArray(a,n);
}
