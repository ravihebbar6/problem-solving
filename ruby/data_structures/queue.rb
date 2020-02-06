class Node
	attr_accessor :item, :next

	def initialize(item)
		@item = item
		@next = nil
	end
end

class Queue
	attr_reader :front, :rear

	def initialize(items)
		return unless items
		items.each do |item|
			node = Node.new(item)
			@front = @rear = node unless @front
			@rear.next = node
			@rear = node
		end
	end

	def list
		return unless @front
		result = []
		temp = @front
		loop do
			result << temp.item
			break unless temp.next
			temp = temp.next
		end
		result
	end

	def enqueue(item)
		node = Node.new(item)
		if @front.nil?
			@front = @rear = node 
		else
			@rear.next = node
			@rear = node
		end
	end

	def dequeue
		return unless @front
		if @front == @rear
			@front = @rear = nil
			return 
		else
			temp = @front
			@front = @front.next
			temp = nil
		end
	end

	def size
		return 0 unless @front
		count = 0
		temp = @front
		loop do
			count += 1
			break unless temp.next
			temp = temp.next
		end
		count
	end
end
