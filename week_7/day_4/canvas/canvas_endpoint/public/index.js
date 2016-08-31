window.onload = function(){

  console.log('App started');
  var canvas = document.getElementById('main');
  console.log('canvas', canvas);
  var context = canvas.getContext('2d');

  context.fillStyle = 'green';
  context.fillRect(10, 10, 50, 50);

  context.beginPath();
  context.moveTo(100,100);
  context.lineTo(100,150);
  context.stroke();

  var drawCircle = function(x,y){
    context.beginPath();
    context.arc(x,y,20,0,Math.PI*2,true); // Outer circle
    context.stroke();
  }
  canvas.onclick = function(event){
    console.log('clicked', event);
    console.log('location', event.x, event.y);
    drawCircle(event.x, event.y)
  };
};
