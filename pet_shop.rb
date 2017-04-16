def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
 new_cash_balance = pet_shop[:admin][:total_cash] += cash
 return new_cash_balance
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets)
  current_pets_sold = pet_shop[:admin][:pets_sold] += number_of_pets
  return current_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, searched_breed)
  pets_by_breed_found = []
  for pet in pet_shop[:pets] do
    pets_by_breed_found.push(pet) if pet[:breed] == searched_breed
  end
  return pets_by_breed_found
end

def find_pet_by_name(pet_shop, actual_name)
  for pet_name in pet_shop[:pets] do
    return pet_name if pet_name[:name] == actual_name
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets] do
    pet_shop[:pets].delete(pet) if pet[:name] == name
  end
  return nil
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customers)
  customers[:pets].count()
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet) 
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer[:cash] >= pet[:price]
    customer[:pets].push(pet)
    pet_shop[:admin][:pets_sold] += 1
    pet_shop[:admin][:total_cash] += pet[:price]
  end
end
