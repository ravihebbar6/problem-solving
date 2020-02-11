require '../data_structures/queue.rb'

x = Queue.new([1])
p x.size
p x.list

x.enqueue(1)
p x.list

x.enqueue(2)
p x.list

x.enqueue(3)
p x.list
p x.size

x.dequeue()
p x.list

x.dequeue()
p x.list

x.enqueue(10)
p x.list

x.dequeue()
p x.list

x.dequeue()
p x.list
