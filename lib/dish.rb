class Dish
  def initialize(name)
    raise "Dish name cannot be empty." if name.empty?
    @name = name
  end
  
  def name
    @name
  end
end