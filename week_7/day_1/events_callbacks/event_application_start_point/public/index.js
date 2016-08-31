var init = function(){
  console.log('app started');
  var button = document.getElementById("add-button");

  console.log('button', button);

  var handleClick = function(){
    console.log('Woh I got clicked');
    //get text from textbox
    var getText = document.getElementById('film-text-input').value;
    console.log('got text', getText);
    //Create a list item, set the text to that found from input, add to film list

    var filmList = document.getElementById('film-list');
    var newFilm = document.createElement('li');
    newFilm.innerText = getText;
    filmList.appendChild(newFilm);
    
  }

  var form = document.getElementById('film-form');

  form.onsubmit = function(event){
    console.log('event', event)
    event.preventDefault();
    handleClick();
  }




  button.onclick = handleClick;
}


window.onload = init;
