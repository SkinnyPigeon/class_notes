require('pry-byebug')

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def pets_in_stock(pet_shop)
  return pet_shop[:pets]
end

def stock_count(pet_shop)
  return pets_in_stock(pet_shop).count
end

def admin(pet_shop)
  pet_shop[:admin]
end

def pets_sold(pet_shop)
  return admin(pet_shop)[:pets_sold]
end

def increase_pets_sold(pet_shop, value)
  admin(pet_shop)[:pets_sold] += value
end

def total_cash(pet_shop)
  cash = admin(pet_shop)[:total_cash]
  return cash
end

def add_or_remove_cash(pet_shop,value)
  admin(pet_shop)[:total_cash] += value
end

def pets_by_breed(pet_shop, breed)
  binding.pry
  matches = []
  for pet in pets_in_stock(pet_shop)
    matches << pet if(pet[:breed] == breed)
  end
  return matches
end

def find_pet_by_name(pet_shop, pet_name)
  match = nil
  for pet in pets_in_stock(pet_shop)
    match = pet if(pet[:name] == pet_name)
  end
  return match
end

def remove_pet_by_name(pet_shop, pet_name)
  pets = pets_in_stock(pet_shop)
  index = 0
  match = nil

  for pet in pets
    if(pet[:name] == pet_name)
      match = pet
      break
    end
    index += 1
  end

  return if(match == nil)
  pets.delete_at(index)
end

def add_pet_to_stock(pet_shop, pet)
  pets_in_stock(pet_shop).push(pet)
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if (pet == nil)
  return if !(customer_can_afford_pet(customer, pet))

  add_pet_to_customer(customer,pet)
  add_or_remove_cash(pet_shop, pet[:price])
  remove_pet_by_name(pet_shop, pet[:name])
  increase_pets_sold(pet_shop,1)
end