# Conditionals

### objectives

* To understand how to use conditional operators to control behaviour
* Understand if stamements
* Understand "else"
* Understand ternary operators
* Understand case select

### Duration
1 hour

====================

# Conditional Logic

We often make decisions about whether things are true or false in our daily lives. 

[Q:] Think of a question that has a yes no answer

Do the spice girls have 5 band members? Is my potato fantastic? [cohort 5 ref]

When we think about these statements and come to a yes / no answer we are evaluating them. We take in a statement about the world and then give a yes / no answer.

Our programs work in exactly the same way. We can give them a "statement" just like what we have been doing, and it will "evaluate" it to true or false (yes or no).

We use a special operator in Ruby to check if things are equal. If you remember, = on it's own *assigns* a variable. Two == together checks if two things are equal.

```
  # irb - examples of statements that evaluate to true or false

  4 == 2 + 2
  #=> true

  4 == 2 + 3
  #=> false
  
  "cat" == "cat"
  #=> true
  
  "cat" == "dog"
  #=> false
  
```

Note that equality needs both the *type* and the *value* to be equal

```
"1" == 1
false
```

How do we fix this?

```
"1" == 1.to_s
"1".to_i == 1
```

# Control Flow

Similarly, we might make decisions based on whether something is true or false.

[Q:] Think of an example where something happens in your daily life based on the outcome of one of these yes no stamements.

If it's raining, I'll take the car to work. Otherwise, I'll cycle If I catch a Pikachu I'll be happy, otherwise I'll be sad.

Programming languages also do this to allow us to have different actions and paths our code can go down, otherwise our program could only do one thing and that would be sad.

The easiest way to see this is to try it! Let's have a go.

```
  # terminal
  subl what_animal.rb
```

```
	# what_animal.rb
	puts "What animal are you?"
	name = gets.chomp
	if(name == "chicken")
		puts "This is my favourite animal!"
	else
		puts "Sad, not my favourite."
	end
```

Note that we indent the code as we take actions depending on the outcome of the if. Ruby doesn't need this but it makes it much easier for a human to read. It's important to learn the indentation conventions of a language. 

Sometimes, we must do certain things with indents - Python won't work if your tabs are in weird places!

```
  # terminal
  ruby what_animal.rb
```

We don't need the brackets in Ruby around the condition, but since we are just learning we are going to keep them to prepare ourselves for the languages we will learn later.

What happens if we want to add a condition for a kitten?

```
	# what_animal.rb
	puts "What animal are you?"
	name = gets.chomp

	if (name == "chicken")
		puts "This is my favourite animal!"
	elsif (name == "kitten") //UPDATED
		puts "I love kittens!"
  else
    puts "Sad, not my favourite."
	end
	
```

[Task:] Make a little program that asks you to guess when ruby was created. 

```
puts "When was ruby created"
guess = gets.chomp

if (guess == 1995.to_s)
  puts "Whoo you win!"
else
  puts "Nope"
end
```


## When choices are more complex

'If' statements work very well for one or two conditions, but when there are multiple conditions they can get a bit messy. We tend to shy away from elsifs.

Instead we can use 'case' statements (in some languages, these are called 'switch' statements).

```
  # terminal
  subl case_statement.rb
```

```
# case_statement.rb
  score = 10

  case score 
    when 10
      puts "genius"
    when 9
      puts "merit"
    when 8
      puts "pass"
    else
      puts "fail"
  end

# terminal
ruby case_statement.rb
```

We might want to have a range of values in our case, so 10 is genius and 8 to 9 is merit, 5 to 7 is pass and everything else fails.

```
score = 6

case score 
  when 10
    puts "genius"
  when 8..9
    puts "merit"
  when 5..7
    puts "pass"
  else
    puts "fail"
end

```

We have a lot of duplication here with the puts. We also might want to save the result of the case to a variable and do something with it.

```
score = 6

result = case score 
  when 10
    "genius"
  when 8..9
    "merit"
  when 5..7
    "pass"
  else
    "fail"
end

puts result
```

[Task:] 
- Add a condition for 4 "resit"
- As the user to input the score instead of hard coding it

## Control Flow Nice to Haves

Image we have a little cafe and every coffee except americano costs £2. We might write it like this.

```
#terminal
touch nice_things.rb

#nice_things
puts "what coffee would you like?"
coffee = gets.chomp

price = 1

if(coffee == "americano")
  price = 2
end

puts "the price is" +price.to_s

```

Ruby has the concept of a "guard" which allows us to tidy this up a bit.

```
puts "what coffee would you like?"
coffee = gets.chomp

price = 1

price = 2 if (coffee == "americano")

puts "the price is " + price.to_s
```

This is cool, but the price variable is kind of floating around doing not a lot...

### Ternary 

We can also use a construct called a ternary. It's really nice when you only have a simple choice to make that only have 2 outcomes. 

```
touch nice_things.rb

puts "what coffee would you like?"

coffee = gets.chomp

price = coffee == "americano" ? 2 : 1

puts "the price is" + price.to_s

```