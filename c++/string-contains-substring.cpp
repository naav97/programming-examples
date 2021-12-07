#include <iostream>
#include <string>
using namespace std;

int main() {
    string s = "Fvnjailhgdi";
    cout << s << endl;
    string ss = "jail";
    cout << ss << endl;

    bool contains = false;

    for(int i = 0; i < s.length(); i++) {
        if(s[i] == ss[0]) {
            bool init = true;
            for(int j = 0; j < ss.length(); j++) {
                if(s[i+j] != ss[j]) {
                    init = false;
                }
            }
            if(init){
                contains = true;
                break;
            }
        }
    }

    cout << contains << endl;
}
