require 'listing'

RSpec.describe Listing do
  it "#name returns listing name" do
    dish = double(:dish)
    expect(dish).to receive(:name).and_return("pasta")
    listing = Listing.new(dish, 3.50)
    expect(listing.name).to eq "pasta"
  end

  it "#price returns listing price" do
    dish = double(:dish)
    listing = Listing.new(dish, 3.50)
    expect(listing.price).to eq 3.50
  end

  it "#available? returns true when no availability is specified" do
    dish = double(:dish)
    listing = Listing.new(dish, 3.50)
    expect(listing.available?).to eq true
  end
end