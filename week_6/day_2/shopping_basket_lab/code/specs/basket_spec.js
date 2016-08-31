var assert = require('chai').assert;
var basket = require('../basket')
var bogof = require('../bogof')

 describe('basket',function(){
   it('should start with a total of 0', function(){
     assert.equal(0,basket.totalPrice(bogof));
   });
  it('should start with no items', function(){
    assert.equal(0,basket.items.length);
  });
  it('should be able to add an item', function(){
    var item = {
      name: "tomato soup",
      price: 1.00
    }
    basket.addItem(item);
    assert.equal(1,basket.items.length);
  });
  it('should give the total price of basket', function(){
    assert.equal(1.00, basket.totalPrice(bogof))
  });
  it('should be able to empty basket', function(){
    basket.empty();
    assert.equal(0,basket.items.length);
  });
  it('should give a 10% discount to baskets over £20 ', function(){
    basket.empty();
    var item = {
      name: "tv",
      price: 100.00
    }
    basket.addItem(item);
    assert.equal(90, basket.totalPrice(bogof));

  });


  it('should give a 5% discount if has loyalty card ', function(){
    basket.empty();
    basket.hasCard = true;
    var item = {
      name: "steak",
      price: 10.00
    }
    basket.addItem(item);
    assert.equal(9.5, basket.totalPrice(bogof));
    basket.hasCard = false;
  });


  it('should successfully bogof 1 pair of valid items', function(){
    basket.empty();
    var item1 = {
      name: "water bottle",
      price: 5.00,
      bogof: true
    }
    var item2 = {
      name: "water bottle",
      price: 5.00,
      bogof: true
    }
    var item3 = {
      name: "beans",
      price: 1.00,
      bogof: false
    }
    basket.addItem(item1);
    basket.addItem(item2);
    basket.addItem(item3);
    assert.equal(6, basket.totalPrice(bogof));

  });

  it('should successfully bogof 2 pairs of valid items', function(){
    basket.empty();
    var item1 = {
      name: "water bottle",
      price: 5.00,
      bogof: true
    }
    var item2 = {
      name: "water bottle",
      price: 5.00,
      bogof: true
    }
    var item3 = {
      name: "beans",
      price: 1.00,
      bogof: false
    }
    var item4 = {
      name: "beans",
      price: 1.00,
      bogof: false
    }
    var item5 = {
      name: "bread",
      price: 2,
      bogof: true
    }
    var item6 = {
      name: "bread",
      price: 2,
      bogof: true
    }
    basket.addItem(item1);
    basket.addItem(item2);
    basket.addItem(item3);
    basket.addItem(item4);
    basket.addItem(item5);
    basket.addItem(item6);
    assert.equal(9, basket.totalPrice(bogof));

  });
  it('should successfully bogof and discount total for 1 pair of valid items', function(){
    basket.empty();
    var item1 = {
      name: "tv",
      price: 100.00,
      bogof: true
    }
    var item2 = {
      name: "tv",
      price: 100.00,
      bogof: true
    }
    basket.addItem(item1);
    basket.addItem(item2);
    assert.equal(90, basket.totalPrice(bogof));

  });
 })
