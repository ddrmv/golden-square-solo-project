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
    menu.add(dish_1, 3.50)
    menu.add(dish_2, 5)
    menu.add(dish_3, 4)
    menu_formatter = MenuFormatter(menu)
    interface = Interface.new
    expect(interface.show_menu(menu_formatter)).to eq 
      "Menu\nDrink (3.50)\nFish (5.00)\nSalad (4.00)"
  end
end
