class Order
  attr_reader :ordered, :menu

  def initialize(restaurant_menu)
    @ordered = {}
    @menu = restaurant_menu
  end

  def add(dish, quantity)
    raise "#{dish.name} is not on the menu!" unless menu.has_dish?(dish)
    @ordered[dish.name] = [dish.price, quantity]
  end

  def total
    "£%.2f" % @ordered.map { |key, value| value.inject(:*)}.sum
  end

  def receipt
    receipt = "Order: "
    ordered.each do |key, value|
      receipt << "#{key}, £#{value[0].round(2)} x#{value[1].round(2)} = £#{(value[0] * value[1]).round(2)} \n"
    end
    receipt << "Total Price: comes to #{total}"
  end
end
