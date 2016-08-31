#JS Variables Types

##Learning Objectives
- Declare/assign/re-assign a variable
- Describe the different types in Javascript
- Demonstrate using typeof
- Show JS is dynamically and weakly typed.
- Describe the Truthy/Falseness of primitives/object

1hr - 1.5hr

# Variable Assignment

Programming in Javascript follows the same pattern as programming in most other programming languages.   Creating things/objects and assigning a variable to them so we can reference.

Let's play around with talking Javascript using our nice friend the node interpreter

To represent text we use single or double quotes.  This creates a string for us.

```
  "something we want to hold on to";
```

##Let's create a play file

```
touch js_types.js
```

How can we retrive our string?  We can't! This object is essentially lost to us.

Variables allow us to keep a reference to our objects.

When we create variables in JavaScript we use the keyword "var" and then the name for what we want to call the variable.

```
  var myString = "something we want to hold on to";
```

We can then use this reference to get our string.

```
  console.log(myString);
```

Javascript often tries to be helpful.  If we forget to use var it won't complain.  It will make it a global. This is a design flaw and a nuisance. We'll explain why later.  Always use var!


# Types

Unlike Ruby, not everything in JavaScript is an object (gasp!).

The latest Javascript standard has 6 primitive types:

- Number
- String
- Boolean
- Null
- Undefined
- Symbol(not covered here)

And
- Object


Primitive types do not have any methods on them, they just represent the data.


## Number

Number represents any numerical value, either an integer or a float etc. This includes negative and positive values.  

```
  var a = 1;
  var b = 2;
  var c = 2.5;
```

We have access to mathematical operators.  
```
  2 + 3; //5
  7.5 - 1; //6.5
  2 * 3; //6
```

Javascript will give a decimal answer even if we are operating two integers.
They are all just numbers.

```
  2 / 4; // 0.5  (would be 0 in ruby)
```

[i]: Use Math.floor(y/x) for integer arithmitic;

## String

A string is used to represent text. Javascript automatically wraps a string in an object so we have lovely methods and attributes.

And gives us methods to manipulate it.

As mentioned we can create strings with double or single quotes.

```
  var myString = "a nice string we have created"
  myString.length
  myString.toUpperCase()
```


## Null

[discuss not defined]

The value null is a JavaScript literal representing null or an "empty" value, i.e. no object value is present.


We use null when we are deliberately setting a variable to be nothing. It's good practice to initialise a variable to an actual value rather than null. For example, if we had a counter variable we would set it to 0 or 1, not null (we can't add anything to null).


## Undefined

Undefined occurs when we have not assigned any value, not even null, to a variable.

```
  var b;
  b; //undefined
  typeof(b); // undefined
```

The important distinction to make is that null occurs when we have decided a variable HAS some value, and that value is nothing. An undefined variable has NO value, it's just floating around waiting for a value. Even if that value was nothing.

#typeof

The typeof operator gives us the type.

```
  typeof(1);
  typeof("some text");
  typeof(undefined);
  typeof(null); //object
```


## Dynamically Typed

What does this mean? We can change the type of a variable on the fly just like we do in Ruby. We don't need to do any special "casting" it just magically does it. This is incredibly powerful but also can lead to all sorts of errors if you are not careful.

```
  var number = 1;
  number = "not a number lol";
  number;
  number = 4;
  number;
```
Our number variable has magically changed from a number to a string back to a number again.

##Weakly Typed

Javascript will try and be our friend and convert the type to allow an operation to succeed

```
  3 + "hello"
```

What happens here?

```
  "route" + 6 + 6; //"route66"
  6 + 6 + "route"; //"12route"
```
We can use brackets to group evaluations together.

```
  "route" + (6 + 6); //route12
```

## Boolean


A boolean has two values, either true or false.


We can also evaluate statements to return a boolean.

```
1 > 2; //false
2 == 2; //true
2 == "2"; //true
3 != 4; //true
3 !== 4;//true
2 === "2"; //false - what is going on here?
```

In general, we tend to use the "===" sign instead of the "==". JavaScript is trying to be helpful and change the string into a number which we don't always want. If this happens when we don't expect it, we can see all sorts of odd behaviour in our code. So the "===" is comparing both value and type.

Like in other languages the key role of the Boolean value is for control flow. 

# Boolean Operators

We can use the boolean operators "and" and "or" to make logic expressions.

```
  (1+1 === 2) && (1+1 === 4);  //false
  (1+1 === 2) || (1+1 === 4);  //true
```

Beware of "short circuiting" ( first statement false in and, true in or ). This can be important when your statement you are evaluating changes your program state since it may never happen.

We can also use ! for "not".

```
  !true; // false
```

# Truthiness and Falsiness

This is a bit tricky in JavaScript. Remember how the dude that wrote it liked whiskey? Well...

[i:] Get the students to guess the answers (if(true) can be a bit confusing )

```
  if(true) console.log("true"); //true
  if(false) console.log("true"); //false
  if(0) console.log("true"); //false
  if(2) console.log("true"); //true
  if("") console.log("true"); //false
  if("cat") console.log("true"); //true
  if(NaN) console.log("true"); //false
  if(null) console.log("true"); //false
  if(undefined) console.log("true");//false
```

In summary, everything apart from the following would evaluate to true.

- false
- 0
- ""
- NaN
- null
- undefined

###NaN

What's this NaN?
Nan stands for Not a Number.
A NaN occurs when a numerical operation fails.

###Example

parseInt is a method Javascript provides to us to turn a string into an integer

```
  parseInt('2');
  parseInt("cat");
```

```
  isNaN(1); // false
  isNaN(parseInt("cat")); //true
  isNaN(parseInt(1)); //false
```

[i]: Ironically NaN is of type number!  Thank you Javascript!
