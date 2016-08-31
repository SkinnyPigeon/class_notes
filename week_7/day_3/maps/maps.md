#Learning Objectives
* Make a simple google map
* Add markers
* Add click event
* Add info windows
* Use geolocation to center map
* Use custom icons

# Mapping and Geolocation

Maps and geolocation has become a big thing - almost every website you visit will have a map or a "share location" feature on it. Today we are going to look at how we can utilise this in our own apps.

# Google maps

[i]: Hand out start point
Awesome now we are ready to include a link to the script that gives us access to the google maps api. Let's add it just before the closing body tag.


A popular mapping library is google maps. Let's get started and add one to our page.

```
#index.html
<script src="https://maps.googleapis.com/maps/api/js"></script>
```

We also need a div for our map to live inside which we will add inside the body tags.

```
#index.html
  <div id='map'>
    </div>
```

At the very least, this div must have a height or it won't display. Let's go to our main.css file in the public folder


Let's give our map a width and a height.

```
#main.css
#map {
	height:500px;
	width:500px;
}
```

There's a script in the public folder called app.js where we are going to start putting our code in.
Again we need to add a link to this in our html. Let's add it after the google maps api link (order is important!).

```
#index.html
 <script src='app.js'> </script>
```

Cool now we are ready to add our map! Now, we need to make sure our map loads AFTER the DOM is ready and the elements we expect to be there exist. In our case, it's our "map" div. Google maps has a special function we can call to achieve this.

```
#app.js
window.onload = initialize;
```
This calls the initialize function when the window has loaded so any code we write in there is going to execute only after the window has loaded everything it has.

Let's define this function.

```
#app.js
//PUT THIS ABOVE window.onload !!!!!!!!!
var initialize = function(){
}
```
Let's call a class of our own called Map and create it. We'll make this in a separate script called map.js

```
#terminal - public folder
touch map.js
```
We will need to add this to our index in a script tag, below app.js.

```
#index.html
<script src='map.js'> </script>
```

```
#map.js
var Map = function(){map.js
}

#app.js
var initialize = function(){
 var map = new Map(); //NEW
}
```
Google maps api provides us with a method that allows us to attach a google map to a particular dom element we specify.

```
#map.js
var Map = function(){
  this.googleMap = new google.maps.Map(document.getElementById('map'), {

  }); //NEW
}
```
The second parameter here is an object which takes our settings. At the very least, we have to tell the map where to centre on for the first load and also what the zoom level should be.

```
#map.js
var Map = function(){
  this.googleMap = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.712784, lng: -74.005941}, //NEW - WATCH SPELLING
    zoom: 10 //NEW
  });
}

```
Now if we go to localhost:3000 we should see something spectacular. Whoot! There's our map.

[TASK:] Find out the latlng for London and centre the map on it.


We should probably pass in the latLng to the constructor. We'll put it into a variable since we'll want to use it later ;)

```
#map.js
var Map = function(latLng){ //UPDATE
  this.googleMap = new google.maps.Map(document.getElementById('map'), {
    center: latLng, //UPDATE
    zoom: 10
  });
}

#app.js
var initialize = function(){
  var centre = {lat: 51.507351, lng: -0.127758}; //NEW
  var map = new Map(centre);
}
```

While we are at it, let's move the zoom into a parameter too.

```
#map.js
var Map = function(latLng, zoom){ //UPDATE
  this.googleMap = new google.maps.Map(document.getElementById('map'), {
    centre: latLng,
    zoom: zoom //UPDATE
  });
}

#app.js
  var zoom = 10; //NEW
  var map = new Map(centre,zoom); //UPDATE
```

## Markers

Wouldn't it be nice to put a marker on the map to show something we are interested in? Let's do it. The easiest one to add is a marker for the centre of the map. Remember how we pulled that latLng into a variable? It's going to come in useful now.

We can use a google maps Marker object, which has one parameter - a settings object. At the very least it needs a position, and a map that it's to be attached to.

Let's make a new function inside our map class.

```
#map.js
this.addMarker = function(latLng){
    var marker = new google.maps.Marker({
      position: latLng,
      map: this.googleMap
    });
  }
```
Let's add a marker to the centre of our map.

```
#app.js
map.addMarker(centre);
```

We can't really see it so let's increase the zoom.

```
#app.js
var zoom = 18; //UPDATE
var map = new Map(centre,zoom);
```
There is a handy website we can use to get the lat longs for things http://www.latlong.net/ let's use this to add interesting things to our map. Charing Cross Underground seems to be nearby, let's add that guy.

```
#app.js
map.addMarker({lat: 51.507661, lng: -0.127791});
```

[i:] Go off and find an interesting place nearby and add a marker to it.

## Marker Labels

So that's cool. The only problem is we have no idea what our markers are. We can mitigate this slightly by giving them labels. A label must be a one character long string.

```
#map.js
this.addMarker = function(latLng, label){ //UPDATE
    var marker = new google.maps.Marker({
      position: latLng,
      map: this.googleMap,
      label: label //UPDATE
    });
  }

#app.js
map.addMarker(centre, "1")
```
Notice that the label has to be a string or it will not display.

## Click events

There are many map events that we can hook into - you can see them in the api documentation:

https://developers.google.com/maps/documentation/javascript/examples/event-simple

The simplest one is the click event on the whole map. Let's add a wee function to our map to handle this.

```
#map.js
this.bindClick = function(){;
    google.maps.event.addListener(this.googleMap, 'click', function(event) {
    	console.log("yo");
    });
  }

#app.js
map.bindClick(); //REMEMBER THIS LINE
```
This function passes in an "event" object we can get properties from, including the lat lng of the point that was clicked.

```
#map.js
this.bindClick = function(){;
  google.maps.event.addListener(this.googleMap, 'click', function(event) {
  		console.log(event.latLng.lat());
  });
}
```
Confusingly, the lat is a function so remember the curly brackets to invoke it.

Do you think you can combine this with the add marker function to add a marker at the location where someone clicks? We would like the label to be a number that starts at 1 on the first marker, then 2, then 3 etc.

Hint: You need to be careful with the scope of "this"...

[i:] Give them 15 mins to try this. AND WATCH THEM FAIL

Stinky "that" solution.

```
#map.js
this.bindClick = function(){
    this.counter = 1;
    var that = this;
    google.maps.event.addListener(this.googleMap, 'click', function(event){
      that.addMarker({lat: event.latLng.lat(), lng: event.latLng.lng()}, that.counter.toString());
      that.counter++;
    });
  }
```

In a callback, "this" is set to the element that triggered the callback, not as we would like here, to be the object that the method was defined on.  This has cause many Javascript programmer to table flip.

We can overcome this using the bind method.  This is a method on a function that clones the function it was called on, but with this explicitly set to what we pass in.

```
#map.js
this.bindClick = function(){
    this.counter = 1;
    google.maps.event.addListener(this.googleMap, 'click', function(event){
      this.addMarker({lat: event.latLng.lat(), lng: event.latLng.lng()}, this.counter.toString());
      this.counter++;
    }.bind(this));
  }
```

[Side Mission] Play with bind.

```
  var person = {
    name: 'val',
    talk: function(){ console.log('hello my name is ' + this.name) }
  }
  person.talk();

  var fakePerson = {name: 'Trickster'};
  var newTalkFunction = person.talk.bind(fakePerson);
  newTalkFunction();
```

# Geolocation

Wouldn't it be nice if the map could centre automatically based on our location? Let's do it. Firstly, let's comment out our little markers and click event since we don't need them right now.

```
#app.js
//map.addMarker(centre,"1");
//map.addMarker({lat: 51.507661, lng: -0.127791},"2");
//map.bindClick(); 
```

HTML provides an object called "navigator" that we can use to get location information. Let's make a new class which is going to handle this behavior and put it in a file called geoLocator.js.

```
#terminal - public folder
touch geoLocator.js
```
Again we need to include this script in the index file, below map.js.

```
#index.html
  <script src='geoLocator.js'> </script>
```
Let's make our GeoLocator object which takes in a map. By "map" we mean our map object, not the googleMap inside of it.

```
#geoLocator.js
var GeoLocator = function(map){
  this.map = map,
}

#app.js
var locator = new GeoLocator(map)
```
Let's add a method that sets the centre of the map to the user's position. We can use a method called getCurrentPosition on navigator, which takes a callback which runs when the users location has been found (or not!).

```
#geoLocator.js
var GeoLocator = function(map){
  this.map = map,
  this.setMapCentre = function(){ //NEW
    navigator.geolocation.getCurrentPosition(function(position) {

    });
  }
}
```

We do need to be aware that geolocation only works on supported browsers and that the position may fail to be looked up - we need to make sure our code can handle this but we won't worry about this for now.

Now we can use this to set the centre of the map. We need to be careful of the scope of the "this" keyword here.

```
#geoLocator.js
var GeoLocator = function(map){
  this.map = map,
  this.setMapCentre = function(){
    navigator.geolocation.getCurrentPosition(function(position) {
      var centre = {lat: position.coords.latitude, lng: position.coords.longitude}; //NEW
      this.map.setCentre(centre); //NEW
    }.bind(this)); //NEW
  }
}

#map.js
this.setCentre = function(latLng){
    this.googleMap.setCenter(latLng);
}

#app.js
locator.setMapCentre();

```

You'll notice that it takes a second or two for the map to update. We should probably show the user some visual feedback about this.

Let's add a little hidden p tag. We'll pop this under our map div.

```
#index.html
<p id="info" style="display:none">Finding your location...</p>
```
We'll show this when we are finding the location and hide it when it's found. Let's add the code to show it just before the navigator location function.

```
#geoLocator.js
this.infoElement = document.querySelector("#info")
```

Let's add a method that will allow us to change the display value on this element.

```
#geoLocator.js

this.setInfoDisplay = function(displayValue){
    this.infoElement.style.display = displayValue
  }
```
Let's call this in our map centering function.

```
#geoLocator.js
this.setMapCentre = function(){
    this.setInfoDisplay("block"); //NEW
    navigator.geolocation.getCurrentPosition(function(position) {
      var centre = {lat: position.coords.latitude, lng: position.coords.longitude};
      this.map.setCentre(centre);
      this.setInfoDisplay("none"); //NEW
    }.bind(this));
  },
```
Now our user can see that we are updating the map.

# Info Windows

You may have noticed on google maps that sometimes an information window pops up when a marker is clicked. We'll add our own in just a moment. First, some housekeeping. We need to turn off the geolocator - it will just get in the way.

```
#app.js
//var locator = new GeoLocator(map);
//locator.setMapCentre();
```
Let's also comment out the div we used.

```
#index.html
 <!--  <p id="info">Finding your location...</p> -->
```

Let's add an infowindow to a marker on the centre of our map. First we need a method on our map to let us do this.

```
#map.js
this.addInfoWindow = function(latLng, title){

}

#app.js
map.addInfoWindow(centre, "my info window"); //NEW
```
First we will add a marker. Let's return the marker from the function so we can use it and also remove the label property and add a title instead. A marker is just an object so we can easily just add a custom property to it.

```
#map.js
this.addMarker = function(latLng, title){ //UPDATE
    var marker = new google.maps.Marker({
      position: latLng,
      map: this.googleMap,
      title: title //UPDATE
    });
    return marker //NEW
  }
```
We can call our addMarker function in our infoWindow method.

```
#map.js
this.addInfoWindow = function(latLng, title){
    var marker = this.addMarker(latLng,title) //NEW
  }
```
Next, we want to add a "listener" to the marker so that it knows what to do when it is clicked on. This is provided to us by the google maps api.

```
#map.js
this.addInfoWindow = function(latLng, title){
    var marker = this.addMarker(latLng, title);
    marker.addListener('click', function() { //NEW

    });
  }
```
Next we want to create a new infowindow object using the api. We'll set the contents to be the title of our marker.

```
#map.js
this.addInfoWindow = function(latLng, title){
    var marker = this.addMarker(latLng, title);
    marker.addListener('click', function() {
      var infowindow = new google.maps.InfoWindow({ //NEW
          content: this.title
        });
    });
  }
```
Lastly we need to tell the infowindow to open.

```
#map.js
  this.addInfoWindow = function(latLng, title){
    var marker = this.addMarker(latLng, title);
    marker.addListener('click', function() {
      var infowindow = new google.maps.InfoWindow({
          content: this.title
        });
      infowindow.open(this.map, marker); //NEW
    });
  }
```
Sweet!

[TASK:] Add another point with an infowindow (5 mins)

```
#app.js
  map.addInfoWindow({lat: 51.507953, lng: -0.127758}, "my sweet point 2 yo");
```

Pretty sweet right? We can also add html as the content of our infowindow.
```
#app.js
  map.addInfoWindow({lat: 51.507953, lng: -0.127758}, "<h2>my sweet point 2 yo</h2>");
```

## Custom Icons

The other sweet thing we can do is add custom icons to our markers. Let's comment out our infowindow for now.

```
#app.js
//map.addInfoWindow({lat: 51.507953, lng: -0.127758}, "my sweet point 2 yo");
```
We need to add an icon property to our marker.

```
#map.js
this.addMarker = function(latLng, title, icon){ //UPDATE
    var marker = new google.maps.Marker({
      position: latLng,
      map: this.googleMap,
      title: title,
      icon: icon //NEW
    });
    return marker
  },
```
We also need to pass it though our infowindow function.

```
#map.js
this.addInfoWindow = function(latLng, title, icon){
    var marker = this.addMarker(latLng, title, icon);
```
Cool let's turn our click event back on.

```
#app.js
map.bindClick();
```
We need to modify our bindClick method a little so it uses our infoWindow method. We can also remove the superfluous counter variable.

[i:] Paste https://33.media.tumblr.com/avatar_e2fbfbcbb52d_128.png

```
#map.js
this.bindClick = function(){
    google.maps.event.addListener(this.googleMap, 'click', function(event){
      this.addInfoWindow({lat: event.latLng.lat(), lng: event.latLng.lng()}, "meow!", "https://33.media.tumblr.com/avatar_e2fbfbcbb52d_128.png");
    }.bind(this));
  },
```
Then let the magic happen! Ooooh yeeeah.
