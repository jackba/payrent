
var handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'brookviewmap'}}, function(){
  var markers = handler.addMarkers([
    { lat:42.700844, lng: -73.656826}
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
  handler.getMap().setZoom(16);
});
