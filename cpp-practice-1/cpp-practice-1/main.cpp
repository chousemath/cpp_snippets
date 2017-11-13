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
    
    string x = "bacon";
    cout << "I love " + x << endl;
    
    int myInt = 6;
    cout << "I have " << myInt << " dogs" << endl;
    
    int a = 123;
    int b = 321;
    int abSum = a + b;
    int abDiff = a - b;
    
    cout << "The sum of " << a << " and " << b << " is " << abSum << endl;
    cout << "The diff of " << a << " and " << b << " is " << abDiff << endl;
    
    sayHello();
    return 0;
}
