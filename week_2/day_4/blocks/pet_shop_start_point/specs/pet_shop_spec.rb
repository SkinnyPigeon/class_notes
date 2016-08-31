require ('minitest/autorun')
require_relative ('../pet')
require_relative ('../pet_shop')

class TestPetShop < Minitest::Test

  def setup
    percy = Pet.new("Sir Percy", :cat, "British Shorthair", 500)
    bagdemagus = Pet.new("King Bagdemagus", :cat, "British Shorthair", 500)
    lancelot = Pet.new("Sir Lancelot", :dog, "Pomsky", 1000)
    arthur = Pet.new("Arthur", :dog, "Husky", 900)
    tristan = Pet.new("Tristan", :dog, "Basset Hound", 800)
    merlin = Pet.new( "Merlin", :cat, "Egyptian Mau", 1500)

    pets = [percy, bagdemagus, lancelot, arthur, tristan, merlin]
    
    @pet_shop = PetShop.new(pets)
      
  end

 def test_pet_merlin_is_cat
    pet_type = @pet_shop.pet_type("Merlin")
    assert_equal(:cat, pet_type)
 end

 def test_get_names_of_dogs
    dogs = @pet_shop.get_names_of_all_pets_of_type(:dog)
    assert_equal(["Sir Lancelot", "Arthur", "Tristan"], dogs)
 end

 def test_get_number_of_pets_costing_at_least_1000
    pets = @pet_shop.get_number_of_pets_costing_at_least(1000)
    assert_equal(2, pets)
 end

end
