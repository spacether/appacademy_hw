class Stack
  def initialize(arr = [])
    # create ivar to store stack here!
    @stack = arr.dup
  end

  def add(el)
    # adds an element to the stack
    @stack << el
  end

  def remove
    # removes one element from the stack
    @stack.pop
  end

  def show
    # return a copy of the stack
    @stack.dup
  end
end

s = Stack.new((0..5).to_a)
p s.show
s.add(5)
p s.show
s.remove
s.remove
p s.show
