// pre processor directive
// we are going to be including a file in order to run this program
#include <iostream>

// include a library (std)
using namespace std;

// an example of a function
void sayHello()
{
    cout << "Hello from a function!" << endl;
}

// what kind of data are you returning
int main()
{
    cout << "Hello world!" <<endl;
    cout << "I am a C++ program" << endl;
    cout << "Here is some more text" << endl;
    cout << "Man I love bacon" << endl;
    cout << "I love ";
    cout << "dogs!" << endl;
    cout << "This should end as a new line \n";
    sayHello();
    return 0;
}
