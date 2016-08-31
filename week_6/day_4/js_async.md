#JavaScript Async

###Learning Objectives
- Solidify understanding of asynchronous v synchronous
- See the node async file system module in action 

###Blocking code vs Non-blocking code

We just looked at callbacks. Why? Callbacks are a fundamental part of async programming. What is async programming?

To understand how node (and indeed JavaScript) works we need to first understand the difference between synchronous and asynchronous code.

We can define synchronous code as a sequence of statements that execute one after the other.

For example:

```
mkdir js_async
cd js_async
touch js_async.js
```

```
console.log("This runs first");
console.log("This runs second");
console.log("This runs third");
``` 

Asynchronous code takes statements out of the main program allowing the code after the asynchronous call to be executed straight away without waiting.

Let's look at a common JavaScript function called setTimeout. It takes a function as a callback and a millisecond value.

The code inside the callback function is only run after x number of milliseconds. 

What will the sequence of these events be?

```
console.log('First');

setTimeout(function() {
    console.log("Second");
},1000);  

console.log('Third');
```

In the example above, the output will be: “First”, “Third”, “Second”. This is because the function passed into setTimeout is not called immediately – it has to wait for 1000 milliseconds before it can execute.

[i]: DRAW ON BOARD

Imagine two coffee shops. We'll call them Preachers and Starbucks.


##Synchronous
When a customer comes into Preacher's and orders a large latte, Mr. Preacher goes off to the coffee machine and starts to make the coffee. 

We can think of the customer's order as our program requesting the interpreter to go and do something like execute a method. We might have a method called ***orderCoffee()***.

Meanwhile, a queue has formed outside Preachers. But the first customer is still waiting for his coffee. 

The process has been blocked and nothing further can happen until the first customer has got his coffee and paid. Then Mr. Preacher is freed up to deal with the next request. 

Obviously this is slow and frustrating. 

##Asynchronous
Meanwhile, down at Starbucks, the customers are placing their orders. 

But the difference here is that the server hands off the request to the barista who does the work and then calls back to the customer when their latte is ready. 

While the barista is hard at work making the coffee the server is free to deal with the next request. This process is non-blocking and is much faster and efficent.

This is also known as asynchronous. JavaScript is what we call non-blocking or asynchronous.

We'll do a code along to illustrate non-blocking versus blocking.

We could try simulating this exchange in JavaScript using setTimeout.

```
mkdir js_async
cd js_async
touch js_async.js
```

``` 
//CUSTOMER 1
console.log('Customer: Can I order a latte please.');

console.log("Server: I'll hand it off to the barista");
setTimeout(function coffeeIsReady(){
    console.log("Your latte is ready");
}, 4000);  

//CUSTOMER 2
console.log('Customer: Can I order an espresso please.');

console.log("Server: I'll hand it off to the barista");
setTimeout(function coffeeIsReady(){
    console.log("Your espresso is ready");
}, 2000);  

```

##What's So Good About Async Code?
JavaScript functions that take a long time can make the user-interface or server unresponsive until the function has completed.

This can result in a really bad user experience.

Let's look at an example.

Say we want to get all of a users latest tweets. 

```
var tweets = getTweets();
// Wait for getTweets to go off and get the tweets and return them to us
anotherFunction(); 
```

This *synchronous* example shows that we have to wait for the long-running getTweets function to complete before we can do something else.

Let's do it asynchronously.

```
function getTweetsAsync(callback){
  //Go and get the tweets

  setTimeout(function(){
    var tweets = "These are the tweets";
    callback(tweets);
  }, 1000);
}

var myTweets = null;
getTweetsAsync(function(tweets){
  myTweets = tweets;
})

console.log(myTweets); //NULL!
```

In this example *anotherFunction()* can run BEFORE getTweetsAsync has finished doing it's stuff.


##Node File System Code Along

We're going to use the file system module that comes with node.js to practice our understanding of blocking and non-blocking code. Or asynchronous vs synchronous code (same thing really).

[i]: Ask the class what the difference is between asynchronous and synchronous


*************************************************************************************

First let's write a little SYNCHRONOUS program that reads a file and prints out the number of newlines in the file (that's represented by the \n character)

```
//send students the us-states.txt
subl fileSync.js
```

```
//tell node to give us a file system object
var fs = require('fs');

//A buffer is a temporary memory store for our data
var buffer = fs.readFileSync("us-states.txt");
var bufferString = buffer.toString();

var newLineCount = bufferString.split("\n").length;

console.log("There are " + newLineCount + " lines in the file");
console.log("Oh, you've finished reading the file.");
```
The readFileSync method is as the name suggests, SYNCHRONOUS. "Whaa? But node is meant to be asynchronous, you said so!"

Yes, but it also provides synchronous versions of some methods.

So in this example we call the readFileSync method but because it's synchronous, we have to wait until it's finished reading the file before we can continue.

That's why we have to wait until readFileSync has finished before we can run our console.log().

In this example it doesn't make a huge difference but if our file was much much bigger or perhaps somewhere miles away on the network, it might take quite a bit longer. We might be waiting a long time. Our process is said to be BLOCKED.

Now let's do it the node way.....

```
subl fileASync.js
```

```
//fileASync.js
var fs = require('fs');

fs.readFile("us-states.txt", "utf-8", function(err, data){
  if(err) 
    console.log("Uh oh! " + err);
  else
    var bufferString = data;
      
    var newLineCount = bufferString.split("\n").length;
    console.log("There are " + newLineCount + " lines in the file");
  });

  console.log("Oh, where has Oregon? She's gone to Oklahoma.");
```

There are four things to note here:

- The readFile method is taking a function as a parameter. It's a CALLBACK function! 
- We can continue to execute the program and the block of code will execute when the file has been read. That's why we can console.log() out to the screen before printing out the length of the file.
- But the body of the callback is not run until the file has been read.
- The callback function itself takes 2 parameters. The first is an error object and the second the data or content that we're getting back from the method call.
