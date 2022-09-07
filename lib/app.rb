require_relative 'dish.rb'
require_relative 'interface'
require_relative 'listing'
require_relative 'menu_formatter'
require_relative 'menu'
require_relative 'order_formatter'
require_relative 'order'

dish_1 = Dish.new("drink")
dish_2 = Dish.new("fish")
dish_3 = Dish.new("salad")
listing_1 = Listing.new(dish_1, 3.50)
listing_2 = Listing.new(dish_2, 4)
listing_3 = Listing.new(dish_3, 5)
menu = Menu.new
menu.add(listing_1)
menu.add(listing_2)
menu.add(listing_3)
order = Order.new
menu_formatter = MenuFormatter.new(menu)
order_formatter = OrderFormatter.new(order)
# order = Order.new
interface = Interface.new(Kernel, menu, order)
selection = "0"
looper_flag = true
while looper_flag
  interface.show_interface
  selection = interface.pick_menu_option
  case selection
  when "1"
    interface.show_menu(menu_formatter)
  when "2"
    interface.show_order(order_formatter)
  when "3"
    interface.add_listing_to_order(listing, order)
  when "4"
    interface.finalize_order
  when "9"
    looper_flag = false
  else
  end

end