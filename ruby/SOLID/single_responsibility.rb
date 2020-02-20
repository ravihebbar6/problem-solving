# Bad Code
class InvoceDetail
	def initialize(amount)
		@amount = amount
	end

	def print
		p "Total amount is: #{@amount}"
	end

	def store
		p "Stored amount onto db"
	end

	def calculateShippingCharge
		p "Shipping charge is #{@amount * 0.5}"
	end
end

invoice = InvoceDetail.new(10)
invoice.print
invoice.store
invoice.calculateShippingCharge
invoice.print

# Good code with Single responsibily design
# https://ieftimov.com/post/solid-principles-ruby/

module StoreInvoceDetail
	def store
		p "Stored amount onto db"
	end
end

module ShippingChargeCalculator
	def calculateShippingCharge
		p "Shipping charge is #{@amount * 0.5}"
	end
end

class InvoceDetail
	extend StoreInvoceDetail
	extend ShippingChargeCalculator

	attr_accessor :amount

	def print
		p "Total amount is: #{@amount}"
	end
end

invoice = InvoceDetail.new(20)
invoice.print
invoice.store
invoice.calculateShippingCharge
invoice.print
