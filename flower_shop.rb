require_relative ('lib/product')
require_relative ('lib/bundle')
require_relative ('lib/order')

class FlowerShop

	def initialize
		puts "Enter your order here "
		@flowers = []
		seed_data		
	end

	def seed_data
		# add products
		rose = Product.new
		rose.name = "Roses"
		rose.code = "R12"
		# rose.bundles = [Bundle.new(5, 6.99), Bundle.new(10, 12.99)]
		@flowers << rose

		lillie = Product.new
		lillie.name = "Lillies"
		lillie.code = "L09"
		# lillie.bundles = [Bundle.new(3, 9.95), Bundle.new(6, 16.95), Bundle.new(9, 24.95)]
		@flowers << lillie

		tulip = Product.new
		tulip.name = "Tulips"
		tulip.code = "T58"
		# tulip.bundles = [Bundle.new(3, 5.95), Bundle.new(5, 9.95), Bundle.new(9, 16.99)]		
		@flowers << tulip
	end

end

rose = Product.new
rose.name = "Roses"
rose.code = "R12"
rose.bundles = [Bundle.new("5 Rose Pack", 5, 6.99), Bundle.new("10 Rose Pack", 10, 12.99)]
# puts "rose Bundle Sizes: #{rose.bundle_sizes}"

lillie = Product.new
lillie.name = "lillies"
lillie.code = "L09"
lillie.bundles = [Bundle.new("5 lillie Pack", 3, 6.99), Bundle.new("10 lillie Pack", 6, 12.99)]
# puts "lillie Bundle Sizes: #{lillie.bundle_sizes}"

small_bundle = rose.bundles.first
big_bundle = rose.bundles.last

order = Order.new
# i want 15 roses, not 2 bundles of X
# order.add_item(small_bundle)
# order.add_item(small_bundle)
# order.add_item(big_bundle)
order.add_item(rose, 10)
order.add_item(lillie, 4)
# order.add_item(small_bundle)
# order.add_item(big_bundle)

order.calculate_bundles
puts order.bundles
exit

# puts "order contains #{order.line_items_count} line items"
puts "order contains #{order.items_count} total items"
order.line_items.each do |line_item|
	puts "item: #{line_item}"
end
# puts "Total Cost: #{order.total_cost}"

# puts "receipt: #{order.receipt}"

FlowerShop.new

# order.get_bundle(0,0)