def pet_shop_name(array)
  return array[:name]
end

def total_cash(array)
  return array[:admin][:total_cash]
end

def add_or_remove_cash(array, number)
  return array[:admin][:total_cash] += number
end

def pets_sold(array)
  array[:admin][:pets_sold]
end

def increase_pets_sold(array, number)
  return array[:admin][:pets_sold] += number
end

def stock_count(array)
  return array[:pets].count()

end

def pets_by_breed(array, breed)
  total = []
  for pet in array[:pets]
    if breed == pet[:breed]
      total.push(pet)
    end
  end
  return total
end

def find_pet_by_name(array, pet_name=0)
  for dog in array[:pets]
    if dog[:name] == pet_name
      return dog
    end
  end
  return nil
end

def remove_pet_by_name(array, pet_name)
  for dog in array[:pets]
    if dog[:name] == pet_name
      array[:pets].delete(dog)
    end
  end
end


def add_pet_to_stock(hash1, hash2)
  hash1[:pets].push(hash2[0])
  return stock_count(hash1)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
  return customer[:cash]

end

def customer_pet_count(customer)
  customer[:pets].count()
end

def add_pet_to_customer(customer, hash_pet)
  return customer[:pets].push(hash_pet[0])
end


def customer_can_afford_pet(customer, hash_pet)
  if customer[:cash] >= hash_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(shop_hash, wanted_pet_hash, customer_hash)
  # does the shop have the right pet?
  if shop_hash[:pets].include?(wanted_pet_hash)
    # nested if - if pet available, does customer have sufficient money?
    if customer_hash[:cash] >= wanted_pet_hash[:price]
      # add pet to customer's pets list:
      customer_hash[:pets].push(wanted_pet_hash)
      # increment pets_sold count
      shop_hash[:admin][:pets_sold] += 1
      # customer spends chash:
      customer_hash[:cash] -= wanted_pet_hash[:price]
      # shops earns cash:
      shop_hash[:admin][:total_cash] += wanted_pet_hash[:price]
    else
      # insufficient funds
    end
  else
    # pet not found
  end
end

# def sell_pet_to_customer(hash_shop, pet, customer)
#    if hash_shop[:pets].include?(pet)
#     find_pet_by_name(hash_shop, pet)
#     customer_can_afford_pet(customer, pet)
#     remove_pet_by_name(hash_shop, pet)
#     add_pet_to_customer(customer, pet)
#     increase_pets_sold(hash_shop, customer_pet_count(customer))
#     remove_customer_cash(customer, pet[:price])
#     add_or_remove_cash(hash_shop, pet[:price])
#   else
#     return 'insufficient funds'
#   else
#     return 'pet not found'
#   end
