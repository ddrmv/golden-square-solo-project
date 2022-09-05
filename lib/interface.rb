class Interface
  def initialize(terminal, menu, order)
    @terminal = terminal
    @menu = menu
    @order = order
  end

  def show_interface
    @terminal.puts ("Pick option\n1: Show menu\n" \
    "2: Show order\n3: Add item to order\n4: Finalize order\n9: Exit")
  end

  def pick_menu_option
    valid_options = ["1", "2", "3", "4", "9"]
    selected_option = ""
    while !valid_options.include?(selected_option)
      selected_option = @terminal.gets.chomp
    end
    return selected_option
  end

  def show_menu(menu_formatter)
    terminal.puts(menu_formatter)
  end

  def show_order(order_formatter)
    terminal.puts(order_formatter)
  end

  def add_listing_to_order(listing, order)  # amount selected inside function
    # returns nothing
  end

  def finalize_order
    # mark order as complete - thanks the customer, send twilio text, exit
  end
end
