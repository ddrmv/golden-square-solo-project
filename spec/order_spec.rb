require 'order'

RSpec.describe Order do
  describe "#add" do
    it "raises error if quantity is 0" do
      listing = double(:listing)
      order = Order.new

      expect { order.add(listing, 0) }.to raise_error "Quantity cannot be zero."
    end

    it "raises error if quantity is negative" do
      listing = double(:listing)
      order = Order.new
      expect { order.add(listing, -2) }.to raise_error "Quantity cannot be negative."
    end
  end

  describe "#all" do
    it "returns empty list when no items added" do
      order = Order.new
      expect(order.all).to eq []
    end

    it "returns a list of added lists of listings and quantity" do
      listing_1 = double(:listing)
      listing_2 = double(:listing)
      order = Order.new
      order.add(listing_1, 2)
      order.add(listing_2, 1)
      expect(order.all).to eq [[listing_1, 2], [listing_2, 1]]
    end
  end

end