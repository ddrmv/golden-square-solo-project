require 'menu'

RSpec.describe Menu do
  it "adds items and returns available" do
    listing_1 = double(:listing)
    listing_2 = double(:listing)
    expect(listing_1).to receive(:available?).and_return(false)
    expect(listing_2).to receive(:available?).and_return(true)
    menu = Menu.new
    menu.add(listing_1)
    menu.add(listing_2)
    expect(menu.available).to eq [listing_2]
  end

  it "returns empty array when no listings have been added" do
    menu = Menu.new
    expect(menu.available).to eq []
  end
end