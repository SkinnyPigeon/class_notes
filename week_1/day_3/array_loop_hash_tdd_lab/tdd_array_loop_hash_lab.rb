def add_array_lengths(array_1, array_2)
  return array_1.length + array_2.length
end

def sum_array(array)
  result = 0
  for item in array
    result += item
  end

  return result
end

def find_item?(name, array)
  for item in array
    return true if(name == item)
  end

  return false
end

def first_key_name(hash)
  return hash.keys().first
end

def first_level_hash_values(hash, lookup)
  result = [];

  for key in hash.keys
    item = hash[key][lookup]
    result << item
  end

  return result
end