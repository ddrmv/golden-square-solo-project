require 'dish'
require 'interface'
require 'listing'
require 'menu_formatter'
require 'menu'
require 'order_formatter'
require 'order'

RSpec.describe "integration" do
  it "populates and returns the menu" do
    dish_1 = Dish.new("drink")
    dish_2 = Dish.new("fish")
    dish_3 = Dish.new("salad")
    menu = Menu.new
    listing_1 = Listing.new(dish_1, 3.50)
    listing_2 = Listing.new(dish_2, 4)
    listing_3 = Listing.new(dish_3, 5)
    menu.add(listing_1)
    menu.add(listing_2)
    menu.add(listing_3)
    menu_formatter = MenuFormatter.new(menu)
    expect(menu_formatter.format_menu).to eq(
      "Menu\n1: Drink (3.50)\n2: Fish (4.00)\n3: Salad (5.00)")
  end

  it "prints the interface to terminal and receives valid menu option" do
    menu = Menu.new
    order = Order.new
    terminal = double(:terminal)
    interface = Interface.new(terminal, menu, order)
    expect(terminal).to receive(:puts).and_return("Pick option\n1: Show menu\n" \
      "2: Show order\n3: Add item to order\n4: Finalize order\n9: Exit")
    expect(terminal).to receive(:gets).and_return("20")
    expect(terminal).to receive(:gets).and_return("invalid choice 2")
    expect(terminal).to receive(:gets).and_return("9")
    interface.show_interface
    selection = interface.pick_menu_option
    expect(selection).to eq "9"
  end

  it "populates and returns the order" do
    menu = Menu.new
    dish_1 = Dish.new("fish")
    dish_2 = Dish.new("pasta")
    listing_1 = Listing.new(dish_1, 3.50)
    listing_2 = Listing.new(dish_2, 4.00)
    menu.add(listing_1)
    menu.add(listing_2)
    order = Order.new
    order.add(menu.available[0], 2)  # 2 x fish
    order.add(menu.available[1], 1)  # 2 x pasta
    order_formatter = OrderFormatter.new(order)
    expect(order_formatter.format_order).to eq(
      "Order\n" \
      "- Fish (3.50) x 2 ... 7.00\n" \
      "- Pasta (4.00) x 1 ... 4.00\n" \
      "Order total: 11.00")
  end

end
