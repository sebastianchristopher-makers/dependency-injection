Dependency Injection
====================

--for storing my exercises for dependency injection unit. Original Makers repo [here]:https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/dependency_injection.md --
## Learn to

* Use dependency injection to test classes in isolation

## Introduction

Dependency injection is a technique for helping you test classes in isolation. It allows a class to use either its real dependency, or a double.

Consider this code:

```ruby
class Greeter
  def greet
    smiley = Smiley.new
    "Hello #{smiley.get}"
  end
end

class Smiley
  def get
    ":)"
  end
end

# > greeter = Greeter.new
# > greeter.greet
# => "Hello :)"
```

`Smiley` has no dependencies, so we can test it like this:

```ruby
it "returns a smiley" do
  smiley = Smiley.new
  expect(smiley.get).to eq ":)"
end
```

But `Greeter` depends on `Smiley`, and there's no easy way of sparating them out. The dependency is hard coded. We might say that `Greeter` is tightly coupled to `Smiley`.

We can't call `Greeter#greet` without calling `Smiley#get`. That means if `Smiley` breaks, then our tests for `Greeter` break — even when `Greeter` is doing exactly what it is supposed to. This makes it harder to track down bugs.

But we can rearrange the code like this:

```ruby
class Greeter
  def initialize(smiley = Smiley.new)
    @smiley = smiley
  end

  def greet
    "Hello #{@smiley.get}"
  end
end

class Smiley
  def get
    ":)"
  end
end
```

And then test both like this:

```ruby
# greeter_spec.rb

describe Greeter do
  describe "#greet" do
    it "prints a message and a smiley" do
      smiley_double = double :smiley, get: ":D"
      greeter = Greeter.new(smiley_double)
      expect(greeter.greet).to eq "Hello :D"
    end
  end
end

# smiley_spec.rb
describe Smiley do
  describe "#get" do
    it "returns a smiley" do
      smiley = Smiley.new
      expect(smiley.get).to eq ":)"
    end
  end
end
```

This is called **dependency injection**. Instead of hard coding the dependency, we 'inject' it into the class via the initializer.
