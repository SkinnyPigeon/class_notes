require_relative('../models/pizza')
require_relative('../models/sales')
require('pry-byebug')

pizzas = Pizza.all()
sales = Sales.new(pizzas)

p = Pizza.new({"first_name" => "Jack", "last_name" => "Jarvis", "topping" => "Napoli", "quantity" => 20})

p.save

binding.pry
nil