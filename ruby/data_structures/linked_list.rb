class Node
	attr_accessor :item, :next

	def initialize(item)
		@item = item
		@next = nil
	end
end

class LinkedList
	attr_reader :first

	def add(item)
		return unless item
		node = Node.new(item)
		if @first.nil?
			@first = node
		else
			temp = @first
			loop do
				break unless temp.next
				temp = temp.next
			end
			temp.next = node
			temp = node
		end
	end

	def list
		return unless @first
		result = []
		temp = @first
		loop do
			result << temp.item
			break unless temp.next
			temp = temp.next
		end
		result
	end

	def length
		return 0 unless @first
		length = 0
		temp = @first
		loop do
			length += 1
			break unless temp.next
			temp = temp.next
		end
		length
	end		
end
