#Node Intro

##Intro to Node
Node is a JavaScript runtime for running JavaScript on the backend (rather than the browser). Node uses an event-driven, non-blocking I/O model that makes it lightweight and efficient.

##A Short History
Node was introduced in 2009 by Ryan Dahl and a team of developers at Joyent, a software services company in San Francisco. Node is an asynchronous event driven framework that lets us write JavaScript on the server-side.

We've seen how JavaScript can run in the browser thanks to the JavaScript runtime that browser manufacturers include in their products.

For example, Chrome uses Google's V8 engine to execute the JavaScript we want to run in the browser. This was where JavaScript lived and breathed for many years. The browser environment.

But in 2009, Dahl and his team decided to take the V8 runtime (which is open-source and available to everybody) and moved it to the server side.

Put simply, this means JavaScript can now be run on your own computer or on a server rather than in the browser. Node.js is like a wrapper around the V8 runtime that provides additional functionality for building network applications.

We've already written some programs and used node to run them. Remember we're simply using the same JavaScript robot to interpret our code and run it in on our computer.

Node is really fast. Why? Because if you were to lift the curtain and look inside you'd find that it's all writen in C and C++.

##Rest Recap
The general principle of RESTful routes, is that each URL describes what the expected operation on the resource should be.

Remember we said HTTP uses a set of verbs to retrieve and update resources on the web? The ones we're interested in are GET, POST, PUT and DELETE.

1. URLs
2. HTTP verbs
3. Actions

These 3 things make up a RESTful route

| URL   |      HTTP Verb      |  Action |
|----------|:-------------:|------:|
| /accounts |  GET | index |
| /accounts/new |    GET   | new |
| /accounts | POST |  create   |
| /accounts/:id | GET |  show   |
| /accounts/:id/edit | GET |  edit   |
| /accounts/:id | PUT |  update   |
| /accounts/:id/delete | DELETE |  destroy   |

##What is Express?
A lightweight un-opinionated ***web framework*** for node.

When we built our first web app with Ruby we used a web framework called Sinatra. But it gave us lots of handy functionality.

That's what ***Express*** does for us but in JavaScript sitting on top of node. It's a Sinatra inspired web framework for node.

[Express Docs](http://expressjs.com)

##What is Insomnia?
Since we're going to be working on the backend, we want to be able to test our API without having to write front-end JavaScript yet.

Insomnia is a **REST client** that we can use to send and receive JSON quickly and easily.

[Download Insomnia](http://insomnia.rest)
