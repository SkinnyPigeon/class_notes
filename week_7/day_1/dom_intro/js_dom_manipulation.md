#Manipulating the DOM

##Learning Objectives
- Understand what the document object is
- Know how to access, update, create and append DOM elements

### Duration
1 hour

##Document Object
The document object represents any web page loaded into the window and serves as the entry point to the page's content and the DOM tree.

The document is the object that we're most interested in. It has methods that we can use to access DOM elements. 

You can think of these as the tags in our HTML document but wrapped with extra properties and functionality.

The document will be our friend for the next few days.

When the window onload event is triggered, we know that the document has loaded. This means we can now access elements in the DOM and start manipulating them with JavaScript. 

Why? This is the crux of frontend JS. To be able to manipulate what the user experiences without having to make another request to the server. 

If we type 'document.' (the dot is important) into the console you'll see a huge list of methods that are attached to it.

```
  //browser console!
  document.
  document.children
```

##Accessing DOM Elements

There are a handful of methods on the document object that we will use a lot to dip into the DOM and grab a reference to the HTML elements.

[i]: Hand out dom_manipulation_start_point


##Accessing By ID

Let's say we want to find the tagline div.
We can ask the document to get us specific elements by its ID

```
//console 

var element = document.getElementById('tagline'); // (fastest way to get an element from the document)
```

##Accessing Elements By Class Name

```
var elements = document.getElementsByClassName('quote'); 
```

##Accessing Elements by Tag Name

```
var elements = document.getElementsByTagName('p') 
```

##Using querySelector to Get First One

With HTML5 we have another way to query the DOM.
Query selector takes in a string and uses CSS selectors to know what it is looking for.

```
var elements = document.querySelector('.quote')
```

##Using querySelector to Get All

```
var elements = document.querySelectorAll('.quote')
```
 
NOTE: All of these except getElementById and querySelector return a collection of HTML Element Objects.

##Updating Elements

Ok, that's all good and well. But what can we do with the elements once we've got them?

###Updating The innerHTML and innerText

```
  //broswer console
  var tagline = document.getElementById("tagline");
  tagline.innerText = 'New Tagline';
  tagline.innerHTML = '<h2>New Tagline</h2>';
```

###Updating The Class Name

.className gets and sets the value of the class attribute of an element.

```
// browser console
var quotes = document.getElementsByTagName('article');
var articleClass = quotes[0].className;
```

```
// set the class name of an element
quotes[0].className = 'red-quote';
```

MiniLab: 30mins

Let's practice traversing the DOM.

Create an app.js (remember to include a script tag in your HTML!) and inside your window.onload do the following: (you can add ids to the HTML tags)

- Task 1: Get the quote of the day
- Task 2: Get the button
- Task 3: Get the last quote
- Task 4: Hide the quote of the day.

[i]:  Good to talk about difference between visibility hidden, display: none.

Hiding an element can be done by setting the display property to none. The element will be hidden, and the page will be displayed as if the element is not there.

Alternatively visibility:hidden; also hides an element.

However, the element will still take up the same space as before. The element will be hidden, but still affect the layout.

SOLUTION:

```
window.onload = function(){

  var qotd = document.querySelector('#quote-of-the-day');
  console.log(qotd);
  // qotd.style.visibility = 'hidden';
  qotd.style.display = 'none';
``
  var buttons = document.getElementsByTagName('button');
  console.log(buttons[0]);

  var quotes = document.getElementsByClassName('quote');
  console.log(quotes[quotes.length-1].children[0].innerText);

}
```

##Looping Round an Array of Elements

Let's change all of our articles to have a sweet wheat background

```
var articles = document.getElementsByTagName('article');
  for (var i = 0; i < articles.length; i++) {
    articles[i].style.backgroundColor = 'wheat';
  };
```

##Creating DOM elements and appendChild
We can create new DOM elements using document.createElement(name of element) and add it to the 

Let's create a new quote:

```
  var quoteArticle = document.createElement('article');

  quoteArticle.classList.add('quote')

  var blockquote = document.createElement('blockquote');

  blockquote.innerText = "New Quote. ";

  var cite = document.createElement('cite');

  cite.innerText = "Some Person";

  //add together
  blockquote.appendChild(cite);

  quoteArticle.appendChild(blockquote);

  //attach to DOM
  var quotes = document.querySelector('#quotes');

  quotes.appendChild(quoteArticle);
```

For a list of Element properties and methods please use [the MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Element)

For a list of Document properties and methods please use [these MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Document)

Task:30mins

Using JavaScript.

1. Make even quotes wheat, and odd quotes tomato.
2. Make text color to be tomato when wheat background and vice versa. Beautiful.
3. Change the text on quote of the day to featured quotes.
4. Add a new quote to the featured quotes.

```
  for (var i = 0; i < articles.length; i++) {
    if(i % 2 === 0){
      articles[i].style.backgroundColor = 'wheat';
      articles[i].style.color = 'tomato';
      continue;
    }
    articles[i].style.backgroundColor = 'tomato';
    articles[i].style.color = 'wheat';
  }
```