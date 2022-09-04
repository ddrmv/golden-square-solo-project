require 'dish'

RSpec.describe Dish do
  it "raises error if initialized with empty string" do
    expect { Dish.new("") }.to raise_error "Dish name cannot be empty."
  end

  it "returns its name" do
    dish = Dish.new("fish")
    expect(dish.name).to eq "fish"
  end
end