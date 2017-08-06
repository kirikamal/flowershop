class Order
	attr_accessor :bundles, :line_items

	def initialize
		@line_items = {}
		@bundles = []
	end

	def add_item(item, quantity)
		line_items[item.name] = { item: item, quantity: quantity }
	end

	def	calculate_bundles
		bundles = []
		# wwe need to check the bundle sizes for each line item type
		line_items.each do |key, item|
			puts "#{key}, (#{item[:item]}, #{item[:quantity]})"
			puts bundles_for_item(item)
		end
	end

	def bundle_options_for_item(item)
		# Array - 5 item roses, 10 items roses, 3 item litllie
		item[:item].bundles.map(&:items)
	end

	def bundles_for_item(item)
		buckets_high_to_low = bundle_options_for_item(item).sort.reverse
		puts "foo: " + item.inspect
		quantity = item[:quantity]

		while quantity > 0
			buckets_high_to_low.each do |bucket_size|
				puts "Rose Count: #{quantity}"
				puts "Bucket Size: #{bucket_size}"

				while quantity >= bucket_size
					puts "quantity > bucket_size"

					if bucket_size < quantity
						puts "bucket_size < quantity"
						buckets[bucket_size] += 1
						quantity -= bucket_size
					elsif bucket_size >= quantity
						puts "bucket_size >= quantity"
						buckets[bucket_size] += 1
						quantity -= bucket_size
					else
						break
					end
				end
			end

			puts buckets.inspect
			puts "Left over roses: #{quantity}"

			break
			# rose_count -= someval
			# rose_count = 0
		end
	end
	
	def line_items_count
		line_items.count
	end

	def	total_cost
		line_items.values.map{ |item| item[:item].price }.reduce(:+)
	end

	def	items_count
		line_items.values.map{ |item| item[:quantity] }.reduce(:+)
	end

	def	receipt
		puts line_items.inspect
	end

	def getb_bundle(number_of_items, code_of_product)
		
		# Get the product

		# breakdown into optimized bundles

		# return the result
	end
end