require_relative "lib/product"
require_relative "lib/bundle"
require_relative "lib/order"

class FlowerShop
	attr_accessor :products

	def initialize
		@products = []
		seed_data
	end

	def take_orders
		puts "Enter your order here "

		order = Order.new

		while input = gets.chomp do
			case input
			when ""
				puts "All Items Entered"
				break
			else
				quantity, product_code = input.split(" ")
				quantity = quantity.to_i

				item = item_for_code(product_code)

				order.add_item(item, quantity)
				puts "Added #{quantity} of code #{product_code}"
			end
		end

		puts "Receipt: ", order.receipt
	end

	private

	def	bundle_for_item(item, quantity)
		item[:item].bundles.find { |bundle| bundle.quantity == quantity }
	end


	def item_for_code(product_code)
		products.find { |product| product.code == product_code }
	end

	def seed_data
		# add products
		rose = Product.new
		rose.name = "Roses"
		rose.code = "R12"
		rose.bundles = [Bundle.new(5, 6.99), Bundle.new(10, 12.99)]
		self.products << rose

		lillie = Product.new
		lillie.name = "Lillies"
		lillie.code = "L09"
		lillie.bundles = [Bundle.new(3, 9.95), Bundle.new(6, 16.95), Bundle.new(9, 24.95)]
		self.products << lillie

		tulip = Product.new
		tulip.name = "Tulips"
		tulip.code = "T58"
		tulip.bundles = [Bundle.new(3, 5.95), Bundle.new(5, 9.95), Bundle.new(9, 16.99)]
		self.products << tulip
	end

end

# Run the app and take orders
FlowerShop.new.take_orders
