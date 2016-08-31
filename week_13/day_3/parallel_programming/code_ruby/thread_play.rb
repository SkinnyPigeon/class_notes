def expensive_operation(number)
  (0..100).each do |iteration|
    number = Math.sqrt(number) + 5
  end
  number
end

array_size = 999999

start_time = Time.now

sum_1 = 0
t1 = Thread.new do
  (1..array_size/2).each do |number|
    sum_1 += expensive_operation(number)
  end
end

sum_2 = 0
t2 = Thread.new do
  ((array_size/2+1)..array_size).each do |number|
    sum_2 += expensive_operation(number)
  end
end

t1.join
t2.join

sum = sum_1 + sum_2

end_time = Time.now



puts("The sum is #{sum}")
puts("It took #{ end_time - start_time } seconds")
