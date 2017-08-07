require "spec_helper"
require_relative "../lib/order"
require_relative "../lib/product"
require_relative "../lib/bundle"

RSpec.describe Order do
  subject { Order.new }

  let(:product_bundles) do
    [
      Bundle.new(5, 6.99),
      Bundle.new(10, 12.99)
    ]
  end

  let(:product) do
    Product.new.tap do |product|
      product.name = "Roses"
      product.code = "R12"
      product.bundles = product_bundles
    end
  end

  it "adds an item" do
    subject.add_item(product, 5)

    expect(subject.line_items.size).to eq(1)
  end

  it "creates a single bucket" do
    quantity = 5
    subject.add_item(product, quantity)
    bundles = subject.bundles_for_item(product, quantity)

    expected_bundle = bundles[quantity][:bundle]

    expect(expected_bundle).to eq(product_bundles.first)
  end

  it "creates multiple buckets" do
    quantity = 15
    subject.add_item(product, quantity)
    bundles = subject.bundles_for_item(product, quantity)

    # expected_bundle = bundles[quantity][:bundle]
    expect(bundles[5][:bundle]).to eq(product_bundles.first)
    expect(bundles[5][:quantity]).to eq(1)
    expect(bundles[10][:bundle]).to eq(product_bundles.last)
    expect(bundles[10][:quantity]).to eq(1)
  end
end
