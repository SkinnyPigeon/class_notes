function initialize(){
  var center = {lat: 51.507351, lng: -0.127758};
  map = new Map(center);
  map.bindClick();
}

// google.maps.event.addDomListener(window, 'load', initialize);
window.onload = initialize
