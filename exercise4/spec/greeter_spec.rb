require 'greeter'

describe Greeter do
  it 'takes a user\'s name and says hello it them' do
    kernel = double(:kernel, gets: "Name")
    greeter = Greeter.new(kernel)
    expect { greeter.greet }.to output("What is your name?\nHello, Name\n").to_stdout
  end
end
