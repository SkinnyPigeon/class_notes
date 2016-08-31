# Hashes

###objectives

1. Create a hash
2. Add items to a hash
3. Retrieve items from a hash
4. Delete items from a hash
5. Understand what a symbol is

### duration
1 hour

====================

##What is a hash

We have seen that we can store a collection of objects in an array object.

```
irb
my_toys = [ 'lightsaber', 'teddy', 'slinky' ]
my_toys[0]
```

Ruby provides another class that are designed for storing collections of objects. Hashes.

[:i] Draw on board that this is a class that we are adding to our toolbox. 

The main difference is that with arrays items are retrieved by the integer index. In a hash every item is given a key and it is this key that is used to retrieve the object.

The technical description of a hash is a collection of key-value pairs - that can also be referred to as dictionaries or associative arrays. 

Each key in the hash is unique allowing you to always find the value you stored against a particular item.

Another difference to an Array in that we can't assume that it's items are stored in any partcular order.

It's a little bit like a filing cabinet - we have labels we associate with things we want to store e.g. finance, recipes, reciepts. It doesn't matter to use what "index" the items are stored at (there's no need to know Finance is the first set of items in the drawer), what matters is the label we filed it under.


## Using Hashes

### Creating Hashes

We have a couple of options for initialising a hash. We can 'new' it up.
```
	#irb
	my_first_hash = Hash.new
```

We can create an empty hash directly

```
my_second_hash = {}
```

Lastly we can create a populated hash.

```
	toys = { "under_the_bed" => "lightsaber",  "cupboard"=>"teddy", "drawer" =>"slinky" }
```

In this hash, have have keys which are string and values which are strings. The keys could be other types of things, like Fixnums, and the values could be any object - arrays, booleans, anything.

```
silly_thing = { 1 => "2", 2 => "3", 4 => false }
```

### Accessing elements

We can access elements in a simlar manner to arrays. However, using the key rather than the index.

```
  toys["under_the_bed"]
```

If we try to access an element for which there is no key the hash will return nil. 

```
	toys["jacket_pocket"]
```

This is a default value that is returned when accessing keys that do not exist in the hash. We can override this value if we wish by passing our own value as the argument when we create it:

```
	toys = Hash.new(0)
```

Now it will always return 0 when a key is not found. 

# Modifying Elements

We can add objects to a hash much like we would assign variable.

```
	toys["jacket_pocket"] = "top trumps"
```

We can also replace objects

```
	toys["jacket_pocket"] = "firetruck"
	toys
```

We can remove items using the delete method.

```
 	toys.delete("jacket_pocket")
 	toys
```

# Helpful methods

A hash has lots of helpful methods, including a way to the list of keys.

```
toys.keys
```

As well as the list of values

```
toys.values
```

# Symbols

Symbol is a class provided to us by Ruby when objects are particularly suited as keys for hashes.  A Symbol is essentially a special string, but it's a constant value. We can never alter the symbol by adding things to it or do many of the other functions we might expect to use on a string. Symbol comparison is a lot faster than String comparison so they are ideal for hash keys.

We won't get bogged down in this, but it's a very common thing in Ruby and when you start using symbols you won't want to go back to strings for keys.

```
	:my_sym
	:hello
```
```
	toys = { :under_the_bed => "lightsaber",  :cupboard => "teddy"  }
```

Symbols are so commonly used as keys in hashes that Ruby gives us a special syntax.

```
	toys = { under_the_bed: "lightsaber",  cupboard: "teddy" }
	toys[:under_the_bed]
```

## Nested Hashes

We can actually store a hash inside of a hash! Sounds scary, but it can actually be very useful. What if we wanted to store more than just the population - maybe the capital city?

```
#touch countries_hash.rb
countries = {
	uk: {
		capital: "London",
		population: 1000
	},
	germany: {
		capital: "Berlin",
		population: 5
	}
}
```

[Task:] See if you can figure out how to get the population out of Germany.

```
countries[:germany][:population]
```

[Task:] Make a hash of fruits, which has the fruit's name, the days it keeps before it expires and the colour.

Bonus: Add an origin for each fruit, which has the country it ships from and tax to be paid.

```
fruit = {
  banana: {
    expires: 2,
    colour: "yellow",
    origin: {
    	country: "spain",
    	tax: 5
    }
  },
  apple: {
    expires: 3,
    colour: 5,
    origin: {
    	country: "england",
    	tax: 0
    }
  }
}
```