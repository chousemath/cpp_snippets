### C++ / RubyInline

### **C++ Source**
```c_cpp
#include <fstream>
#include <iostream>

void parseTitanic(std::string filePath) {
  // declare input file stream variable
  std::ifstream inFile;
  // open a new file stream
  inFile.open(filePath); 
  // file open could fail for any of the following reasons
  // (1) file does not exist
  // (2) someone else is writing to that file
  if (!inFile) {
    std::cerr << "Unable to open the requested file..." << std::endl;
    exit(1);
  }
  // line will contain each row of the CSV file
  std::string line; 
  // value will contain the data of interest
  std::string value;
  // size_t is an unsigned integral type
  size_t pos = 0;
  double age;
  int menOver25 = 0;
  int womenOver25 = 0;
  // throw away the first line
  std::getline(inFile, line); 
  while (std::getline(inFile, line)) {
    // remove up to beginning of name
    pos = line.find("\",\"");
    line.erase(0, pos + 3);
    // remove name
    pos = line.find("\",\"");
    line.erase(0, pos + 3);
    // remove up to beginning of age
    pos = line.find(",");
    line.erase(0, pos + 1);
    // actually get stringified age
    pos = line.find(",");
    value = line.substr(0, pos);
    line.erase(0, pos + 1);
    if (value == "NA") { continue; }
    age = ::atof(value.c_str());
    if (age > 25.0) {
      pos = line.find(",");
      value = line.substr(0, pos);
      if (value == "\"male\"") { menOver25++; }
      else { womenOver25++; }
    }
  } 
  inFile.close();
  std::cout << "Number of men over 25 on the Titanic: " << menOver25 << std::endl;
  std::cout << "Number of women over 25 on the Titanic: " << womenOver25 << std::endl;
}

int main() {
  parseTitanic("/Users/jo/Desktop/scripts/cpp_snippets/ruby-inline-practice-1/test/titanic.csv");
  return 0;
}
```

> It is trivial to convert the C++ source into a native extension in Ruby using the RubyInline gem

### **Dependencies**
```shell
# you need to have gcc/g++ already installed
gem install RubyInline
```

### **Port over to Ruby code**
```ruby
require 'inline'

class Cpp
  inline(:C) do |builder|
    builder.include '<iostream>'
    builder.include '<fstream>'
    builder.add_compile_flags '-x c++', '-lstdc++'
    builder.c '
      void parseTitanic() {
        std::string filePath = "/Users/jo/Desktop/scripts/cpp_snippets/ruby-inline-practice-1/test/titanic.csv";
        std::ifstream inFile;
        inFile.open(filePath); 
        if (!inFile) {
          std::cerr << "Unable to open the requested file..." << std::endl;
          exit(1);
        }
        std::string line; 
        std::string value;
        size_t pos = 0;
        double age;
        int menOver25 = 0;
        int womenOver25 = 0;
        std::getline(inFile, line); 
        while (std::getline(inFile, line)) {
          pos = line.find("\",\"");
          line.erase(0, pos + 3);
          pos = line.find("\",\"");
          line.erase(0, pos + 3);
          pos = line.find(",");
          line.erase(0, pos + 1);
          pos = line.find(",");
          value = line.substr(0, pos);
          line.erase(0, pos + 1);
          if (value == "NA") { continue; }
          age = ::atof(value.c_str());
          if (age > 25.0) {
            pos = line.find(",");
            value = line.substr(0, pos);
            if (value == "\"male\"") { menOver25++; }
            else { womenOver25++; }
          }
        } 
        inFile.close();
        std::cout << "Number of men over 25 on the Titanic: " << menOver25 << std::endl;
        std::cout << "Number of women over 25 on the Titanic: " << womenOver25 << std::endl;
      }
    '
  end
end

c = Cpp.new()
c.parseTitanic
```

### **Why would you want to do this?**
* performance of C++ when it matters
* comfort of Ruby the rest of the time
