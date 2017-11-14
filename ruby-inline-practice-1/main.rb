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

c = Cpp.new
c.parseTitanic
