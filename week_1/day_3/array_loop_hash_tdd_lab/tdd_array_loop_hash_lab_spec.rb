require('minitest/autorun')
require('./tdd_array_loop_hash_lab')

class Lab < MiniTest::Test
  def test_add_array_lengths
    prices = [ 1.23, 6.98, 8.43, 2.45 ]
    costs = [ 4.23, 1.12, 0.52, 8.67 ]

    add_array_lengths_result = add_array_lengths(prices, costs)
    assert_equal(8, add_array_lengths_result)
  end

  def test_sum_array
    data = [ 1, 2, 3, 4 ,5 ]

    sum_array_result = sum_array(data)
    assert_equal(15, sum_array_result)
  end

  def test_find_item
    hogwarts = [ 'Hufflepuff', 'Slytherin', 'Gryffindor', 'Ravenclaw' ]

    find_item_result = find_item?('Ravenclaw', hogwarts)
    assert_equal(true, find_item_result)
  end

  def test_first_key_name
    teacher_wallets = {
      'Sandy' => 12,
      'Kat'  => 10,
      'Val'  => 1356,
      'Rick' => 1
    }

    first_key_name_result = first_key_name(teacher_wallets)
    assert_equal('Sandy', first_key_name_result)
  end

  def test_array_of_capitals
    countries = {
      uk: {
        capital: 'London',
        population: 60
      },
      france: {
        capital: 'Paris',
        population: 70
      },
      italy: {
        capital: 'Rome',
        population: 56
      }
    }

    array_of_capitals_result = first_level_hash_values(countries, :capital)
    assert_equal([ 'London', 'Paris', 'Rome' ], array_of_capitals_result)
  end

end