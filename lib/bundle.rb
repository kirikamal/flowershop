class Bundle

	attr_accessor :name, :items, :price

	def initialize(name, items, price)
		@name = name
		@items = items
		@price = price
	end

end