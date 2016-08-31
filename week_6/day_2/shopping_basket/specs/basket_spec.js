var basket = require( '../basket' );
var assert = require( 'chai' ).assert;

describe( 'A Basket', function() {

  it( 'should have no items to begin with', function() {
    assert.equal( 0, basket.items.length );
  });

  it( 'should be able to add an item', function() {
    basket.addItem( { name: 'carrot', quantity: 1, bogof: false } );
    assert.equal( 1, basket.items.length );
  });

  it( 'should be able to remove an item', function() {
    basket.removeItem( 'carrot' );
    assert.equal( 0, basket.items.length );
  });

  it( 'should calculate cost of a single item', function() {
    var item = { name: 'carrot', quantity: 80, bogof: false, cost: 0.5 };
    assert.equal( 40, basket.calcItem( item ) )
  });

  it( 'should not apply 10% discount of less than 20 quid', function() {
    basket.addItem( { name: 'brocolli', quantity: 3, bogof: false, cost: 1 } )
    var total = basket.applyDiscount( 20, 10 );
    assert.equal( 3, total );
  });

  describe( 'when our basket is populated with items', function() {

    beforeEach( function() {
      basket.empty();
      basket.addItem( { name: 'carrot', quantity: 80, bogof: false, cost: 0.5 } )
      basket.addItem( { name: 'brocolli', quantity: 3, bogof: false, cost: 1 } )
    });

    it( 'should calculate basket total', function() {
      assert.equal( 43, basket.total() );
    });

    it( 'should apply 10% discount of over 20 quid', function() {
      var total = basket.applyDiscount( 20, 10 );
      assert.equal( 38.70, total );
    });

    it( 'should get an extra 5% discount if card', function() {
      basket.switchCard();
      var total = basket.applyDiscount( 20, 10 );
      assert.equal( 36.55, total );
    });

  });

  describe( 'when we have basket with bogofs', function() {

    beforeEach(function() {
      basket.empty();
      basket.addItem( { name: 'carrot', quantity: 83, bogof: true, cost: 0.5 } )
      basket.addItem( { name: 'brocolli', quantity: 3, bogof: false, cost: 1 } )
    })

    it( 'should calculate cost of a single item with a bogof', function() {
      assert.equal( 21, basket.calcItem( basket.items[0] ) )
    });

    it( 'should allow bogof offers and reduce total', function() {
      var total = basket.total();
      assert.equal( 24, total );
    });

  });



});  