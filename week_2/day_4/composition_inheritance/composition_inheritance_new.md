# Inheritance

##Learning Objectives

- Be able to describe inheritance
- Implement superclass and subclass
- Know how to override methods
- Sharing a constructor

# Duration 2 hours

Sometimes we might have a bunch of classes that all share some behaviour. For example, a car can accelerate and so can a boat.

A sparrow can fly. But so can a duck!

How can we represent this in our code?

```
touch sparrow.rb duck.rb
mkdir specs
touch specs/sparrow_spec.rb specs/duck_spec.rb

subl .

#sparrow_spec

require('minitest/autorun')
require_relative('../sparrow')

class SparrowTest < MiniTest::Test
	def setup
		@sparrow = Sparrow.new
	end

	def test_sparrow_can_fly
		assert_equal("flying", @sparrow.fly)
	end
end

#sparrow
class Sparrow
	def fly
		"flying"
	end
end

```

Now if we want our duck to fly what do we do? The simplest solution is that we can copy and paste the code.

```
#duck_spec
require('minitest/autorun')
require_relative('../duck')

class DuckTest < MiniTest::Test
	def setup
		@duck = Duck.new
	end

	def test_duck_can_fly
		assert_equal("flying", @duck.fly)
	end
end

#duck
class Duck
	def fly
		"flying"
	end
end

```
This is dirty.

We want to be able to reuse our code.

If we change this method we need to alter it in two places. We can move this to a "super class" where the behaviour can be shared among the two "sub classes".

```
#terminal
touch bird.rb

#bird.rb
class Bird
   def fly
		"flying"
	end
end

#duck
require_relative('bird')
class Duck < Bird

end

#sparrow
require_relative('bird')
class Sparrow < Bird

end

```
Our test still passes. This is as if the two classes are joined together - the behaviour is passed down to the subclass. This is called "inheriting" properties or behaviours.

##Overriding

If we declare a method with the same name in a subclass that is shared with a parent, we override it.  Ruby first looks to the class, and then the super class.  Let's change the duck so it has specific behaviour.
```
class DuckTest < MiniTest::Test
	def setup
		@duck = Duck.new
	end

	def test_duck_can_fly
		assert_equal("flying", @duck.fly)
	end
end
```

```
#duck
class Duck < Bird
	def fly
		"duck flying"
	end
end
```
##super
What if wanted our duck to do something unique and to also do it's parent behaviour.  Enter super.

Super calls it's parent(super) class method.
```
#duck
class Duck < Bird
	def fly
		bird_flying = super()
		"duck " + bird_flying
	end
end
```




## Shared Constructor

Note that if we add a constructor to Bird, all of the derived classes share it.

```
#bird
  attr_reader :num_legs
  def initialize
    @num_legs = 2
  end

#duck_spec
def test_duck_has_2_legs
	assert_equal(2, @duck.num_legs)
end
```
If we added a parameter to the constructor, all of our bird classes would have to use it.

```
#bird
  attr_reader :num_legs
  def initialize(num_legs)
    @num_legs = num_legs
  end
```

## Sharing Behaviour

Let's say our birds want to call. They both have the same method, but it returns a different value. A sparrow "chirps" and a duck "quacks".

```
#sparrow_spec
def test_sparrow_can_chirp
	assert_equal("chirp", @sparrow.call)
end

#sparrow
def call
	"chirp"
end

#duck_spec
def test_duck_can_quack
	assert_equal("quack", @duck.call)
end

#duck
class Duck
	def call
	 	"quack"
	end
end

```

# A Problem

Let's say we now have a Robin. A Robin can fly, just like a Sparrow or Duck.

```
#terminal
touch specs/robin_spec.rb robin.rb

#robin_spec
require('minitest/autorun')
require_relative('../robin')

class RobinTest < MiniTest::Test
	def setup
		@robin = Robin.new
	end

	def test_robin_can_fly
		assert_equal("flying", @robin.fly)
	end
end

#robin
require_relative('bird')
class Robin < Bird

end

```
We also want our Robin to chirp.

```
def test_robin_can_chirp
		assert_equal("chirp", @robin.call)
	end
```

This test fails. Now we have a problem... we can't add the call to Bird since not all birds chirp. Some quack. We will need to add the method to Robin, too.

```
#robin
class Robin
	def call
		"chirp"
	end
end
```
Urhg this sucks. Now we have duplicate code. We could pull out a Chirper class, and inherit that from Bird... but that's already causing us to chain together our classes. Surely there has to be a better way?

## Composition Over Inheritance

Inheritance can be useful, but it needs to be used with caution. We can very easily get into a nightmare of tangled classes and overriden methods. We also can only inherit from ONE thing and one thing only. We can't be both a Bird and a Chirper. We can be one or the other.

In programming we have the idea of "favouring composition over inheritance". What it basically mean is that we should compose our classes from other classes that implement the behaviours we need.

Let's do some refactoring. What we are actually saying is that all Birds have a call method and this implementation varies depending on the type of bird.

We need to make some "behaviours". In our app, we have birds that can fly, chirp and quack.

```
mkdir behaviours
touch quack.rb fly.rb chirp.rb

#quack.rb
class Quack
  def call
    "quack"
  end
end

#fly
class Fly
  def fly
    "flying"
  end
end

#chirp
class Chirp
  def call
    "chirp"
  end
end

```
Now we have isolated our behaviours to their own classes. We are not going to unit test them, but we could if we wanted to.

We need to alter our Bird superclass and do something beautiful. Because our Duck, Robin and Sparrow are all Birds, they share the same constructor. This means we can pass in the behaviours we want our birds to have!

```
#bird
class Bird

  attr_reader :num_legs
  def initialize(call_behaviour, fly_behaviour)
    @num_legs = 2
    @call_behaviour = call_behaviour
    @fly_behaviour = fly_behaviour
  end

  def fly
   @fly_behaviour.fly()
  end

  def call
    @call_behaviour.call()
  end

end
```
Now we set up each of our classes to define the behaviour they are going to use.

```
#duck
require_relative('bird')
require_relative('../behaviours/quack')
require_relative('../behaviours/fly')
class Duck < Bird
	def initialize(call_behaviour, fly_behaviour)
		super(Quack.new, Fly.new)
	end
end

#sparrow
require_relative('bird')
require_relative('../behaviours/chirp')
require_relative('../behaviours/fly')
class Sparrow < Bird
	def initialize(call_behaviour, fly_behaviour)
		super(Chirp.new, Fly.new)
	end
end

#robin
require_relative('bird')
class Robin < Bird

end
require_relative('bird')
require_relative('../behaviours/chirp')
require_relative('../behaviours/fly')
class Robin < Bird
	def initialize(call_behaviour, fly_behaviour)
		super(Chirp.new, Fly.new)
	end
end

```


```
#sparrow_spec
	def setup
    @sparrow = Sparrow.new()
  end

#robin_spec
 def setup
    @robin = Robin.new()
  end

#duck_spec
 def setup
    @duck = Duck.new()
  end
```
If we decide to make a duck glide instead of fly, how can we do this?

```
touch behaviours/glide.rb

#glide
class Glide
	def fly
		"Easy easy"
	end
end

#duck_spec
  def test_duck_can_fly
    assert_equal("Easy easy", @duck.fly)
  end
```
This fails, because the duck is still using the fly behaviour.

```
#duck_spec
require_relative('../behaviours/glide') //REMOVE FLY

class Duck < Bird
	def initialize(call_behaviour, fly_behaviour)
		super(Glide.new, Fly.new)
	end
end

```
