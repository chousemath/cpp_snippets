#include <iostream>

using namespace std;

int main() {
  // declare a variable
  int a;
  int b;
  int sum;

  cout << "Enter a number: ";
  cin >> a;
  cout << "You just entered: " << a << endl; 
  cout << "Enter another number: ";
  cin >> b;
  cout << "You just entered: " << b << endl; 
  sum = a + b;
  cout << "The sum of a and b is: " << sum << endl;
  return 0;
}
