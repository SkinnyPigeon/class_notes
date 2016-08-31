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
