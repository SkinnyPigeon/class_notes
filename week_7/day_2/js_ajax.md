#js_ajax

##Learning Objectives
 - Describe what Ajax means.
 - Use the asynchronous programming techniques to make ajax requests

##Intro
So we've been making our nice responsive apps.  But they are a little isolated.  What we are going to do today is to get our apps talking to the web.  How's it going to do this?  With HTTP of course,  because that is how the web talks.

We are going to see today how we can make HTTP requests using javascript, and do stuff with the results.

These types of request are known as AJAX requests.  This stands for Asynchronus javascript and XML.  Allowing our application to pass and retrieve data without having to reload the page.  AJAX is the bedrock of the one page app. We will make the requests using the asynchronous, callback driven programming techniques we used yesterday and learned more about this morning.

##JSON
To transfer data we need a format to interchange.  JSON is the format of choice.  The X in AJAX is legacy from when XML was used to transfer.

##API
Next week we will be creating our own backend servers which will return the data, but for now we will use some public APIs.  API stands for application programming interface.  In week 3 we started created our own API using Sinatra.  The structure of the backend APIs returning JSON and the and using Javascript to retrieve/update this data using AJAX is the common architecture for modern web applications. We will be seeing a lot more of this on this course.

We are going to be using the restcountry api:
'https://restcountries.eu/rest/v1'
We can make the JSON returned prettier using a chrome extension
https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa/related?hl=en

[i]: Again draw/reuse diagram showing client server model.  Showing how we will be making HTTP requests with javascript and server will return the data we require.


###XMLHttpRequest

We will be using the native WebAPI in the browser that will make an AJAX request, and allow us to associate a callback on how to react to receiving the data.


###Example
Hand out resources/basic_startpoint

```
//index.js
window.onload = function(){
  var url = 'https://restcountries.eu/rest/v1';
  var request = new XMLHttpRequest();
  request.open("GET", url);
  request.onload = function(){
    if(request.status === 200){
      console.log('got the data');
      console.log(request.responseText);
    }
  }
  request.send(null);
};
```
Let's think about what is happening here.  We set up the request and set the callback to the onload function.  Putting it off the main stack and to be handled by the webapis.  Now when the request completes,  the callback function will be processed on the stack and will be able to get the data back as the response text.

The url we used to get our data was this.
https://restcountries.eu/rest/v1

Try typing it into the browser and see what you get.

The restcountries server is returning json to us.  Making it easy for us to convert this into JavaScript Objects.

```
request.onload = function(){
  if(request.status === 200){
    console.log('got the data');
    var jsonString = request.responseText
    console.log(jsonString);
  }
}
```

Let's see what we get. The string of data passed, can be easily converted into an array of objects,  as that is pretty much what the string was showing.  We can they parse this information using JSON.parse and we get our array.

```
request.onload = function(){
  if(request.status === 200){
    console.log('got the data');
    var jsonString = request.responseText;
    console.log(jsonString);
    var countries = JSON.parse(jsonString);
    var country = countries[0];
    console.log(country);
    console.log(country.name);
  }
}
```

You should now be getting pretty excited!  There are tons of interesting API that serve JSON.
