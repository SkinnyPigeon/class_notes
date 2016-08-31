window.onload = function () {
    //setup views
    var countrySelectView = new CountrySelectView(document.querySelector('#countries'));
    var countryDetailView = new CountryDetailView(document.querySelector('#info'));

    //link change on select to update detail view and persist last country
    countrySelectView.onChange = function(country){
      countryDetailView.display(country);
      lastCountry.save(country);
    }

    //setup country list model
    var world = new CountryList();

    //update views on data update
    world.onUpdate = function(countries){
      countrySelectView.populate(countries);
      var savedCountry = lastCountry.get();
      console.log('saved Country', savedCountry);
      if(savedCountry){
        countrySelectView.setSelectedIndex(savedCountry.index);
        countryDetailView.display(savedCountry);
      }
    };

    //get data from server
    world.populate();


};
