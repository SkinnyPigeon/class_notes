##Enumeration

##Intro


##Enumeration
We have seen using 'each' and 'map' as a way of looping over arrays. Using this technique we describe what we want to do to each element of an array.  The array will then itself do the looping.  So how we do we tell the array what to do to each element.

[i]: In Ruby this is done using blocks.

In Javascript we do this by passing in a function.  Let's see an example

```
  var testArray = [1,2,3,4]

  testArray.forEach(function(number){
    console.log('the number is', number);
  })
```

forEach is a method on our array.  We have passed in another function to tell it what to do to each element in the array.  We have passed a function into a function.  forEach is a 'higher order function'.


We can pull out the function to a variable

```
  var testArray = [1,2,3,4]

  var printNumber = function(number){
    console.log('the number is', number);
  }

  testArray.forEach(printNumber);
```

##Writing our own forEach
[i]: Let class do as exercise if going well.

To really understand what a forEach is doing, we can write our own.

```
  var ourForEach = function(array, callOnItem){
    for( item of array ){
      callOnItem(item);
    }
  };

  testArray = [1,2,3,4];

  ourForEach(testArray, function(item){
    console.log('the item', item)
  })
```

##this in functions being called back.
Let's write a function to try and sum up the values and store it to an instance variable.

```
  var Bank = function(){
    this.accounts = [100,200,300,400];
    this.total = 0
  }

  Bank.prototype = {
    setTotal: function(){
      this.total = 0;
      this.accounts.forEach(function(account){
        this.total += account;
      });
    }
  }

  var b = new Bank();
  console.log('b total', b.total)

  b.setTotal();

  console.log('total after', b.total)

```

What happened here?  Inside the iterator function.  We are trying to add to the total of the bank, using this.total += account.

This looks alright.  However,  inside this iterator function,  *this* is no longer the bank, it is the global object.  Inside of callback to sure of what *this* is we need to use some tricks.

How can we solve this?

##bind
[i:] Hard topic, put importance on applying

Javascript gives us a way to duplicate a function and set inside the new function what this is.  Using a bind function.

```
Bank.prototype = {
  setTotal: function(){
    this.total = 0;
    this.accounts.forEach(function(account){
      this.total += account
    }.bind(this));
  }
}
```

Now inside our iterator this is what we want it to be.  Whenever using an iterator function in an object method and wanting to use this we should bind it, to ensure we get it out.

##Using enumerable methods

Enumerations are fairly new to the Javascript.  forEach map and filter have found their way into the current version ES5.

Javascript is very much a community led language and when people want something they make it. Learning from languages like Ruby enumeration is becoming more popular and can help in producing readable programs.

##Lodash
Lodash is a library that gives us lots of enumerable functionality among other things.

```
  mkdir lodash_play
  cd lodash_play
  npm init
  npm install --save lodash
```

```
  var _ = require('lodash')

  var myArray = [2,2,4,4,5];

  _.forEach(myArray, function(item){
    console.log('item', item);
  });

  var doubledArray = _.map(myArray, function(item){
      return item * 2;
  });

  console.log('doubledArray', doubledArray);

```


##Enumerable Lab

Create Bank using enumerable lodash methods.

Bank should be able to:
  Add an account
  Find account by name owner name.
  Find the largest account.
  Find the total account value.
  Find the average value.
  Find the total value for an account type.

Further:  Write our own map, using forEach

Each is the cornerstone of the enumerable methods. Others can be written from it.

```
var ourMap = function(testArray, transformItem){
  var mappedArray = [];
  _.forEach(testArray, function(item){
    mappedArray.push( transformItem(item) )
  })
  return mappedArray;
}

var t = ourMap(myArray, function(item){
  return item * 2;
})

console.log(t);
```

Further: Do cards lab.
