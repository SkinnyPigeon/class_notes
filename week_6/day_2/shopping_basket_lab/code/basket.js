var basket = {
  items: [],
  hasCard: false,
  addItem: function(item){
    this.items.push(item);
  },
  totalPrice: function(itemDiscounter){
    var total = 0;

    this.items.forEach(function(item){
      total += item.price;
    });

    if(itemDiscounter){
      var savings = itemDiscounter.discount(this.items)
      total -= savings;
    }

    if(total > 20){
      total *= 0.9;
    }
    if(this.hasCard){
      total *= 0.95;
    }

    return total;
  },
  empty: function(){
    this.items = [];
  }
}

module.exports = basket
