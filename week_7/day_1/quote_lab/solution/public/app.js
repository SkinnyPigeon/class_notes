var quotes = [
    {text: "Visual Basic is the way forward, I don't know why we are doing JavaScript. ",
     author:"Jay Chetty"
    },
    {text: "The only CSS you need to know is background-color: tomato ",
     author:"Rick"
    },
    {text: "Are those hand-cut artisan crisps? ",
     author:"Keith"
    },
    {text: "Scaffolding is nothing but a fiery hell. ",
     author:"Valerie"
    },
  ]

window.onload = function(){
  main();
}

function main(){
  var quoteList = document.getElementById('quote-list');
  var form = document.getElementById('quote-form');
  var quoteInput = document.getElementById('quote-text-input');
  var authorInput = document.getElementById('author-text-input');
  var tmpElement = createQuote("", "");

  // setup existing quotes
  for (var i of quotes) {
    quoteList.appendChild(createQuote(i.text, i.author));
  }

  function createQuote(quoteText, authorText) {
    var container = document.createElement("li");
    var quote = document.createElement("blockquote");
    quote.innerHTML = quoteText + " ";
    var author = document.createElement("cite");
    author.innerHTML = authorText;
    quote.appendChild(author);-
    container.appendChild(quote);
    container.appendChild(document.createElement("hr"));
    return container;
  }

  form.onsubmit = function(event) {
    event.preventDefault();
    tmpElement = createQuote("", "");
    resetForm();
  }

  var resetForm = function() {
    quoteInput.value = "";
    authorInput.value = "";
  }

  var handleKeyChange = function() {
    if (quoteInput.value || authorInput.value) {
      modifyQuote(tmpElement, quoteInput.value, authorInput.value);
      quoteList.appendChild(tmpElement);
    }
  }

  var modifyQuote = function (el, newText, newAuthor) {
    el.childNodes[0].innerHTML = newText + " <cite>" + newAuthor + "</cite>";
  }

  // delete a quote if clicked on
  quoteList.onclick = function(event) {
    if(quoteList.lastChild === event.target.parentNode) {
      resetForm();
    }
    quoteList.removeChild(event.target.parentNode);
  }

  quoteInput.oninput = handleKeyChange;
  authorInput.oninput = handleKeyChange;
}
