class Hello
  def initialize(f, g)
    @foo = f
    @bar = g
  end
  def say_hello
    puts "hello there!"
  end
  def more_than_3 (x)
    if x > 3  
      puts "more than 3"
    else
      puts "not more than 3"
    end
  end

  def set_foo(x)
    @foo = x 
  end
  def foo
    @foo
  end
end

def add_two_nums (x, y)
  x + y
end
