require_relative('pet')

class PetShop

  def initialize (input_pets)
    @pets = input_pets
  end

  def pet_type(pet_name)
    pet_found = @pets.find { |pet| pet.name == pet_name}.type  
  end

  def get_names_of_all_pets_of_type(pet_type)
    pets_of_type = @pets.select { |pet| pet.type == pet_type }
    pets_of_type.map { |pet| pet.name}
  end

  def get_number_of_pets_costing_at_least(amount)
    pets_found = @pets.select { |pet| pet.price >= amount }
    pets_found.count
  end
end