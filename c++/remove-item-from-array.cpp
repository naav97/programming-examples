#include <iostream>
#include <string>
using namespace std;

int main() {
    string cars[3] = {"Ford", "Volvo", "BMW"};

    cout << "[ ";
    int size = sizeof(cars)/sizeof(cars[0]);
    for(int i = 0; i < size; i++) {
        cout << cars[i] << ", ";
    }
    cout << " ]" << endl;

    string newArr[size-1];
    int j = 0;
    for(int i = 0; i < size; i++) {
        if(cars[i] != "Volvo") {
            newArr[j] = cars[i];
            j++;
        }
    }

    cout << "[ ";
    for(int i = 0; i < size - 1; i++) {
        cout << newArr[i] << ", ";
    }
    cout << " ]" << endl;
}
