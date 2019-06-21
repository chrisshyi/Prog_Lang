module Helloer
  def sayHelloTwice
    puts "Hello Hello!"
    @foo = "bar"
  end
end

class MyClass
  include Helloer
end
