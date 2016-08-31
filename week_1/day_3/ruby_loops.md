### title

Loops

### topic

### objectives
* To understand how to use looping constructs to control behaviour

### standards

### materials

### summary

Introduction to loops.

### assessment

### follow-up

====================

# Loops

So we've already looked at arrays and collections of things, and seen how we can access individual items in that collection and do stuff with the items we access. But what if we want to do that stuff on all the items in the collection. 

So say Val had a collection of chickens and she wanted to check them all to see if they'd laid any eggs that day, and to make sure that a fox hadn't got in during the night and run off with any of them. Each morning she goes round all the nests, making sure that each chicken is in its nest, and checks to see if any eggs have been laid. So she actually does exactly the same thing at each chicken's nest. Now if we were writing code to do this then it would get a bit tedious writing the same bit of code over and over again for each chicken.  

Loops in Ruby are used to execute the same 'bit'/chunk of code a specified number of times. 

In Ruby we can use any of the following constructs: `for`, `while`, `until`, `loop`

Let's create a ```touch loops.rb```

### For Loop

Executes code once for each element in expression. Say Val was doing a roll call of her five chickens:

```
  # loops.rb

	chickens  = ["Margaret","Hetty","Henrietta","Audrey", "Mabel"]	

	for chicken in chickens; 
    puts chicken; 
  end
```

[Draw on board with loops] 

* first time chicken = "Margaret"
* second time chicken = "Hetty"
* third time chicken = "Henrietta" and so on...

###Looping Round a Hash

We can also do the same thing with a hash. Say we have a hash of our favourite films where the key is the film title and the value is the films rating:  

```
  # loops.rb

  favourite_films = {
    star_wars: 10,
    shawshank_redemption: 8,
    blues_brother: 9
  }

  ```

We can print out each film's title and its rating by going through the keys of all the items in the hash and using that key to access its rating:

```
  # loops.rb
  
  favourite_films = {
    star_wars: 10,
    shawshank_redemption: 8,
    blues_brother: 9
  }
  
  for key in favourite_films.keys
    puts "#{key}: #{favourite_films[key]}"
  end

```

### While loop

Executes code while conditional is true

```
  # loops.rb

	number = 0
	my_num = 5
	
	while (counter < my_num)  do
	   puts "number is #{number}"
	   number +=1
	end

```

What happens if the condition is always true?... The code will loop forever, or eventually crash.

So beware of infinite loops (and stack overflows). Ruby loops just keep on going until you run out of RAM...

## Playing with loops

Let's write a program that asks a user to guess the answer to a maths question, and loops until they get it right:

So let's create a new file for this:

```
  # terminal
  touch quiz.rb
```

And open it:

```
  # terminal
  subl quiz.rb
```

```
  # quiz.rb
  
  my_number = 5
  puts "What number am I thinking of? "
  value = gets.to_i

  while (value != my_number)
    print "nope... try again: "
    value = gets.to_i
  end

  puts "yes!"
```

[:OPTIONAL]What would need to change in the above program to give the user information about whether their guess was too high, or too low? Is it much effort to do that? Why don't we...

[i]: if there's time, make the change, or encourage them to do it (5 mins to write a `case`/`if` statement)

POSSIBLE SOLUTION:

```
  # quiz.rb

  my_number = 5
  puts "What number am I thinking of? "
  value = gets.to_i

  while (value != my_number)

    if (value > my_number)
      puts "too high"
    else
      puts "too low"
    end

    print "try again: "
    value = gets.to_i
   end

  puts "yes!"

```

##Nested Loops

Loops can contain other loops. 

[i]: real life example - doing sets of reps on the machines at the gym

Let's create a nested loop.

We can create a new file for this:

```
  # terminal
  touch nested_loops.rb
```

And open it:

```
  # terminal
  subl nested_loops.rb
```

Lets imagine we're doing 3 sets of 10 reps.

First of all lets write a loop to do our 3 sets. This is going to be our outer loop:

```
  # nested_loops.rb
  sets = 1
  sets_limit = 4
  
  while (sets < sets_limit)
    puts "Set: #{sets}"
    sets += 1
    puts "Have a rest!"
  end

  puts "Done!"

```

So now we can create a loop, for our 10 reps.

```
  # nested_loops.rb
  
  reps = 1
  reps_limit = 11
  
  while (reps < reps_limit)
    print "Rep: #{reps} "
    reps += 1
  end
  puts

```

We want this loop to be executed for each of our 3 sets, so it goes ***inside*** the loop for our sets i.e.:

```
  # nested_loops.rb

  sets = 1
  sets_limit = 4

  while (sets < sets_limit)     # OUTER LOOP
    puts "Set: #{sets} "
    
    reps = 1
    reps_limit = 11
    while (reps < reps_limit)           # INNER LOOP 
      print "Rep: #{reps} "
      reps += 1
    end
    puts

    puts "Have a rest!"
    sets += 1
  end

  puts "Done!"
```


[OPTIONAL TASK]: Using nested loops, write a small program to create a times table for the numbers 0-10. Don't worry about the formatting :-)

***HINT*** - start off with a smaller range e.g. 0 to 5 then extend it.

POSSIBLE SOLUTION:

```
  limit = 11
  first_number = 0
  
  while (first_number < limit)
    second_number = 0
    while (second_number < limit)
      number = first_number * second_number
      print "#{number} "
      second_number += 1
    end
    puts
    first_number += 1
  end

```

## Exiting out of loops

To exit out of loops, and when loops crash, we have some other functionality available to us:

  - break:
    Terminates the most internal loop. 

So for instance, if we want to loop asking the user for input for ever, *until* they type a particular character ('q'), we could use:

```
  loop do
    print "type something: "
    line = gets.chomp
    break if (line.downcase == 'q')
    puts "you typed: #{line}"
  end
```




