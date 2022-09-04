class Listing
  def initialize(dish, price, availability = true)
    @dish = dish
    @price = price
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