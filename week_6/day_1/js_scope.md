#JS Scope

##Learning Objectives
- Describe scope of local variables
- Describe scope of global variables
- Explain local variables come first in the function scope chain.
- State the importance of using var
- Describe the scope of closures
- Create a closure that uses a variable from an outer function.

1h

##Function scope

Variables created in functions have function scope,  they can be seen anywhere inside the function but nowhere else.

We can't see them directly outside the function.

```
var talk = function(){
	var name = "Rick";
	console.log('My name is' + name);
}

console.log( 'trying to access result' + name );
```

Or from another function

```
var talk = function(){
	var name = "Rick";
	console.log('My name is' + name);
}

var walk = function(){
	console.log( name + 'is walking' );
}

walk();
```
##Global variables

Variables which are defined not inside a function have global scope. They can been seen anywhere.

Let's see how we access a global variable from within a function.

```
	var name = 'Jay';//global
	var talk = function(){
		console.log('My name is ' + name);
	}
	talk();
```

If we define a local variable it will take priority in our function over the global variable - shadowing.

```
	var name = 'Jay';//global
	var talk = function(){
		var name = 'Rick';//local
		console.log('My name is ' + name);
	}
	talk();
	console.log('the global name', name);
```

If we forget to use var,  then instead of creating a new local variable the global variable will be reassigned.

```
	var name = 'Jay';//global
	var talk = function(){
		name = 'Rick';//resassigning global
		console.log('My name is' + name);
	}
	talk();
	console.log('the global name', name);
```

Horribly,  even if we don't have a global and we forget var, then  JS will not make a fuss and assign a new global.   Errrgghh.  

```
	var talk = function(){
		name = 'Rick';//assigning global
		console.log('My name is ' + name);
	}
	talk();
	console.log('the global is ' + name);
```

##Closures

Let's create a function to greet someone

```
	var greet = function(isHappy){
		if(isHappy){
			console.log('Hello my friend');
		}else{
			console.log('Mind your own buisness');
		}
	}

	greet(true)
```
In Javascript we can have functions within functions.  We could refactor our function to use a nested function. (this example is a little contrived)

```
	var greet = function(isHappy){
		var text = ''
		if(isHappy){
			text = 'Hello my friend';
		}else{
			text = 'Mind your own buisness';
		}
		var displayText = function(){
			console.log(text);
		}

		displayText();
	}

	greet(true)
```
How does this work?  How did displayText get access to the text variable.  It is not Global, or a local variable to the displayText function.


Functions in Javascript are closures.  The function 'remembers' the environment in which it was created.
[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)

Functions have access to all the variables that are in the scope of its outer function.


Task: 15mins, What do we think the output will be here?

```

	var globalVariable = 99;
	var separateFunction = function(){
		var separateA = 2;
	}
	var outerFunction = function(){
		var outerA = 1;
		var innerFunction = function(){
			console.log('outerA ', outerA);
			console.log('globalVariable', globalVariable)
			console.log('separateA ', separateA);
		}

		innerFunction()
	}

	outerFunction()
```
