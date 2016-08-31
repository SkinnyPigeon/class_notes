require( 'minitest/autorun' )
require_relative( '../my_functions' )

class My_Functions < MiniTest::Test

  def test_my_name()
    name = my_name()
    assert_equal( 'Rick', name )
  end

  def test_add()
    result = add( 2, 2 ) 
    assert_equal( 4, result )
  end

  def test_greeting()
    assert_equal( "It's Monday!", greeting( 1 ) )
    assert_equal( "It's Tuesday!", greeting( 2 ) )
  end

end