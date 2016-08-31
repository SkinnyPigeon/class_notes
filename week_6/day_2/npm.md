#Node Package Manager

We could write all our programs from scratch ourselves. But this is often not efficient.

Using programs other people have written and have generously shared can make our lives far easier.  Node package manager NPM is a tool that allows us to download and use libraries. 

It also allows us to describe the dependencies of our program, what it relies on. Further we can generate and share packages we create ourselves!

##Setup
Let's check we all have node package manager installed.

```
  npm -v
```

Cool we now have node package manager and access to a whole world of javascript libraries.

##About
https://www.npmjs.com/
NPM gives us a whole world of libraries let's create a directory that will use some packages from others


##Initializing
Let's first make a directory for our special functionality.


```
  mkdir myrobot_jay_cc_cohort3
```
We don't have to do this but, initializing a npm package will provide a file that states all the dependencies of the project.


```
  cd myrobot
  npm init
```

NPM will help us make a package.json file that will describe the project we are creating.
We'll just press enter through these and come back to them later


```
  subl .
```
Let's open sublime and check out the package.json file.

The package.json file describes our project and all it's dependencies.  We'll build this up.
First we'll see how we can get it to describe our dependencies.

##Installing Package

One of the most commonly downloaded npm packages is Lodash.  It gives us a lot of functionality that comes out the box in ruby. We'll download it as an example of of a npm package.

npm install is the command to install a package locally.  This will create a node_modules folder in the current directory and install the package here.  Later we will see installing a package globally.

The save command adds lodash to our dependencies in the package.json file.  This is very useful for when we share our projects.

```
  npm install --save lodash
```

Two things happened here.  The library was downloaded into node_modules, and the package.json file was updated with the dependency list because of the save command.

Great, this list of dependencies will build up as we install more packages.  We'll see later how using this list of dependencies we can install all project libraries in one command.

What is the deal with the numbering?

##Semantic Versioning
  "lodash": "^4.6.1" (or the like)
  Get them to read.
  https://docs.npmjs.com/getting-started/semantic-versioning

  Semantic versioning is a standard that a lot of projects use to communicate what kinds of changes are in this release


  When releasing libraries a convention is used to describe what changes have been made.

  Three numbers are used,  when the library is updated the publisher can use these numbers to describe the changes.

  MajorRelease.MinorRelase.MinorChanges

  After this, changes should be handled as follows:

  Bug fixes and other minor changes: Patch release, increment the last number, e.g. 1.0.1
  New features which don't break existing features: Minor release, increment the middle number, e.g. 1.1.0
  Changes which break backwards compatibility: Major release, increment the first number, e.g. 2.0.0

  We can use these number to
  "~1.0.0"  === "1.0.x" Latest MinorChange, won't increase release
  "^1.0.0" === "1.x.x" Later MinorRelase, won't update Major release.
  * or x will update to the latest release, dangerous!


##Dev dependencies
Some dependencies we only use for testing and building our project - our developer dependencies we don't need them for actually running our program in production.  We can state a developer dependency when we install our project.

Like in Ruby there are multiple test frameworks in Javascript.

We are going to us a simple framework called Mocha

```
  npm install --save-dev mocha
```

Looking at our package we can see it is in a separate place in it's own developer dependency attribute.
[i]: Dev dependencies will only be installed for the package you are directly installed,  not for it's sub dependencies.

##node_modules, npm install
Node modules is where all our package dependencies are stored.  Now all our dependencies are stated we can reproduce this by typing npm install.  Let's highlight this by deleting it and then creating it.


```
  rm -rf node_modules
  npm install
```

This highlights how we can easily install all the depencies for a package if we have comprehensive package.json file.

Because we can reproduce the dependencies, it is very common to ignore node_modules from our git repository.

```
  touch .gitignore
```

```
  //.gitignore
  node_modules/
```

#Commands
Now we've got our dependencies set up let's write some code.

touch robot_spec.js
touch robot.js

##Creating the spec

We are going to run our spec using a test framework called Mocha.  Node gives us a basic assert object out the box we'll use this for now.

We can use libraries that are available out the box using the require function.

```
  //robot_spec.js
  var assert = require('assert');

  describe('Robot', function(){
    it('should welcome me', function(){
      assert.equal("Hello Jay", "Hello Jay");
    })
  });
```

##Running Tests
```
  node node_modules/.bin/mocha robot_spec.js
```

##NPM scripts
Now we have a test we can add this to our npm package json scripts.

"scripts": {
  "test": "mocha robot_spec.js"
},

```
  npm test
```

[i]: We can install mocha globally here to get the command line tools. 

npm install mocha -g

This convention makes it simple to run tests for a package.

#Requiring files
Using node we can require files using a system called common.js.  This uses a very nice syntax that is similar in ways Ruby.  There are some key difference,  rather than pulling in all the classes, or functions of the file we are requiring, we specifically pull in one object and can assign this to a variable.


```
  var robot = require('./robot');
  var assert = require('assert');

  describe('Robot', function(){
    it('should welcome me', function(){
      assert.equal("Hello Jay", robot.welcome())
    })
  })
```

```
  npm test
```

## Creating Robot
```
  var robot = {
    welcome:function(){
      return "Hello Jay";
    }
  };
```
When a file is require it needs to explicity say what it wants to export.

```
  var robot = {
    welcome:function(){
      return "Hello Jay";
    }
  }

  module.exports = robot;
```

```
  var _ = require('lodash');
  var robot = {
    bestFriend: 'jay',
    welcome:function(){
      return "Hello " + _.capitalize(this.bestFriend)
    }
  }

  module.exports = robot;
```

#Publishing

Publish gem, and get the class to install it and show it working.

Let's create a README
A README file tells the world about what the project is doing.

```
  touch README.md
```

```
  A nice robot friend
```

Also tell the package json the entry point and description and author.

```
  {
    "name": "my_robot_example_cc",
    "version": "1.0.0",
    "description": "A Robot friend",
    "main": "robot.js",
    "scripts": {
      "test": "mocha robot_spec.js"
    },
    "author": "Jay Chetty",
    "license": "ISC",
    "dependencies": {
      "lodash": "^4.6.1"
    },
    "devDependencies": {
      "mocha": "^2.4.5"
    }
  }
```

```
  npm publish
```
Go to npm and see it published

##Using the robot
Let's all use this robot.

mkdir robot_runner

```
  npm init
  npm install --save myccrobot
```

This robot we have created is now installed for us all to use.  Let's use it now.

```
touch robot_runner.js
```

//change example cc to whatever you've just pushed

```
  var robot = require('my_robot_example_cc');
  console.log('robot', robot.welcome());

```

```
  node robot_runner.js
```

We have shared functionality.  This is how easy it is to share and collaborate to the JS open soruce community. Using and sharing functionality allows us to progress much faster collaboratively. "If I have seen further, it is by standing on the shoulders of giants.""


The docs are good:
https://docs.npmjs.com/
