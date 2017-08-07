class Order
	attr_accessor :bundles, :line_items

	def initialize
		@line_items = {}
		@bundles = []
		# @buckets = {}
	end

	def add_item(item, quantity)
		line_items[item.code] = {
			item: item,
			quantity: quantity,
			bundles: bundles_for_item(item, quantity)
		}
	end

	def bundle_for_item(item, quantity)
		item.bundles.find { |bundle| bundle.quantity == quantity }
	end

	def bundle_options_for_item(item)
		item.bundles.map(&:quantity)
	end

	def bundles_for_item(item, quantity)
		buckets_high_to_low = bundle_options_for_item(item).sort.reverse

		buckets = {}

		while quantity > 0
			buckets_high_to_low.each do |bucket_size|
				bucket_size_sum = buckets_high_to_low.reduce(:+)

				bundle = bundle_for_item(item, bucket_size)
				while quantity >= bucket_size
					buckets[bucket_size] ||= { quantity: 0 }
					buckets[bucket_size][:quantity] += 1
					buckets[bucket_size][:bundle] ||= bundle
					quantity -= bucket_size
				end
			end

			break
		end

		buckets
	end

	def line_items_count
		line_items.count
	end

	def	total_cost
		line_items.values.map do |item|
			item[:bundles].map do |bundle_size, details|
				details[:bundle].price * details[:quantity]
			end.reduce(:+)
		end.reduce(:+)
	end

	def	items_count
		line_items.values.map{ |item| item[:quantity] }.reduce(:+)
	end

	def	receipt
		puts "Order contains #{items_count} total items:"

		line_items.each do |(item_code, line_item)|
			item = line_item[:item]
			quantity = line_item[:quantity]
			bundles = line_item[:bundles]
			line_total = bundles.values.map { |value| value[:bundle].price }.reduce(:+)

			puts "#{quantity} #{item.code} #{line_total}"
			bundles.each do |bundle_size, details|
				puts "    #{details[:quantity]} x #{bundle_size} $#{details[:bundle].price}"
			end
		end

		puts "Total cost: $#{total_cost}"
	end
end
