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
}

$(document).ready(function () {
  var fieldMap = new FieldMap();
  fieldMap.initialize();
});



// jQuery(function($) {
//     // Asynchronously Load the map API 
//     var script = document.createElement('script');
//     script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
//     document.body.appendChild(script);
// });

// function initialize() {
//     var map;
//     var bounds = new google.maps.LatLngBounds();
//     var mapOptions = {
//         mapTypeId: 'roadmap'
//     };
//     // Multiple Markers
//     var markers = [];
    

//     //Map Markers
//     $(document).ready(function() {
//       $.get('/api/v1/fields.json', function(data) {
//         fields = data.fields;
//         markerInfo = [];
//     }).then(function(fields, markerInfo) {
//       // console.log(fields);
//     for( var i = 0; i < fields.length; i++) {
//       markerInfo.push(fields[i].name);
//       markerInfo.push(fields[i].lat);
//       markerInfo.push(fields[i].lng);
//       console.log(markerInfo);
//       markers.push(markerInfo);
//     };
//     // Display a map on the page
//     map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
//     map.setTilt(45); 


//     console.log(markers);
                        
//     // Info Window Content
//     var infoWindowContent = [
//         ['<div class="info_content">' +
//         '<h3>London Eye</h3>' +
//         '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' +        '</div>'],
//         ['<div class="info_content">' +
//         '<h3>Palace of Westminster</h3>' +
//         '<p>The Palace of Westminster is the meeting place of the House of Commons and the House of Lords, the two houses of the Parliament of the United Kingdom. Commonly known as the Houses of Parliament after its tenants.</p>' +
//         '</div>']
//     ];
        
//     // Display multiple markers on a map
//     var infoWindow = new google.maps.InfoWindow(), marker, i;
    
//     // Loop through our array of markers & place each one on the map  
//     for( i = 0; i < markers.length; i++ ) {
//         var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
//         bounds.extend(position);
//         marker = new google.maps.Marker({
//             position: position,
//             map: map,
//             title: markers[i][0]
//         });
        
//         // Allow each marker to have an info window    
//         google.maps.event.addListener(marker, 'click', (function(marker, i) {
//             return function() {
//                 infoWindow.setContent(infoWindowContent[i][0]);
//                 infoWindow.open(map, marker);
//             }
//         })(marker, i));

//         // Automatically center the map fitting all markers on the screen
//         map.fitBounds(bounds);
//     }

//     // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
//     var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
//         this.setZoom(14);
//         google.maps.event.removeListener(boundsListener);
//     });
//   })
//   });
// };