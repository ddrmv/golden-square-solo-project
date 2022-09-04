class Menu
  def initialize
    @items = []
  end

  def add(listing)  # listing is a Listing object
    @items << listing
  end

  def available
    @items.select do |item|
      item.available?
    end
  end
end