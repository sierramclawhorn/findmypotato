var marker;
var map;
var createdMarkers = [];

function initMap() {
  // make myLatLng coordinates of last placed marker
  // when marker is hovered, show user_id info
  // add limit to markers per user in time limit 
  var myLatLng = {lat: 37.7949, lng: -122.3700};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: myLatLng
  });

  $.ajax ( {
      method: 'GET',
      url: "/spotted"
    } ).done(function(response) {
      var pins = JSON.parse(response)
      pins.forEach(function(pin) {
        var lat = pin.lat; 
        var lng = pin.lng;
        var latLng = {lat: lat, lng: lng};
        placeMarker(latLng);
        marker.addListener('click', toggleBounce);
      } )
    } );


  google.maps.event.addListener(map, 'click', function(event) {
    createMarker(event.latLng);
  });
}

function placeMarker(location) {
  var image = '/images/marker.png';
  marker = new google.maps.Marker({
    map: map,
    icon: image,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: location
  });
  createdMarkers.push(marker);
  var lat = marker.position.lat();
  var lng = marker.position.lng();
};


function createMarker(location) {
  var image = '/images/marker.png';
  marker = new google.maps.Marker({
    map: map,
    icon: image,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: location
  });
  createdMarkers.push(marker);
  var lat = marker.position.lat();
  var lng = marker.position.lng();
  $.ajax ( {
      method: 'GET',
      url: "/spotted/search?lat=" + lat + "&lng=" + lng + "",
    } ).done(function(response) {
      marker.addListener('click', toggleBounce);
    } );
};

function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
};