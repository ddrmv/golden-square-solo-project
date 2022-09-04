# Solo project exercise

Solo project to exercise to practice:
- setting up project with bundler, rspec, twilio-ruby api, git, github
- OOD a multi-class system
- TDD with rspec
- visual representation of designed system with asciiflow
- appropriate scoping - cover all requirements and avoid feature creep
- mocking techniques for api testing and unit testing

## Meal Order Multi-Class Planned Design Recipe

### 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and
will be delivered before 18:52" after I have ordered.
```

### 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
Frist, verbs and nouns are extracted from the user stories.

#SEE LIST of DISHES with PRICES
to #ORDER #SELECT a NUMBER of SEVERAL AVAILABLE DISHES
#SEE ITEMISED RECEIPT with a TOTAL

Nouns:
order
dish list
dish (available?)
price

Verbs:
#see dish list+prices
#order
#select

An initial plan of the classes, not to be followed strictly but to be iterated
(this is used in the OOD design creation and not updated past step 2):

┌───────────────────────┐
│ Interface             │
│ ---------             │
│ #show_menu            │
│ #show_order           │
│ #add_listing_to_order │
└───────────▲─▲─────────┘
            │ │
            │ └───────────────────────┐
            │                         │
┌───────────┴───────────┐    ┌────────┴───────┐
│ OrderFormatter        │    │ MenuFormatter  │
│ --------------        │    │ -------------  │
│ #present_order        │    │ #present_menu  │
└───────────▲───────────┘    └────────▲───────┘
            │                         │
┌───────────┴───────────┐    ┌────────┴───────┐
│ Order                 │    │ Menu           │
│ -----                 │    │ ----           │
│ @listings = []        │    │ @listings = [] │
│                       │    │                │
│ #all                  │    │ #all           │
└────────────────────▲──┘    └▲───────────────┘
                     │        │
               ┌─────┴────────┴─┐
               │ Listing        │
               │ -------        │
               │ @dish          │
               │ @price         │
               │ @available     │
               │                │
               │ #available?    │
               └────────▲───────┘
                        │
               ┌────────┴───────┐
               │ Dish           │
               │ ----           │
               │ @name          │
               └────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Interface
  def initialize(terminal)
    @terminal = temrinal
  end

  def show_interface
    # show list of actions, including exit of the application:
    # - show menu, show order, add listing, finalize order, exit
  end

  def show_menu(menu_formatter)
  end

  def show_order(order_formatter)
  end

  def add_listing_to_order(listing, amount, order)
    # returns nothing
  end

  def finalize_order
    # mark order as complete - thanks the customer, send twilio text, exit
  end
end

class OrderFormatter
  def initialize(order)  # order is a Order object
    @order = order
  end
  
  def format_order
    # returns string of a formatted @order
  end

  def total
    # return calculated total of prices
  end
end

class MenuFormatter
  def initialize(menu)  # menu is a Menu object
    @menu = menu
  end
  
  def format_menu
    # returns string of a formatted @menu
  end
end

class Dish(name)  # name is a string with the dish name
end

class Listing(dish, price)  # dish is a Dish object
  @dish       # Dish object
  @price      # price of dish
  @available  # boolean that marks the order as available

  def available?
    # returns true/false denoting if listing is available
  end
end

# TBU - 
class Menu
  def initialize
    @items = []
  end

  def add(listing)  # listing is a Listing object
    # adds the listing to items
  end

  def available
    # return @items which are available
  end
end

class Order
  def initialize
    @items = []
  end

  def add(listing, quantity)  # listing is a Listing object, quantity is Integer
    # adds the listing to items
  end

  def all
    # return @items
  end
end
```

### 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
#1 populate and return the menu
menu = Menu.new
dish_1 = Dish.new("drink")
dish_2 = Dish.new("fish")
dish_3 = Dish.new("salad")
menu.add(dish_1, 3.50)
menu.add(dish_2, 5)
menu.add(dish_3, 4)
menu_formatter = MenuFormatter(menu)
interface = Interface.new
interface.show_menu(menu_formatter) # => "drink: 3.50\nfish: 5.00\nsalad: 4.00"

#2 show interface, receive input and exit
menu = Menu.new
dish_1 = Dish.new("fish")
menu.add = (dish_1, 3.50)
interface = Interface.new(Kernel)
interface.show_interface # => 
=begin
Enter selection
1: Show menu
2: Show order
3: Add item to order
4: Finalize order
9: Exit
=end

#3 display populated menu with prices
menu = Menu.new
dish_1 = Dish.new("fish")
menu.add = (dish_1, 3.50)
interface = Interface.new(Kernel)
menu_formatter = MenuFormatter.new(menu)
interface.show_menu(menu_formatter)  # =>
=begin
Menu
1: Fish (3.50)
=end

#4 add items to an order (a number of an item) and display the order (receipt)
menu = Menu.new
dish_1 = Dish.new("fish")
dish_2 = Dish.new("pasta")
menu.add = (dish_1, 3.50)
menu.add = (dish_1, 4)
interface = Interface.new(Kernel)
order = Order.new
order.add_listing_to_order(menu.available[1], 2, order)  # 2 x pasta
interface.show_order  # =>
=begin
Order
- Fish (3.50) x 2
Order total: 7.00
=end

#5 receive text after ordering (populate order, complete it, receive text)
menu = Menu.new
dish_1 = Dish.new("fish")
dish_2 = Dish.new("pasta")
menu.add = (dish_1, 3.50)
menu.add = (dish_1, 4)
interface = Interface.new(Kernel)
order = Order.new
order.add_listing_to_order(menu.available[1], 2, order)
interface.finalize_order  # =>
=begin
Thank you for your order.
# Twilio: Thank you! Your order was placed and will be delivered before 18:52
```

### 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# TBC - continue from here
```

_Encode each example as a test. You can add to the above list as you go._

### 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._