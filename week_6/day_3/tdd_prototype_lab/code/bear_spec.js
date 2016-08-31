Bear = require('./bear');
var assert = require('chai').assert;

describe('Bear', function(){

  it('should have an age', function(){
    var myBear = new Bear(22, 'Grizzly', 88)
    assert.equal(22, myBear.age);
  });
  it('should have a type', function(){
    var myBear = new Bear(22, 'Grizzly', 88)
    assert.equal('Grizzly', myBear.type)
  });
  it('should have a weight', function(){
    var myBear = new Bear(22, 'Grizzly', 88)
    assert.equal(88, myBear.weight)
  });
  it('should eat and increase weight', function(){
    var myBear = new Bear(22, 'Grizzly', 88)
    myBear.eat();
    assert.equal(98, myBear.weight)
  });
})
