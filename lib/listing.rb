class Listing
  def initialize(dish, price, availability = true)
    @dish = dish
    raise "Price must be a number." unless price.is_a? Numeric
    raise "Price cannot be negative." if price < 0
    @price = price.to_f
    @availability = availability
  end

  def name
    @dish.name
  end

  def price
    @price
  end

  def available?
    @availability
  end
end