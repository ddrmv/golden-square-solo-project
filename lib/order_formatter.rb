class OrderFormatter
  def initialize(order)  # order is a Order object
    @order = order
  end
  
  def format_order
    result = "Order\n"
    running_total = 0
    @order.all.each_with_index do |item|
      listing, quantity = item[0], item[1]
      result << "- #{listing.name.capitalize} (#{'%.2f' % listing.price}) x "
      result << "#{quantity} ... #{'%.2f' % (listing.price * quantity)}\n"
      running_total += listing.price * quantity
    end
    result << "Order total: #{'%.2f' % running_total}"
    result
  end

  private

  def order_total
    @order.map do |listing|
      listing.price
    end.sum
  end

  def listing_total(listing, quantity)
    listing.price * quantity
  end
end