require_relative ('lib/product')
require_relative ('lib/bundle')
require_relative ('lib/order')

class FlowerShop

	def initialize
		puts "Enter your order here "
		seed_data
		@order = order
	end

	def seed_data
		# add products
		rose = Product.new
		rose.name = "Roses"
		rose.code = "R12"
		rose.bundles = [Bundle.new(5, 6.99), Bundle.new(10, 12.99)]
		@flowers << rose

		lillie = Product.new
		lillie.prod_name = "Lillies"
		lillie.code = "L09"
		lillie.bundles = [Bundle.new(3, 9.95), Bundle.new(6, 16.95), Bundle.new(9, 24.95)]
		@flowers << lillie

		tulip = Product.new
		tulip.name = "Tulips"
		tulip.code = "T58"
		tulip.bundles = [Bundle.new(3, 5.95), Bundle.new(5, 9.95), Bundle.new(9, 16.99)]		
		@flowers << tulip
	end

end



# order = Order.new
# order.get_bundle(0,0)