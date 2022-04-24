#include <iostream>

using namespace std;

void merge(int arr[], int i, int j, int m) {
    int l = i;
    int r = m + 1;
    int tempArr[(j-i) + 1];
    int count = 0;

    while(l <= m && r <= j) {
        if(arr[l] <= arr[r]) {
            tempArr[count] = arr[l];
            l = l + 1;
            count = count + 1;
        }
        else {
            tempArr[count] = arr[r];
            r = r + 1;
            count = count + 1;
        }
    }

    while(l <= m) {
        tempArr[count] = arr[l];
        l = l + 1;
        count = count + 1;
    }

    while(r <= j) {
        tempArr[count] = arr[r];
        r = r + 1;
        count = count + 1;
    }

    int k = i;
    while(k <= j) {
        arr[k] = tempArr[k-i];
        k = k + 1;
    }
}

void sort(int arr[], int i, int j) {
    if(j > i) {
        int mitad = ((j-i)/2) + i;
        sort(arr, i, mitad);
        sort(arr, mitad + 1, j);
        merge(arr, i, j, mitad);
    }
}

void printArray(int arr[], int n){
    cout << "[";
    for(int i = 0; i < n; i++){
        if(i == n - 1){
            cout << arr[i];
            break;
        }
        cout << arr[i] << ", ";
    }
    cout << "]" << endl;
}

int main() {
    int a[] = {43,76,22,543,6,2,33,3,7,4,5,8,9,0,54,66,23,77,78,34,87,23,42,224,76575,45,777,556,64};
    int n = sizeof(a)/sizeof(a[0]);
    printArray(a,n);
    sort(a,0,n-1);
    printArray(a,n);
}
