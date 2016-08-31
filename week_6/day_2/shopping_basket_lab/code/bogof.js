var bogof = {
  discount: function(items){
    var bogofItems = [];
    items.forEach(function(item){
      if (item.bogof) bogofItems.push(item);
    });

    var lookup = this.createLookup(bogofItems);
    return this.bogofSaving(lookup);
  },
  bogofSaving:function(lookup){
    var discount = 0;
    for(key in lookup){
      var numberOfBogof = Math.floor( lookup[key].count/2 );
      discount += numberOfBogof * lookup[ key ].price;
    }
    return discount;
  },
  createLookup: function(items){
    var lookup = {};
    items.forEach(function(item){
      var itemLookup = lookup[item.name];
      if(itemLookup){
        itemLookup.count++
      }else{
        lookup[item.name] = {price: item.price, count: 1}
      }
    })

    return lookup;
  },
}

module.exports = bogof
