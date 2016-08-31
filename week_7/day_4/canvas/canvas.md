#Canvas

###Learning Objectives
  Show creating a canvas tag
  Show drawing basic shapes in the canvas.
  Draw objects based on where a user clicked on the canvas.

##Intro
The canvas is a DOM element that allows us to draw and add images on.  It can also display custom built animations.  The graphing and charting libraries we've been using all use the canvas element to produce the graphic. (Inspect the element and you will see this).
In this lesson you will draw some simple shapes on the canvas.  

Let's add the canvas element to our page.
[i]: Handout startpoint

```
  //index.html
  <!DOCTYPE html>
  <html>
    <head>
      <title>Startpoint</title>
      <script src='app.js'></script>
    </head>
    <body>
      <canvas id='main' width='600' height='200'></canvas>
    </body>
  </html>
```

Can't see anything? Let's put a border around it so we can see the canvas and let's put the canvas in the top left of our window.
```
  //public/main.css
  body {
    margin: 0;
  }
  canvas {
    border: 1px solid black;
  }
```

Okay great we have somewhere that we can draw on. Let's get to it.

##Drawing on the canvas
We want to find the canvas element.  Where should the code live to find the element?(discuss)
In the onload callback function as we know the dom will be loaded and the canvas will be
there to find.

```
  //app.js
  window.onload = function(){
    console.log('App started');
    var canvas = document.getElementById('main');
    console.log('canvas', canvas);
  };
```
Excellent we can see the element.  Now to do stuff from the canvas, we need to get a context of it.
We here ask for the 2 dimensional context of the canvas.  And on this we can draw our first shape!
```
  //app.js
  window.onload = function(){
    console.log('App started');
    var canvas = document.getElementById('main');
    console.log('canvas', canvas);
    var context = canvas.getContext('2d');
    context.fillRect(10, 10, 50, 50);
  };
```
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillRect
What happened here.  The context fillRect method takes in 4 arguments (x, y, width, height),
The x and y state the position where the rect should be, the grid starts with 0,0 in the top left corner.
https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes

Why is it black?  Black is the default fill color for the canvas.
[Task] Change the the color of the rectangle to color of your choice.
https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API

Solution

```
  //index.js
  window.onload = function(){
    console.log('App started');
    var canvas = document.getElementById('main');
    console.log('canvas', canvas);
    var context = canvas.getContext('2d');
    context.fillStyle = 'green';
    context.fillRect(10, 10, 50, 50);
  };
```

##Drawing Paths
For lines and shapes other than rectangles we need to draw paths.

###Drawing a line

```
//index.js
window.onload = function(){
  console.log('App started');
  var canvas = document.getElementById('main');
  console.log('canvas', canvas);
  var context = canvas.getContext('2d');

  //draw rectangle
  context.fillStyle = 'green';
  context.fillRect(10, 10, 50, 50);

  //draw line
  context.beginPath();
  context.moveTo(100,100);
  context.lineTo(100,150);
  context.stroke();

};
```
###Drawing a circle
To draw a circle we also draw a path, with the help of the arc method.
https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes

[Task]  Draw a circle 10mins.
https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/arc

Solution:
ctx.arc(x, y, radius, startAngle, endAngle, anticlockwise)
[:]i Radian angles.  0 = 0, 180deg(half circle) = Math.PI,  360deg(full circle) = 2*Math.PI
[i]: Can show drawing only half a circle to explain start angle, end angle

```
  //draw circle
  context.beginPath();
  context.arc(400,100,20,0,Math.PI*2,true); // Outer circle
  context.stroke();
```

##Interactive canvas
Not only can we draw on the canvas bus we can interact with it.  This is done in the same way interact with any DOM element through events.  Just like we listened to a button click.  We can do the same with the canvas.

```
  canvas.onclick = function(event){
    console.log('clicked', event);
  }
```

In the callback we get passed the event, we can find from this the location that was clicked.

```
  canvas.onclick = function(event){
    console.log('clicked', event);
    console.log('location', event.x, event.y)
  }
```
Note: The event location gives us where the mouse has been clicked relative to the whole window NOT relative to the canvas. It works fine for us here as our canvas is positioned in the top left of the window.

Let's draw a circle at the point which we click.

First let's move the drawing circle functionality into a function

```
  var drawCircle = function(x,y){
    context.beginPath();
    context.arc(x,y,20,0,Math.PI*2,true); // Outer circle
    context.stroke();
  }
```

And now let's call it when we receive a click event

```
  canvas.onclick = function(event){
    console.log('clicked', event);
    console.log('location', event.x, event.y);
    drawCircle(event.x, event.y)
  };
```

Great, we have an interactive canvas.

Example of things we can do in the canvas with a bit of creativity.
http://codepen.io/dissimulate/pen/KrAwx

##Canvas Lab
Make an etch a sketch application in pairs.
Left and right and up and down buttons.

Further: Extend the App, be creative. eg
 - Make a clear button
 - Set the color that is to be drawn!
 - Freestyle!
