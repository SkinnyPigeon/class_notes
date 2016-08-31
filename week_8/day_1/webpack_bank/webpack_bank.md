#Webpack Bank

We want to make a browser UI for our bank account.  We've seen how we can bundle a javascript file for the browser using Webpack.  We are going to do that again here.

##MVP:
- Show total value
- Show list of accounts

##Further:
- Show accounts by type.
- Doing an interest payment.

-
#Setup
Hand out start point. Go over it all and familiarise ourselves.


```
npm init
npm install --save express
```

```
cd client
webpack -w
```

```
//new tab
nodemon server.js
```

#Requiring Bank Account.
We can just copy the bank constructor files into our client folder.
Note how we did npm install to get libraries.  One thing we could do here is package up our own libraries into npm packages. This is really easy. And use it like another package cool!

Hand out Bank. Copy this into your src folder.

No harm in checking the tests for it.

```
  mocha bank/specs
```

Now let's use this bank in our app.js

```
  var Bank = require('./bank/bank.js');

  window.onload = function(){
    console.log("webpack app started");
    var bank = new Bank();
    console.log("We created a bank in the browser with accounts", bank);
  };
```
##Sample Data

Send out gist of the sample JSON file.

This is the sample data we want to use to populate our bank.
We could serve this out from our server, even store it in Mongo and serve it out.  For now we can simply put it in our client folder.

```
  touch sample.json
```

And export it

```
  //sample.json
  module.exports = [..
  ]
```

We can then require this file and use it to populate our bank.

```
  var Bank = require('./bank/bank.js');
  var sampleAccounts = require('../sample.json');
  var Account = require('./bank/account.js');

  window.onload = function(){
    console.log("sample", sampleAccounts);
    console.log("webpack app started");
    var bank = new Bank();
    for( accountData of sampleAccounts ){
      bank.addAccount( new Account(accountData) );
    }
    console.log("We created a bank in the browser with accounts", bank);
    console.log("We created a bank in the browser with value", bank.totalCash());
  };
```

##Read Functionality:
- Show total value
- Show list of accounts

```
<!DOCTYPE html>
<html>
  <head>
    <title>Startpoint</title>
    <link rel='stylesheet' type='text/css' href='main.css'>
    <script src='bundle.js'></script>
  </head>
  <body>
    <h1> CC Bank </h1>
    <h4 id="total"></h4>
    <ul id="accounts"></ul>
  </body>
</html>

```
```
  var Bank = require('./bank/bank.js');
  var sampleAccounts = require('./sample.json')

  window.onload = function(){
    var bank = new Bank();
    for( accountData of sampleAccounts ){
      bank.addAccount( new Account(accountData) );
    }

    var totalDisplay = document.getElementById('total');
    totalDisplay.innerText = "Total: " + bank.totalCash();

    var accountList = document.getElementById('accounts');

    for(account of bank.accounts){
      var accountListItem = document.createElement('li');
      accountListItem.innerText = account.owner + ": £" + account.amount;
      accountList.appendChild(accountListItem);
    }
  };
```
- Show accounts by type.

```
<!DOCTYPE html>
<html>
  <head>
    <title>Startpoint</title>
    <link rel='stylesheet' type='text/css' href='main.css'>
    <script src='bundle.js'></script>
  </head>
  <body>
    <h1> CC Bank </h1>
    <h2 id="total"></h2>
    <h4 id="business-total"></h4>
      <ul id="business-accounts"></ul>
    <h4 id="personal-total"></h4>
      <ul id="personal-accounts"></ul>
  </body>
</html>
```
```
var Bank = require('./bank/bank.js');
var sampleAccounts = require('./sample.json')

window.onload = function(){
  var bank = new Bank();
  for(account of sampleAccounts){
    bank.addAccount(new Account(account));
  }

  var totalDisplay = document.getElementById('total');
  var businessTotalDisplay = document.getElementById('business-total');
  var personalTotalDisplay = document.getElementById('personal-total');

  totalDisplay.innerText = "Total: £" + bank.totalCash();
  businessTotalDisplay.innerText = "Total Business: £" + bank.totalCash('business');
  personalTotalDisplay.innerText = "Total Personal: £" + bank.totalCash('personal');

  var businessAccountList = document.getElementById('business-accounts');
  var personalAccountList = document.getElementById('personal-accounts');

  for(account of bank.filteredAccounts('business')){
    var accountListItem = document.createElement('li');
    accountListItem.innerText = account.owner + ": £" + account.amount;
    businessAccountList.appendChild(accountListItem);
  }

  for(account of bank.filteredAccounts('personal')){
    var accountListItem = document.createElement('li');
    accountListItem.innerText = account.owner + ": £" + account.amount;
    personalAccountList.appendChild(accountListItem);
  }
};
```

##Refactor


```
var Bank = require('./bank/bank.js');
var Account = require('./bank/account.js');
var sampleAccounts = require('./sample.json');

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

window.onload = function(){
  var bank = new Bank();
  for(account of sampleAccounts){
    bank.addAccount(new Account(account));
  }
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
};


```

##Adding functionality:  Only if time. Haven't done this yet.
- Doing an interest payment.
- Add test, add functionality, add UI.

#Logic
```
  //bank_spec.js
  it("should be able to do an interest payment", function(){
    var bank = new Bank();
    var account1 = new Account({owner:'Jay',amount:50, type:'business'});
    var account2 = new Account({owner:'Val',amount:150, type:'business'});
    var account3 = new Account({owner:'Kieth',amount:150, type:'personal'});
    bank.addAccount(account1);
    bank.addAccount(account2);
    bank.addAccount(account3);
    bank.payInterest(10);
    assert.equal( 385, bank.totalCash() );
  })
```
```
  //bank.js
  payInterest(percentage){
    var multiplier = 1 + (percentage/100)
    for(account of this.accounts){
      account.amount = account.amount * multiplier
    }
  }
```
#UI
```
  build/index.js
  <button id='interest-button'> Pay 10% Interest </button>
```

```
  app.js
  var interestButton = document.getElementById('interest-button');
  interestButton.onclick = function(){
    bank.payInterest(10);
    console.log('bank', bank)
  }
```

Now we can refactor the application so that it will update when interest button is
clicked.

```
var Bank = require('./bank/bank.js');
var sampleAccounts = require('./sample.json')

var bank = new Bank();
for(account of sampleAccounts){
  bank.addAccount(account);
}

var displayBank = function(){
  var totalDisplay = document.getElementById('total');
  var businessTotalDisplay = document.getElementById('business-total');
  var personalTotalDisplay = document.getElementById('personal-total');

  totalDisplay.innerText = "Total: £" + bank.totalCash();
  businessTotalDisplay.innerText = "Total Business: £" + bank.totalCash('business');
  personalTotalDisplay.innerText = "Total Personal: £" + bank.totalCash('personal');

  var businessAccountList = document.getElementById('business-accounts');
  var personalAccountList = document.getElementById('personal-accounts');

  businessAccountList.innerHTML = ""
  personalAccountList.innerHTML = ""

  for(account of bank.filteredAccounts('business')){
    var accountListItem = document.createElement('li');
    accountListItem.innerText = account.owner + ": £" + account.amount;
    businessAccountList.appendChild(accountListItem);
  }

  for(account of bank.filteredAccounts('personal')){
    var accountListItem = document.createElement('li');
    accountListItem.innerText = account.owner + ": £" + account.amount;
    personalAccountList.appendChild(accountListItem);
  }
}

window.onload = function(){
  displayBank();

  var interestButton = document.getElementById('interest-button');
  interestButton.onclick = function(){
    bank.payInterest(10);
    console.log('bank', bank);
    displayBank();
  }
};

```

Note that there is no persistance. What options do we have

##Persistance

Local Storage

```
var populateBank = function(bank){
  var savedAccountString = localStorage.getItem("sampleAccounts");
  if(savedAccountString){
    var savedAccounts =  JSON.parse(savedAccountString);
  }else {
    savedAccounts = sampleAccounts;
  }
  for(account of savedAccounts){
    bank.addAccount(account);
  }
}

var saveAccounts = function(bank){
  localStorage.setItem("sampleAccounts", JSON.stringify(bank.accounts));
}

window.onload = function(){
  var bank = new Bank();
  populateBank(bank);
  displayBank(bank);

  var interestButton = document.getElementById('interest-button');
  interestButton.onclick = function(){
    bank.payInterest(10);
    displayBank(bank);
    saveAccounts(bank);
  }
};
```
