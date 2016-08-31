require('minitest/autorun')
require_relative('../bear.rb')
require_relative('../river.rb')
require_relative('../fish.rb')


class TestBear < MiniTest::Test

  def setup
    @bear = Bear.new("Yogi", "Grizzly")

    fish1 = Fish.new("Bob")
    fish2 = Fish.new("Harry")
    fish3 = Fish.new("Fred")
    fishes = [fish1, fish2, fish3]

    @river = River.new( fishes )
  end

  def test_bear_name
    assert_equal("Yogi", @bear.name()  )
  end

  def test_bear_type
    assert_equal("Grizzly", @bear.type()  )
  end

  def test_bear_roar
    assert_equal("Rooooar", @bear.roar() )
  end

  def test_bear_has_empty_food
    assert_equal(0, @bear.food_count)
  end

  def test_bear_can_take_food_from_river
    @bear.take_fish_from_river( @river )
    assert_equal( 1, @bear.food_count() )
  end

  def test_bear_cant_take_food_from_empty_river
    empty_river = River.new( [] )
    @bear.take_fish_from_river( empty_river )
    assert_equal( 0, @bear.food_count() )
  end
end