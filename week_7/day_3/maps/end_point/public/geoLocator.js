var GeoLocator = function(map){
  this.map = map,
  this.infoElement = document.querySelector("#info"),
  this.setMapCenter = function(){
    this.setInfoDisplay("block");
    navigator.geolocation.getCurrentPosition(function(position) {
      var center = {lat: position.coords.latitude, lng: position.coords.longitude};
      this.map.map.setCenter(center);
      this.setInfoDisplay("none");
    }.bind(this));
  },
  this.setInfoDisplay = function(displayValue){
    this.infoElement.style.display = displayValue
  }
}