# Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
# For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
# Bonus: Can you do this in one pass?

array = [10, 15, 3, 7]
k = 17

# greedy

found = false
array.each_with_index do |x, i|
	array.each_with_index do |y, j|
		next if i==j
		if x+y == k
			found = true
			break
		end
	end
end
p found

# one pass
found = false
temp = []
array.each_with_index do |x, i|
	if temp.include? k-x
		found = true
		break
	end
	temp << array[i]
end
p found