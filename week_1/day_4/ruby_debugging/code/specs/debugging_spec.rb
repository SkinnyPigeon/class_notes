require 'minitest/autorun'
require_relative '../debugging'

class TestDebug < Minitest::Test

  def test_return_num_from_string_test
    assert_equal(3.1, return_number_from_string('3.1'))
  end

  def test_my_name_capitalized
    assert_equal('RICK', my_name_capitalized('Rick'))
  end

  def test_my_calc
    assert_equal(5, my_calc(2,3, nil))
    assert_equal(6, my_calc(2,3, 'mulitply'))
  end

  def test_print_score
    assert_equal('myTeam: 3', print_score([['myTeam', 3]]))
  end
  
  def test_text_lower_case
    assert_equal('hello world', text_lower_case('HellO WOrlD'))
  end

  def test_my_calc
    assert_equal(6, my_calc(2,3, 'multiply'))
  end

  def test_my_calc_divide
    assert_equal(5, my_calc(10,2, 'divide'))
  end

  def test_my_calc_calls_add
    assert_equal(8, my_calc(6,2, nil))
  end


end


