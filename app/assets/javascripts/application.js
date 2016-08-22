// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

var map;
var infowindow;
var request;
var service;
var markers = [];

// google doesn't seem to be defined here. What were your plans for google maps?
function initialize() {
  var center = new google.maps.LatLng(38.9048728,-77.0340283);
  map = new google.maps.Map(document.getElementById('map'),{
    center: center,
    zoom: 13
  });

  request = {
      location: center,
      radius: 30047,
      types: ['restaurant']
  };
  infowindow = new google.maps.InfoWindow();

  var service = new google.maps.places.PlacesService(map);

  service.nearbySearch(request, callback);

  google.maps.event.addListener(map, 'rightclick', function(event){
    map.setCenter(event.latLng)
    clearResults(markers)

    var request = {
      location: event.latLng,
      radius: 30047,
      types: ['restaurant']
    };
    service.nearbySearch(request, callback);
  })
}

function callback(results, status) {
  if(status == google.maps.places.PlacesServiceStatus.OK){
    for(var i=0; i<results.length; i++){
      markers.push(createMarker(results[i]));
    }
  }
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location
  });

  google.maps.event.addListener(marker, 'click', function(){
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
  return marker;
}

function clearResults(markers) {
  for (var m in markers) {
    markers[m].setMap(null)
  }
  markers = []
}

google.maps.event.addDomListener(window, 'load', initialize);
