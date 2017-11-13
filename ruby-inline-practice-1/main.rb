require 'inline'

class Cpp
  inline(:C) do |builder|
    builder.include '<iostream>'
    builder.add_compile_flags '-x c++', '-lstdc++'
    builder.c '
      int sum(int a, int b) {
        return a + b;
      }
    '
    builder.c '
      int diff(int a, int b) {
        return a - b;
      }
    '
  end
end

c = Cpp.new()
puts c.sum(1, 2)
puts c.diff(99, 100)
