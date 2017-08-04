require_relative ('lib/product')
require_relative ('lib/bundle')
require_relative ('lib/order')


# add products
p = Product.new
p.name = "Roses"
p.code = "R12"
p.bundles = [Bundle.new(5, 6.99), Bundle.new(10, 12.99)]

p1 = Product.new
p1.name = "Lillies"
p1.code = "L09"
p1.bundles = [Bundle.new(3, 9.95), Bundle.new(6, 16.95), Bundle.new(9, 24.95)]

p2 = Product.new
p2.name = "Tulips"
p2.code = "T58"
p2.bundles = [Bundle.new(3, 5.95), Bundle.new(5, 9.95), Bundle.new(9, 16.99)]

# order = Order.new
# order.get_bundle(0,0)