#JS Intro to the DOM

##Learning Objectives
- Understand what the DOM is and what it isn't
- Know why the DOM exists
- Writing JavaScript in the browser console
- Viewing the DOM in DevTools
- Attaching a callback to the window object

### Duration
1 hour

###Intro
So we are JavaScript developers.  We've created games and applications with multiple objects. JavaScript is just a programming language, in which we can describe our thoughts and ideas.

What has made JavaScript the most used language in the world, is that it is the language in which browsers talk. This week we are going to see how we can expand on the fundamental skills we gained last week, to see how they can be applied to frontend web development.

###Let's Emigrate to Browserland

... and let's talk about ENVIRONMENTS. Not something we've really discussed yet.

*"The browser is a really hostile programming environment."*
- Douglas Crockford

We've written JavaScript code in .js files on our computer and used node to run them. Much like we did with Ruby.

Now we're going to write scripts that are run not by node but by the JavaScript engine in the browser. Without web browsers, there would be no JavaScript. 

The browser (Chrome, Firefox, IE) will be envivornment for this week.

In our case, we're using Chrome so our programs will be run by Google's V8 JavaScript engine (which happens to be the same engine that node is built on)

That's all well and good but how do we create interactivity for our users? 

###Understanding the DOM
[i]: Redraw the client server HTTP relationship drawing

When the browser accesses an HTML page, it downloads it, parses it, and then uses it to construct the DOM.

DOM stands for ***Document Object Model***. 

It is a representation of the HTML document created in the memory of the browser.

JavaScript can interact with and modify the DOM, which in turn alters what the user sees in the browser. That's how we produce interactive websites.

[i]: Draw DOM
![](dom.jpg)

###HTML vs DOM
Is the HTML we write in our .html documents the same as the DOM?

No. But it is used by the browser to ***construct*** the DOM.

###Draw DOM Tree
The DOM is a tree and when JavaScript came along we got some methods to interact with this tree so we can maiuplate what the user sees in the browser. 

###JavaScript Can Manipulate the DOM
So that we can run bits of code in response to events.

###Getting Started
The focus of the week is going to be writing JS to manipulate HTML in the browser. However, to start we need to get that HTML to the browser. 

We'll do this like we did in with Sinatra.  

The browser will make an HTTP request to a server, and the server will return an HTTP response with the HTML. 

Remember in Sinatra, we wrote Ruby to allow us to define routes and serve up content. 

Node allows us to do exactly the same thing, but using Javascript. This time, we'll write the server in JS as well. We won't go into detail about it here, as we will cover it later.   

Let's get going.

[i]: Send out start point folder

We're going to use a minimal JS server framework similar to Sinatra called Express

Let's run the server
```
  node server.js
```
And check it out in the browser.  Cool so now we've done exactly what we were doing in the third week, only using JS.  Now let's get writing some client side JavaScript.

[i]: This is the basic start point that can be found in resources intro/applicationstartpoint.

Let's go and add some elements to the HTML that we can play with. But first let's write some JavaScript in the console!

###Console
If we right-click and inspect in the browser we get our DevTools. 

You can also use Command+Shift+J to get the console up.

In here are many very useful tabs, but most important is the console.  

This is a JavaScript run time(REPL), much like IRB or the Node console. We can do all the JS stuff we learned last week.

Which tabs in DevTools do we care about?

We won't use all of these tabs, the key ones we are going to get very familiar with are:

 - [Elements](https://developer.chrome.com/devtools/docs/dom-and-styles)
 - [Network](https://developer.chrome.com/devtools/docs/network)
 - [Console](https://developer.chrome.com/devtools/docs/console)

So if we open the console we can type JavaScript code and run it. 

```
 var a = 1;
 a;
 var b = function(){ console.log('JS in the console!'); };
 b();
 c = {age: 25, magic: 99}
 c.age
```

Cool. A nice familiar place.

We also have access to those objects that the browser has given us.

Let's welcome our new friends. We'll see a lot of this and it;s the key to how we build these front end applications.


##The document object


The document object will be our main communication with the DOM. Let's have a look at all the methods and attributes it has that we can use...

One of the most useful methods is one that allows us to grab elements by their ID. 

Let's add an ID to one of our elements.

```
//index.html

<p id="main-text">Let's write some JavaScript</p>
```

And now we can grab it form the DOM!

```
//console
var element = document.getElementById('main-text');
console.log('element', element);

```

###Using *script* tags
We *could* write our JavaScript directly into our HTML document (as long as it's enclosed in *script* tags).

However, we want to separate our programming logic from our structure so we'll tell the HTML document where to find the app.js

```
//index.html

<script src="app.js"></script>
```

```
//terminal 
touch public/app.js
```

### Timing!
Let's get an element using the document object in our script. And let's make sure it's being found ok. We'll add a console.log to our app.js. 

Where do you think the log will appear?

```
  var element = document.getElementById('main-text');
  
  console.log('element', element);
```

[i:] Watch it fail. Discuss what's happening here.


###The window object
Let's use the console to have a look at some of the objects in the DOM. Let's have a look at the window object.

```
//console

window
```
Cool. We can see the whole window object. This is the *global* object in our JavaScript environment.

If we take a closer look at it in the console, we can see a whole bunch of properties and methods.


###window.onload
We can scroll down and locate a property called ***onload***. What value does onload have? null.

When do you think the onload function gets called? Window sits there listening for the onload event (waiting until the DOM is loaded) to be triggered and looks for a function to run when the event occurs. It's an event listener. 

Here are some common ones:

```
onload //when the page loads
onclick //when a user clicks something
onmouseover //when a user mouses over something
onfocus //when a user puts the cursor in a form field
onblur //When a user leaves a form field
```

Maybe we can assign it a behaviour to execute when it hears the event. 

Maybe we can assign it ..... a callback?

We can use ***window*** in our JavaScript programs! 


```
//app.js

console.log("This is JavaScript calling!");
```
We can even logout our friend *window*

```
console.log(window);
```

So given that we have access to the window object (thank you DOM!) how do you think we could give it a function to run when it hears the onload event?

```
//app.js

console.log("This is JavaScript calling!");

window.onload = function(){
  console.log("The DOM has loaded successfully.");
  var element = document.getElementById('main-text');
  console.log('element', element);
}

console.log(window.onload);
```

Here we've set the onload property of window to an anonymous function.

QUESTION: What will the order of the console.logs be?

Or we could use a named function... 

TASK (10 mins): Use a named function (init) instead of an anonymous one

It's important that we wait until the DOM has been loaded by the browser before we start trying to manipulate it from out JS program.

Does that mean we need a big huge onload callback function?

Not necessarily. 

We can define functions outside the onload callback and invoke them inside the onload callback. Think of it like a waterfall with our main program entry-point being called from inside window.onload.

TASK(30 mins): 

- Create a function called main.
- Call main() from inside the window.onload callback
- In the body of main, log out a string "Inside main" and get the main-text element from the DOM using getElementById
- Create another function caled logElement that takes a DOM element as a parameter.
- In the body of logElement log out the DOM element
- Inside the main function, invoke the logElement function and pass it the "main-text" element


SOLUTION:

```
//app.js

window.onload = function(){
  main();
}

function main(){
  console.log("inside main");
  var element = document.getElementById('main-text');
  logElement(element);
}

function logElement(anHTMLElement){
  console.log(anHTMLElement.innerHTML);
}
```

##What We've Learned
- We know what the DOM is
- Know why the DOM exists
- How to include JavaScript in a web page
- Attaching a callback to the window object

