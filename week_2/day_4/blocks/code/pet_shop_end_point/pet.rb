class Pet
  attr_reader(:name, :type, :breed, :price)

  def initialize(input_name, input_type, input_breed, input_price)
    @name = input_name
    @type = input_type
    @breed = input_breed
    @price = input_price
  end

end