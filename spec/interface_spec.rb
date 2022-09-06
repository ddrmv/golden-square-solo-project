require 'interface'

RSpec.describe Interface do
  it "prints the interface to terminal and receives valid menu option" do
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
end