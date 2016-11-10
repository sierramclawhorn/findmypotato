var marker;

function initMap() {
  var myLatLng = {lat: 37.7949, lng: -122.3700};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: myLatLng
  });

  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: {lat: 37.7840, lng: -122.4330}
  });
  marker.addListener('click', toggleBounce);
}

function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}