require '../data_structures/linked_list.rb'

x = LinkedList.new
x.add(1)
p x.list
p "length is #{x.length}"

x.add(2)
p x.list

x.add(2)
p x.list

x.add(2)
p x.list
p "length is #{x.length}"
