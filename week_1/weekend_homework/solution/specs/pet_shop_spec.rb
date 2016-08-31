require 'minitest/autorun'
require_relative '../pet_shop'

class TestPetShop < Minitest::Test

  def setup

    @customers = [
      {
        name: "Valerie",
        pets: [],
        cash: 1000
      },
      {
        name: "Zsolt",
        pets: [],
        cash: 50
      }
    ]

    @new_pet = {
            name: "Bors the Younger",
            pet_type: :cat,
            breed: "Cornish Rex",
            price: 100
          }

    @pet_shop = {
        pets: [
          {
            name: "Sir Percy",
            pet_type: :cat,
            breed: "British Shorthair",
            price: 500
          },
          {
            name: "King Bagdemagus",
            pet_type: :cat,
            breed: "British Shorthair",
            price: 500
          },
          {
            name: "Sir Lancelot",
            pet_type: :dog,
            breed: "Pomsky",
            price: 1000,
          },
          {
            name: "Arthur",
            pet_type: :dog,
            breed: "Husky",
            price: 900,
          },
          {
            name: "Tristan",
            pet_type: :dog,
            breed: "Basset Hound",
            price: 800,
          },
          {
            name: "Merlin",
            pet_type: :cat,
            breed: "Egyptian Mau",
            price: 1500,
          }
        ],
        admin: {
          total_cash: 1000,
          pets_sold: 0,
        },
        name: "Camelot of Pets"
      }
  end

  #MANDATORY
  def test_pet_shop_name
    name = pet_shop_name(@pet_shop)
    assert_equal(name, "Camelot of Pets")
  end

  def test_total_cash
    sum = total_cash(@pet_shop)
    assert_equal(sum, 1000)
  end

  def test_add_or_remove_cash__add
    add_or_remove_cash(@pet_shop,10)
    cash = total_cash(@pet_shop)
    assert_equal(cash, 1010)
  end

  def test_add_or_remove_cash__remove
    add_or_remove_cash(@pet_shop,-10)
    cash = total_cash(@pet_shop)
    assert_equal(cash, 990)
  end

  def test_pets_sold
    sold = pets_sold(@pet_shop)
    assert_equal(sold, 0)
  end

  def test_increase_pets_sold
    increase_pets_sold(@pet_shop,2)
    sold = pets_sold(@pet_shop)
    assert_equal(sold,2)
  end

  def test_stock_count
    count = stock_count(@pet_shop)
    assert_equal(count,6)
  end

  def test_all_pets_by_breed__found
    pets = pets_by_breed(@pet_shop, "British Shorthair")
    assert_equal(pets.count, 2)
  end

  def test_all_pets_by_breed__not_found
    pets = pets_by_breed(@pet_shop, "Dalmation")
    assert_equal(pets.count, 0)
  end

  def test_find_pet_by_name__returns_pet
    pet = find_pet_by_name(@pet_shop, "Arthur")
    assert_equal(pet[:name], "Arthur")
  end

  def test_find_pet_by_name__returns_nil
    pet = find_pet_by_name(@pet_shop, "Fred")
    assert_equal(pet, nil)
  end

  def test_remove_pet_by_name
    remove_pet_by_name(@pet_shop, "Arthur")
    pet = find_pet_by_name(@pet_shop,"Arthur")
    assert_equal(pet, nil)
  end

  def test_add_pet_to_stock
    add_pet_to_stock(@pet_shop, @new_pet)
    count = stock_count(@pet_shop)
    assert_equal(count,7)
  end

  def test_customer_pet_count
    count = customer_pet_count(@customers[0])
    assert_equal(count, 0)
  end

  def test_add_pet_to_customer
    customer = @customers[0]
    add_pet_to_customer(customer, @new_pet)
    assert_equal(customer_pet_count(customer),1)
  end

  #OPTIONAL

  def test_customer_can_afford_pet__insufficient_funds
    customer = @customers[1]
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)
    assert_equal(can_buy_pet, false)
  end

  def test_customer_can_afford_pet__sufficient_funds
    customer = @customers[0]
    can_buy_pet = customer_can_afford_pet(customer, @new_pet)
    assert_equal(can_buy_pet, true)
  end

  #These are 'integration' tests so we want multiple asserts.
  #If one fails the entire test should fail
  def test_sell_pet_to_customer__pet_found
    customer = @customers[0]
    pet = find_pet_by_name(@pet_shop,"Arthur")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(customer_pet_count(customer),1)
    assert_equal(pets_sold(@pet_shop),1)
    assert_equal(total_cash(@pet_shop), 1900)
  end

  def test_sell_pet_to_customer__pet_not_found
    customer = @customers[0]
    pet = find_pet_by_name(@pet_shop,"Dave")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(customer_pet_count(customer),0)
    assert_equal(pets_sold(@pet_shop),0)
    assert_equal(total_cash(@pet_shop), 1000)
  end

  def test_sell_pet_to_customer__insufficient_funds
    customer = @customers[1]
    pet = find_pet_by_name(@pet_shop,"Arthur")

    sell_pet_to_customer(@pet_shop, pet, customer)

    assert_equal(customer_pet_count(customer),0)
    assert_equal(pets_sold(@pet_shop),0)
    assert_equal(total_cash(@pet_shop), 1000)
  end

end