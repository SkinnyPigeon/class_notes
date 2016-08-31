#JS Objects

##Learning Objectives
- Create an object/hash
- Assign object to a variable
- Get an attribute for an object; using ., using []
- Add an attribute to an object
- Change attributes
- Add a method to an object
- Call method on an object
- Create a method that uses an attribute of the object (this)

- 1hr

##Intro to Objects

We saw yesterday that objects and hashes are the same thing. Objects are entities that have state(data), and behaviour methods we can call on it.  We will see how this can be done with hashes in Javascript.


```
	touch object_play.js
```

```
	subl .
```

Let's recreate our object.

```
	var myPerson = {
		name: 'Guybrush',
		age: 32,
		weapon: 'cutlass'
	};

	console.log('my person', myPerson);
```
[i]:(If covered a class based language eg Ruby)
How does the way we are creating an object differ from what we were doing in Ruby.
(Discuss)

We are creating a single object.  In a class based programming language, we never create an object directly,  we always create a class and then create instance of them.  Here we have created a single object.  In some ways Ruby is more class orientated, and Javascript is really object orientated!!

Today we are going to create single objects.  Tomorrow we will see how we can create multiple objects of the same type,  much how we would use a class.


##Methods

Okay cool,  we can create objects that have these data attributes for state. But what about giving it methods for behaviour.

Remember we saw that functions in JS are just objects and we can assign them to variables.

```
	var add = function(a,b){
		return a + b;
	}
  console.log( 'the return value is ' + add(1,2) );
```

Just like we assigned the function to a variable, we can assign it as a value in our object!

```
	var myPerson = {
	  name: 'Guybrush',
	  age: 32,
		weapon: 'cutlass',
	  talk: function(){
			console.log('shiver me timbers Im alive');
		}
	};
```

Amazing, by assigning the function to the object we have given our object a method and hence behaviour!

## 'this'

What if we wanted our person to be able to say their name?  It needs to be able to access it's attributes or other methods.

We can do this using the 'this' keyword.

The 'this' keyword allows us to access the other attributes of the object.

```
	talk:function(){
		console.log( 'shiver me timbers Im alive, my name is ' + this.name  );
	}
```

##Object.create

We can also create objects using the object create method.

```
	var myDog = Object.create(null);
	myDog.smell = 'musky';
	console.log('myDog', myDog);

	myDog.talk = function(){
		console.log("I am a dog and I smell " + this.smell)
	}
```

```
var guineaPig = {
  speak: function(punchLine) {
    console.log("The " + this.type + " pig says '" +
                punchLine + "'");
  }
};
var killerPig = Object.create(guineaPig);
killerPig.type = "killer";
killerPig.speak("SKREEEE!");
```


Don't worry about that null we passed into create we will see that later.
[i]: Passing in a null prototype to Object.create. Will discuss this later.


##Exercise

Create a bear object that has a type, a name, a belly and an eat method. The eat method should add something to the bear's belly.

SOLUTION:

```
var bear = {
  name: "Baloo",
  type: "Grizzly",
  belly: [],
  eat: function(fish){
    this.belly.push(fish);
  }
}

bear.eat("A fish!");
console.log(bear.belly);
```