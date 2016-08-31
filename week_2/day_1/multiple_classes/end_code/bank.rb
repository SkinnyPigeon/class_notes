def pets_by_breed(pet_shop, breed)

  matched_pets = []

  for pet in pet_shop[:pets]
    matched_pets << pet if pet[:breed] == breed
  end
  return matched_pets
end