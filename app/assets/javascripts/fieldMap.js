var FieldMap = function () {
  var fields;
  var markerInfo;
  var map;
  var mapPromise = $.Deferred();
  // var mapOptions = {
  //   mapTypeId: 'roadmap',
  //   center: {lat: -34.397, lng: 150.644},
  // };

  function initializeMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: -34.397, lng: 150.644},
      zoom: 8
    });

    mapPromise.resolve();
  }

  function placeMarkers() {
    var bounds = new google.maps.LatLngBounds();

    for ( var i = 0; i < fields.length; i++) {
      var field = fields[i];
      var position = new google.maps.LatLng(field.lat,field.lng);
      var marker = new google.maps.Marker({
        position: position,
        map: map,
        title: field.name
      });
      bounds.extend(marker.getPosition());
      marker.setMap(map);
    }

    map.fitBounds(bounds);
  }

  this.initialize = function() {

    $.get('/api/v1/fields.json', function(data) {
        fields = data.fields;
        markerInfo = [];
        initializeMap();
        
        mapPromise.then(function () {
          placeMarkers();
        });
    });
  };
};