#Node and Express

##Learning Objectives
 - Get to know Express
 - Clarify the client/server relationship
 - Build a simple Express app

###Duration 
1hr

###Intro (5 mins)
Let's do some recapping.

####What is Express?
Remember Sinatra is a lightweight un-opinionated ***web framework*** for Ruby.

When we built our first web app with Ruby we used a web framework called Sinatra. It was like a lightweight Rails. But it gave us lots of handy functionality.

That's what ***Express*** does for us but in JavaScript sitting on top of node. It's a Sinatra inspired web framework for node.

[Express Docs](http://expressjs.com)

###Request and Response Cycle Recap

Let's recap on the request response cycle [i:] DRAW ON BOARD.

Today we're going to have our server send back an HTML file.

1. We make a request to a server (usually from a browser)
2. The server responds based on the 'route' we provide in the URL (remember RESTful routes?)
3. It sends back some data (a file, or some JSON)
4. The browser gets the HTML and creates a representation of it in memory (the DOM)
5. If we have a script tag in our HTML the browser immediately goes and gets that from the server


###Create an Express Server (codealong)
Let's make our first Express app.

```
//terminal
mkdir express_app
cd express_app
npm init
npm install express --save
touch server.js
```
What's going on here? 

When we run npm init we get a package.json file created for us. This is a list of all the modules that our app depends on. 

It also asks us a bunch of questions. It makes reasonable guesses to the answers so we can just hit enter for each one.

At the moment our package.json has no dependencies. When we install Express with the --save option it adds it as a dependency to the package.json. If someone else wanted to run our app they would type npm install and it would automatically install all the modules in the package.json.

Open up the package.json and you'll see that we now have express as a dependency.

We've installed express but we haven't utilised it in our app. We need to require it in our app to make use of it's functionality.

```
// server.js

var express = require('express');
var app     = express();
var path    = require('path');
```

We now have Express stored in our app variable and all of it's functionality is available to us. Let's create a route using Express. 

We've also made use of the path module that node gives us. Why? Because we want to use it locate the HTML file to send back to the client.

```
//server.js
app.get('/', function(req, res){
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});
```

You can see here this .get method takes two arguments, the first is the path and the second is a function. This function has two parameters. req is the request object and res is the response object. This is a convention and we could quite easily call them request and response.

We can use the res object to return a response to the browser.

So at the moment, we don't have a client/build/index.html file. So let's add that now.

```
//terminal
mkdir client
cd client
mkdir build
cd build
touch index.html
```

And let's create a simple HTML skeleton in index.html

```
//index.html
<!DOCTYPE html>
<html>
<head>
  <title>Express App</title>
  <script src="app.js"></script>
</head>
<body>
  <h1>Hello Express!</h1>
</body>
</html>
```

We've also added a script tag in the HTML. When the browser sees this, it'll go off and get the app.js file.

Let's create one now.

```
//terminal
cd client/build
touch app.js
```

```
//app.js
window.onload = function(){
  console.log("app running");
}

```

We're also going to add a command to tell Express where to find 'static' files. This includes our JS file for the frontend that we're going to create.

```
//server.js
app.use(express.static('client/build'));
```

All we need to do now is serve up our routes on port 3000. 

```
//app.js
app.listen('3000', function(){
  console.log('The magic is all happening on port 3000');
  });
```

Install nodemon if it's not already installed. Remember nodemon is restarting the web server every time we make a change. 

```
// May need to 'sudo'
npm install nodemon -g
```

Let's start our server
```
nodemon server.js
```

##RESTful Recap

Remember our RESTful routes? 

If we were building an api we could make it RESTful in Express just like we did with Sinatra.

For example:

```
var express = require('express');
var app = express();
var path = require('path');
var planets = [{name: "Mars", size: 2093},{name: "Saturn", size: 8823},{name: "Jupiter", size: 13763}];

app.use(express.static('client/build'));

app.get('/', function(req, res){
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});

app.get('/planets/new', function(req, res) {
  // NEW
  res.send("NEW planet route");
});

app.post('/planets', function(req, res) {
  // CREATE
  res.send("CREATE planet route");
});

app.get('/planets/:id', function(req, res){
  // SHOW
  res.json(planets[req.params.id-1]);
})

app.get('/planets/:id/edit', function(req, res) {
  // EDIT
  res.send("EDIT planet route");
});

app.put('/planets/:id', function(req, res) {
  // UPDATE
  res.send("UPDATE planet route");
});

app.delete('/planets/:id', function(req, res) {
  // DELETE
  res.send("DELETE planet route");
});

app.listen('3000', function(){
  console.log('The magic is all happening on port 3000');
});

```

[i]: Make sure students understand the front-end/back-end distinction because we're doing front and back on the same server - can be confusing. 

##In Closing
We've learned:

- Learn how to use Express to send HTML to the browser
- Understood how the browser deals with HTML and JS
- Recap on RESTful routes