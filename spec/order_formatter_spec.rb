require 'order_formatter'

RSpec.describe OrderFormatter do
  it "returns good value when order is empty" do
    order = double(:order, all: [])
    order_formatter = OrderFormatter.new(order)
    expect(order_formatter.format_order).to eq(
      "Order\n" \
      "Order total: 0.00")
  end

  it "returns formatted order with total" do
    listing_1 = double(:listing, name: "fish", price: 3.50)
    listing_2 = double(:listing, name: "pasta", price: 4.00)
    order = double(:order, all: [[listing_1, 2], [listing_2, 1]])
    order_formatter = OrderFormatter.new(order)
    expect(order_formatter.format_order).to eq(
      "Order\n" \
      "- Fish (3.50) x 2 ... 7.00\n" \
      "- Pasta (4.00) x 1 ... 4.00\n" \
      "Order total: 11.00")
  end
end