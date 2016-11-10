var marker;
var map;
var createdMarkers = [];

function initMap() {
  var myLatLng = {lat: 37.7949, lng: -122.3700};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: myLatLng
  });

  google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
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
  var lat = marker.position.lat()
  var lng = marker.position.lng()
  $.ajax ( {
      method: 'GET',
      url: "/spotted/search?lat=" + lat + "&lng=" + lng + "",
    } ).done(function(response) {
      console.log(response)
      createdMarkers.push(marker);
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