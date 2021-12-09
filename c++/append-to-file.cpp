#include <iostream>
#include <fstream>
using namespace std;

int main() {
    fstream file;
    file.open("file.txt", ios::app);
    file << "Hi!" << endl;
    file.close();

    file.open("file.txt", ios::in);
    string line;
    while(getline(file,line)) {
        cout << line << endl;
    }
    file.close();

    return 0;
}
