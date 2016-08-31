require_relative('pizza')
require('pry-byebug')

class Sales

  def initialize (pizzas)
    @pizzas = pizzas
  end

  def total_revenue
    total = 0
    @pizzas.each { |pizza| total += (pizza.quantity * 10)}
    return total
  end

  def total_pizza_of_type(topping)
    total = 0
    @pizzas.each { |pizza| total += pizza.quantity if (pizza.topping == topping)}

    return total
  end
end