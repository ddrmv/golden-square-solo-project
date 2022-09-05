class MenuFormatter
  def initialize(menu)
    @menu = menu
  end

  def format_menu
    result = "Menu\n"
    @menu.available.each_with_index do |item, index|
      number_in_menu = index + 1
      dish_name = item.name.capitalize
      price = '%.2f' % item.price
      result << "#{number_in_menu}: #{dish_name} (#{price})\n"
    end
    return result.chomp
  end
end