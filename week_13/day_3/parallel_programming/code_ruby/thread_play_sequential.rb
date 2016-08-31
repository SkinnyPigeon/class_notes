def expensive_operation(number)
  (0..100).each do |iteration|
    number = Math.sqrt(number) + 5
  end
  number
end

array_size = 999999
test_array = (1..array_size).to_a

sum = 0
start_time = Time.now
test_array.each do |number|
  sum += expensive_operation(number)
end
end_time = Time.now


puts("The sum is #{sum}")
puts("It took #{ end_time - start_time } seconds")
