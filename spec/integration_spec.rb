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
end
