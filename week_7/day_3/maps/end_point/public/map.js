var Map = function(latLng){
  this.map = new google.maps.Map(document.getElementById('map'), {
    center: latLng,
    zoom: 18
  }),
  this.addMarker = function(latLng, title, icon){
    var marker = new google.maps.Marker({
      position: latLng,
      map: this.map,
      title: title,
      icon: icon
    });
    return marker
  },
  this.bindClick = function(){
    google.maps.event.addListener(this.map, 'click', function(event){
      this.addInfoWindow({lat: event.latLng.lat(), lng: event.latLng.lng()}, "meow!", "https://33.media.tumblr.com/avatar_e2fbfbcbb52d_128.png");
    }.bind(this));
  },
  this.addInfoWindow = function(latLng, title, icon){
    var marker = this.addMarker(latLng, title, icon);
    marker.addListener('click', function() {
      var infowindow = new google.maps.InfoWindow({
          content: this.title
        });
      infowindow.open(this.map, marker);
    });
  }
}
