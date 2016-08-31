var init = function(){
  console.log('app started');
  main();
}

function main(){
  var button = document.getElementById('add-button');
  button.onclick = handleClick;

  var form = document.getElementById('film-form');
  form.onsubmit = handleSubmit;
}

var handleClick = function(){
  console.log('Woah I was got clicked');
  var textInput = document.getElementById('film-text-input');
  var filmName = textInput.value;
  console.log('film name', filmName);

  appendFilm(filmName);
}

var handleSubmit = function(event){
  event.preventDefault();
  handleClick();
}

var appendFilm = function(filmName){
  var li = document.createElement('li');
  li.innerText = filmName;
  var ul = document.getElementById('film-list');
  ul.appendChild(li);
}

window.onload = init;