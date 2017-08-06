class Product

	attr_accessor :name, :code, :bundles
	
	def	bundle_sizes
		bundles.map(&:items)
	end
end