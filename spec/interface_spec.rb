require 'interface'

RSpec.describe Interface do
  context "prints interface to terminal first" do
    it "rejects invalid input options, accepts valid menu option to exit" do
      terminal = double(:terminal)
      menu = double(:menu)
      order = double(:order)
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

    it "prints the menu to terminal when chosing the option" do
      # setting up mocks
      terminal = double(:terminal)
      menu = double(:menu)
      order = double(:order)
      menu_formatter = double(:menu_formatter)
      interface = Interface.new(terminal, menu, order)

      expect(terminal).to receive(:gets).and_return("1")
      expect(menu_formatter).to receive(:format_menu).and_return("test string")
      expect(terminal).to receive(:puts).with("test string")
      selection = interface.pick_menu_option
      expect(selection).to eq "1"
      interface.show_menu(menu_formatter)
    end
  end  
end