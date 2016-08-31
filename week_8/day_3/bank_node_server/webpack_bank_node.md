#Webpack Server/Node

We were displaying the information of a sample json file.  What if we now wanted to updated the information.  Say add a new account, or make an interest payment?

To do this we need to move from the 'dummy' data that we were using, and move to communicating with a server to store our information.    We would then need to update the data from the server with any changes we had made.

This method of first working with stubbed out server data, is very common and powerful when creating the frontend.

We created a server during our project using Ruby and Sinatra. Today we are going to see how we are going to create a server in in Javascript using node and a Sinatra inspired node server called Express.

DO node_intro.md
Add Express Intro

#Sending JSON from Node.
Instead of stubbing out the data in the frontend, let's send our JSON file from the server.

First let's move our sample.json file from the client to the server.

Let's make sure we've installed everything.

```
//client

npm install
```

```
//top level folder
npm install
```

[i]: In sample.json remove the module.exports = 

```
  cd client/src
  mv sample.json ../..
```

Now we need to serve this file.

```
var fs = require('fs');
var ACCOUNTS_FILE = path.join(__dirname + '/sample.json');
//...

app.get('/accounts', function(req,res){
  fs.readFile(ACCOUNTS_FILE, function(err, data){
    if(err){
      console.error(err)
      return
    }
    res.json(JSON.parse(data))
  })
})
```

Now let's localhost:3000/accounts

Excellent we can see the accounts.

##Getting the Accounts
How can the client get these accounts from the server.

[Discuss]

Just like we got the countries using an AJAX request, we can do the same here.

First we want to remove the reference to our client side sample.json.

While we're at it, let's move the display logic into a function.

```
var Bank = require('./bank/bank.js');
var Account = require('./bank/account.js');

var url = 'http://localhost:3000/accounts';

var createItemForAccount = function(account){
  var accountListItem = document.createElement('li');
  accountListItem.innerText = account.owner + ": £" + account.amount;
  return accountListItem;
}

var populateAccountList = function(listElement, accounts){
  for(account of accounts){
    listElement.appendChild(createItemForAccount(account));
  }
}

var displayBank = function(bank){
  var totalDisplay = document.getElementById('total');
  var businessTotalDisplay = document.getElementById('business-total');
  var personalTotalDisplay = document.getElementById('personal-total');

  totalDisplay.innerText = "Total: £" + bank.totalCash();
  businessTotalDisplay.innerText = "Total Business: £" + bank.totalCash('business');
  personalTotalDisplay.innerText = "Total Personal: £" + bank.totalCash('personal');

  var businessAccountList = document.getElementById('business-accounts');
  var personalAccountList = document.getElementById('personal-accounts');

  populateAccountList(businessAccountList, bank.filteredAccounts('business'))
  populateAccountList(personalAccountList, bank.filteredAccounts('personal'))
}

window.onload = function(){
  var bank = new Bank();
  var request = new XMLHttpRequest();
  request.open("GET", url);
  request.onload = function(){
    if(request.status === 200){
      console.log('got the data');
      console.log(request.responseText);
      var sampleAccounts = JSON.parse(request.responseText)
      for(account of sampleAccounts){
        bank.addAccount(new Account(account));
      }
      displayBank(bank)
    }
  }
  request.send(null);
};


```

Much nicer.  Excellent we are now returning the information from the server.
The next step is to be able to add bank accounts.  This will require changing the data on the server. How can we do this?

[Discuss]  What api routes would be. How we would change data: simply changing file, database, sql, nosql lead into Mongo.
