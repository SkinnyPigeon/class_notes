var Bear = function(age, type, weight){
  this.age = age;
  this.type = type;
  this.weight = weight;
};

Bear.prototype = {
  eat: function(){
    this.weight = this.weight + 10;
  },
  roar: function(){
    console.log('Roar');
  }
}

module.exports = Bear;
