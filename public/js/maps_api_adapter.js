var marker;
var map;

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
  marker.addListener('click', toggleBounce);
  };

function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}

// space markers' animations using a pattern
function drop() {
  for (var i =0; i < markerArray.length; i++) {
    setTimeout(function() {
      addMarkerMethod();
    }, i * 200);
  }
}