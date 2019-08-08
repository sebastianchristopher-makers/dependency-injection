#Amend the following class to be testable in isolation, then write the tests for it.
class Greeter
  def initialize(kernel = Kernel)
    @kernel = kernel
  end
  def greet
    puts "What is your name?"
    name = @kernel.gets.chomp
    puts "Hello, #{name}"
  end
end
