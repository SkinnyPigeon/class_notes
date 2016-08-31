#JS Events and Callbacks

##Learning Objectives
 - Describe events and callbacks
 - Use event driven callbacks to listen to a button click
 - Update the DOM on a button click

###Duration
	1 - 1.5hr

## Events Introduction
In this lessons we are going to see how we can make interactive web applications that listen to the user input.  To do this we are going to learn about events and callbacks.

[i:] Give out starting point for event application

So we have a very simple app that has an empty list waiting to add some films.  In our last app we populated a list with quotes from an array.  What we'd like to happen here is for the user to enter a name of a film and to create an element for it.

We were briefly introduced to events and callbacks for making sure we only try to access Document Object Model objects after they have been loaded.

Look in our app.js.  We see here, that we wait for the window to load before we run our main script.

Look in the console to check that this is working.

To make this clearer we can assign the function to a variable.

```
window.onload = function(){
  console.log('app started');
}

```  

This event/callback programming style is how we listen to events from our DOM.  We can listen to many different events, and choose what behaviour we want to assign.

Let's see how we can listen out for a form being submitted.

### Button Click
First let's create a button.

```
	//index.html
	<form>
		<input type="text" id="film-text-input" size="40" placeholder="Film name">
		<input type="button" id="add-button" value="Add Film">
	</form>
```

Cool, we have a button and a text field, but it's doing nothing. Let's get it doing something.

Let's create a main() function that we can call from inside our window.onload().

```
	//app.js
function main(){
	var button = document.getElementById('add-button');
	button.onclick = function(){
		console.log('Woah I was got clicked');
	}
}
```

[i]: check this works

[i]: 5 minutes

Let's refactor this to have a named function.

```
	//app.js
	function main(){
	  var button = document.getElementById('add-button');
	  button.onclick = handleClick;
	}

	var handleClick = function(){
	  console.log('Woah I was got clicked')
	}
```

When we clicked the button, the click event got triggered, it saw it had a handler and calls it.

####Getting the film name

[Exercise 10mins]: In the handle click function get the text input value and log it.


We can use the value property of the text input to get the string value

```
	//app.js

	var handleClick = function(){
		console.log('Woah I was got clicked')
		var textInput = document.getElementById('film-text-input')
		var filmName = textInput.value;
		console.log('film name', filmName);
	}			

```
Quality. So when the button is clicked it triggers the handler, which then finds the value of the text input.

Earlier we saw how we can add elements to the DOM. Let's try and do this in our button click callback.

[Exercise 20mins]: In the handle click function add a list item to the film list.

####Adding a list item

```
	//app.js

	var handleClick = function(){
	  console.log('Woah I was got clicked');
	  var textInput = document.getElementById('film-text-input');
	  var filmName = textInput.value;
	  console.log('film name', filmName);

	  appendFilm(filmName);
	}

	var appendFilm = function(filmName){
	  var li = document.createElement('li');
	  li.innerText = filmName;
	  var ul = document.getElementById('film-list');
	  ul.appendChild(li);
	}		

```

Alright alright alright!  We now have a dynamic, event driven frontend! Listening for user input and updating the DOM. Thank you JavaScript.


Listening to submitting a form with Enter.
Preventing Default. We'll have to give the form an ID first. 

```
function main(){
  var button = document.getElementById('add-button');
  button.onclick = handleClick;

  var form = document.getElementById('film-form');
  form.onsubmit = handleSubmit;
}

var handleSubmit = function(event){
  event.preventDefault();
  handleClick();
}
```

For all the available [Event handler docs](https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers)
	