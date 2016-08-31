assert = require('chai').assert;
bogof = require('../bogof');

describe('bogof', function(){
  it('should be able to create item lookup', function(){
    items = [];
    var item1 = {
      name: "bottle",
      price: 5.00,
      bogof: true
    }
    var item2 = {
      name: "bottle",
      price: 5.00,
      bogof: true
    }
    items = [item1,item2];
    var lookup = bogof.createLookup(items);
    assert.deepEqual({bottle: {price:5.00, count:2}}, lookup);
  })

  it('should be able to calc bogof saving', function(){
    var lookup = {
      shoes: {
        count: 2,
        price: 1000.00
      }
    }
    var saving = bogof.bogofSaving(lookup);
    assert.equal(1000, saving);
  })
})
