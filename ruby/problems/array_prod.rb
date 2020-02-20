# Given an array arr[] of n integers, construct a Product Array prod[] (of same size) such that 
# prod[i] is equal to the product of all the elements of arr[] except arr[i].
# Solve it without division operator and in O(n).

# Example :
# arr[] = {10, 3, 5, 6, 2}
# prod[] = {180, 600, 360, 300, 900}

arr = [10, 3, 5, 6, 2]
result = []

# brute force
arr.each_with_index do |item, i|
	prod = 1
	arr.each_with_index do |item2, j|
		next if i == j
		prod = prod * item2
	end
	result << prod
end

puts "input #{arr.inspect}"
puts "result from brute force method #{result.inspect}\n"

# O(n) method
result = [1]
# left = [1]
# right = [1]

# construct left elements product array
arr.each_with_index do |item, i|
	next if i==0
	result[i] = arr[i-1] * result[i-1]
end
last_prod = 1
# construct right elements product array
arr.reverse_each.with_index do |item, j|
	next if j == 0
	last_prod = last_prod * arr[-1*j]
	result[arr.length-1-j] = result[arr.length-1-j] * last_prod
end

# construct result array
# left.each_with_index { |item, index| result << left[index] * right [index] }
puts "result from best method #{result.inspect}"