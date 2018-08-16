#include <iostream>

using namespace std;

int main(int argc, char* argv[]) {
  cout << "Hello world!" << endl;

  if (argc > 1) {
    cout << "Received parameters:";
    for (unsigned i = 1; i < argc; i++) {
      cout << " " << argv[i];
    }
    cout << endl;
  }

  int x = 0;
  while(x != 1) {
    cout << "Enter a int value (1 to exit): " << endl;
    cin >> x;
  }

  return 0;
}
