class Node
	attr_accessor :item, :next

	def initialize(item)
		@item = item
		@next = nil
	end
end


class Stack
	attr_reader :top, :first

	def initialize(items)
		return unless items
		items.each do |item|
			node = Node.new(item)
			if top.nil?
				@top = @first = node
			else
				@top.next = node
				@top = node
			end
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

	def push(item)
		node = Node.new(item)
		if @top.nil?
			@first = @top = node 
		else
			@top.next = node
			@top = node
		end
	end

	def pop
		return unless @first
		temp = prev = @first
		if temp == @top
			@first = nil
		else
			loop do
				if temp.next.nil?
					temp = nil 		#top.next will still refer to last, immutable
					@top = prev
					@top.next = nil
					break
				end
				prev = temp
				temp = temp.next
			end
		end
	end
end