require 'menu_formatter'

RSpec.describe MenuFormatter do
  it "returns populated menu with prices and item numbers" do
    listing_1 = double(:listing, name: "fish", price: 3.50, availability: true)
    listing_2 = double(:listing, name: "chip one", price: 4, availability: true)
    listing_3 = double(:listing, name: "salad", price: 15, availability: true)
    menu = double(:menu, available: [listing_1, listing_2, listing_3])
    menu_formatter = MenuFormatter.new(menu)
    expect(menu_formatter.format_menu).to eq(
      "Menu\n1: Fish (3.50)\n2: Chip one (4.00)\n3: Salad (15.00)")
  end

  it "returns 'Menu' when menu is empty" do
    menu = double(:menu, available: [])
    menu_formatter = MenuFormatter.new(menu)
    expect(menu_formatter.format_menu).to eq("Menu")
  end
end