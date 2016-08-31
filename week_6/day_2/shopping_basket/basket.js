var basket = {

  items: [],

  card: false,

  empty: function() {
    this.items = [];
  },

  switchCard: function() {
    if ( this.card ) {
      this.card = false;
      return;
    }
    this.card = true;
  },

  addItem: function( item ) {
    this.items.push( item );
  },

  removeItem: function( name ) {
    var items = this.items;

    for ( item of items ) {

      if ( item.name === name ) {
        var index = items.indexOf( item );
        items.splice( index, 1 );
      }

    }
  },

  applyDiscount: function( spentOver, discountPercentage ) {
    var total = this.total();

    if ( total > spentOver ) {
      var extraDiscount = this.card ? 5 : 0;
      var totalDiscount = discountPercentage + extraDiscount;

      var discount = 1 - ( totalDiscount / 100 );
      return( total * discount );
    }

    return total;
  },

  calcItem: function( item ) {
    var qty = item.quantity;

    if ( qty > 1 && item.bogof ) {
      var qty = Math.ceil( qty / 2 );
    };

    return qty * item.cost;
  },

  total: function() {
    var items = this.items;
    var total = 0;

    for ( item of items ) {
      var subTotal = this.calcItem( item )
      total += subTotal;
    }

    return total;
  }

}

module.exports = basket;