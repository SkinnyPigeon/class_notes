require('minitest/autorun')
require_relative('../river.rb')
require_relative('../fish.rb')


class TestRiver < Minitest::Test
  def setup
    fish1 = Fish.new("Bob")
    fish2 = Fish.new("Harry")
    fish3 = Fish.new("Fred")
    fishes = [fish1, fish2, fish3]

    @river = River.new( fishes )

  end

  def test_initial_state
    assert_equal( 3, @river.number_of_fishes() )
  end

  def test_can_get_fish
    retrieved_fish = @river.get_fish()
    assert_equal( "Fred", retrieved_fish.name() )
  end

  def test_loses_fish
    @river.get_fish()
    assert_equal( 2, @river.number_of_fishes() )
  end

end