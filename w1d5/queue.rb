class Queue

  def initialize(arr = [])
    @que = arr.dup
  end

  def enqueue(el)
    @que.unshift(el)
  end

  def dequeue
    @que.shift
  end

  def show
    @que.dup
  end

end

q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
p q.show
q.dequeue
q.dequeue
p q.show
q.enqueue(4)
p q.show
