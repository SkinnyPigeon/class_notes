#Local Storage
1.5 hrs

###Learning Objectives
Use local storage on browser to persist data.

Start Point = event_application_end_point

##Intro
Remember our lovely film app that we made on Monday, allowing us to add our favourate films?  Unfortunatly it didn't remember and every time we came back to it, it would forget what we had added.

In this lesson we are going to see how we can persist data in the browser's local storage to remember this.

Next week we will see how we can persist this data to the server.  But it's useful to see how we can store stuff in the browser, which can aid in reducing the communication required with the server.  And also help us in 'offline' first solutions.

https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API


##Local Storage
Local storage gives us a way to persist data - this will hang around even when the browser is closed.

We do this saving key/value pairs (both which must be strings).  Let's see how we do this.

```
localStorage.setItem('films', " my films ");
localStorage.getItem('films');
```
Close browser and show how we can do this again.


So we can save strings, great.  What about objects. Enter JSON

##JSON

JSON stands for JavaScript Object Notation.
It gives us a way to represent our javascript object as text.

It will look very familiar to you as it looks very similar to a JS object.
Notice keys are explicitly set as strings

https://en.wikipedia.org/wiki/JSON

Later today we'll see JSON used to transfer information from a server to our client app. A very common use case.

JSON is super easy to convert to a JS object and back.

```
	//console
	var person = {
		name: 'Guybrush',
		items: ['red herring', 'cutlass']
	}

	var jsonString = JSON.stringify(person);

  jsonString.name //Doesnt work

	var backToPerson = JSON.parse(jsonString);

  backToPerson.name //should work

```

## Applying this into our movie app.

Let's write the code to get the films from local storage and display them.

```

  var films = JSON.parse( localStorage.getItem('film_app_list') ) || []
  console.log("on init got films", films);
  films.forEach(function(filmName){
    var li = document.createElement('li');
    li.innerText = filmName;
    var ul = document.getElementById('film-list');
    ul.appendChild(li);
  })
```

Obviously this won't display anything until we start storing the values.  Let's do this.

```
    //Storing films
  var handleClick = function(){
    console.log('Woah I was got clicked')
    var textInput = document.getElementById('film-text-input')
    var filmName = textInput.value;
    console.log('film name', filmName);

    var li = document.createElement('li');
    li.innerHTML = filmName;
    var ul = document.getElementById('film-list');
    ul.appendChild(li);

    //Storing films
    films.push(filmName);
    localStorage.setItem( 'film_app_list', JSON.stringify(films) )
  }  
```

Fantastic we have a persistent frontend application.


##Exercise - 30 mins
Refactor the application.

[i]: Discuss with class things that they thing could be refactored
