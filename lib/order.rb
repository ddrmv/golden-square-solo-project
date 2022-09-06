class Order
  def initialize
    @items = []
  end

  def add(listing, quantity)  # listing is a Listing object, quantity is Integer
    raise "Quantity cannot be zero." if quantity == 0
    raise "Quantity cannot be negative." if quantity < 0
    @items << [listing, quantity]
  end

  def all
    @items
  end
end