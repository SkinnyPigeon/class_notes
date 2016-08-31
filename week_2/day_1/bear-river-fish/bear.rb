class Bear

  attr_reader(:name, :type)

  def initialize(name, type)
    @name = name
    @type = type
    @food = []
  end

  def roar
    return "Rooooar"
  end

  def food_count
    @food.length
  end

  def take_fish_from_river(river)
    fish = river.get_fish()
    @food << fish if !fish.nil?
  end

end