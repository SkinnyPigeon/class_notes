def my_name()
  return "Rick"
end

def add( num_1, num_2 )
  return num_1 + num_2
end

def greeting( day )
  case day
  when 1
    return "It's Monday!"
  when 2
    return "It's Tuesday!"
  when 3
    return "It's Wednesday!"
  end
end

def game_of_thrones_rocks?(name)
  if name == "Val"
    return false
  elsif name == "Aidan"
    return true
  else
    return "No idea"
  end
end

puts game_of_thrones_rocks?("Val")

###############################
def get_food(animal)
  animal.downcase!
  case animal
    when "chicken" then return "seed"
    when "dog" then return "sausages"
    else return "What kind of animal are you?"
  end
end

puts get_food("Dog")

###############################
def get_grade(name, score)
  case score
    when 10 then grade = "genius"
    when 8..9 then grade = "merit"
    when 5..7 then grade = "pass"
  else
    grade = "fail"
  end

  return "#{name}, your grade is #{grade}"
end

puts get_grade("Val", 10)


################################
def game_over?(score, lives)
  victory?(score) || loss?(lives)
end

def victory?(score)
  # check for victory, return true/false
  if score >= 10
    return true
  end
  return false
end

def loss?(lives)
  # check for loss, return true/false
  if lives == 0
    return true
  end
  return false
end

puts game_over?(10, 1)