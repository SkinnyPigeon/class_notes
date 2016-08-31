# JavaScript Introduction

### Learning Objectives
- History of Javascript
- Describe the uses of Javascript
- Describe change in client server responsibilities
- Setup npm and node
- Run first Javascript program


1hr

# What is JavaScript

Javascript is a programming language.  Let's recap what this means.

The role of a programmer is to break down real world problems, models, games and explain them to a computer.

Computers speak in a binary machine code language. Communicating constantly in this would not be efficient.

Fortunately, nice people have created interpreters,  which translate higher level languages into this machine code.

Javascript is one of these high level languages.  Learning to speak in it allows us to communicate to the computer via an interpreter.

Enter ****Bot.  

Javascript has one particularly famous interpreter,  the browser.


## Browser recap.

Go over what the browser does.


[i]: There's a keynote presentation in history_of_javascript folder if you want to do that

## History of JavaScript
JavaScript was initially called LiveScript and was written by a guy call Brendan Eich who was hired by NetScape to create it. It was originally written in 10 days, rumor has it he was no stranger to a bottle of whiskey when he was doing it (when you see truthiness you will understand this!).

## Why is it called JavaScript?
Someone in the marketing department thought that it was a good idea to piggy back on the success of Java - a totally unrelated language. If JavaScript is a puppy then Java is a zombie polar bear. You should never call JavaScript "Java". Or else.

## ECMAScript
It needed to be standardised but for some reason the w3c (the world wide web consortium who dictate web standards - google it if you are interested) refused to do this.

It ended up at ECMA (European Computer Manufacturers Association). They are now in charge of every release of JavaScript and the direction it takes.

ECMAScript and JavaScript are the same thing, but ECMAScript is the "official" name.

Javascript is continually evoloving.  Their is a current significant update going on to the language, moving from ES5 to ES6.

https://github.com/lukehoban/es6features

## Web pages to web applications

Historically browser based web applications were linked text pages - hence the name web page.

[i]: Show old school web page - wikipedia

Most pages used no JavaScript,  or a sprinkling to enhance the page.

For many uses this is completely valid and so far this is how we have been creating web apps using Sinatra and rails.

As JavaScript performance in the browser and on mobile phones has improved, the scope of application that can be built in the browser has grown.

[i]: Show web app - spotify, google docs..

Modern browser based applications are a world away from the web pages of the past.
For these applications the browser is no longer a lowly text display,  but a JavaScript run time environment.

Applications have moved so that a lot more "business logic" in the front end, leaving the back end to behave simply as an api.


#Using Javascript

# Let's make some stuff

The most famous JavaScript interpreter is the browser.  The browser has many additional capabilites for web applications, to allow us to focus on the JavaScript language itself we will use the node interpreter.

Next week we're going to move on to using the browser with all it's extra tools.

First, we need to install node (get the robot) but it's dead simple.

##Installing Node
```
brew install node

#terminal
node -v
```
Now all that's blocking us is learning how to talk JS.

Let's make our first little JavaScript app, it's going to be amazing.

```
mkdir node_app
cd node_app
touch app.js
subl app.js
```

## Variable declaration

In JavaScript we have to use a special word before the variable name.
Convention variable names are camel case.

```
var myBear;
```

Notice, also the semi-colon. In JavaScript we finish each line or declaration with a semi-colon. Although your code will probably run without it, it's good practice. The exception is after a closing curly bracket }.


##Creating our first program
We can make a wee function that takes in a name and prints it out to the screen.

```
//app.js

function hello(name){
  console.log(name + " you are awesome!");
}

hello("Keith");
```
Just like we did with Ruby, we can type the super special keyword "node" into the terminal to get our robot to run our app.

```
node app.js
```

##This course

3 Weeks and a project.

 - Week1: Language fundamentals, tdd
 - Week2: Javascript in the browser.
 - Week3: Javascript full stack. Combining both weeks.
 - Project.
