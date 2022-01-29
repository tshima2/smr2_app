
//main function
$(function(){
  var arrJsonPoints=$('.arr_json_points').val();
  var conf={
    points: JSON.parse(arrJsonPoints)
  };
  $.initMap($, conf);
});

//draw map
jQuery.initMap = function($, conf) {
  //initialize map controls
  var infoWindow,
  mapOptions = {
    zoom:14,
    mapTypeControl: false,
    panControl: false,
    streetViewControl: true,
    zoomControl: true,
    scaleControl: true,
    overviewMapControl: true
  },
  map = new google.maps.Map($("#map_index")[0], mapOptions),
  points = new google.maps.MVCArray(conf.points),
  bounds = new google.maps.LatLngBounds();
  
  //draw points 
  if(points.length > 0){
    var center1=0, center2=0, coord_count=0;
    points.forEach(function (point, index) {
      center1 += point[1];
      center2 += point[2];
      coord_count++;
      
      var myLatlng;
      var obj_marker;
      myLatlng = new google.maps.LatLng(point[2], point[1]),
      obj_marker=new google.maps.Marker({
        position: myLatlng,
        title: String[point[0]],
        animation: google.maps.Animation.DROP,
        //icon: `map_icons/number_${index+1}.png`,
        map: map
      });
      bounds.extend(myLatlng);
      
      google.maps.event.addListener(obj_marker, 'click', function() {
        if(! infoWindow) {
          infoWindow = new google.maps.InfoWindow();
        }
        infoWindow.setContent(point[5]);
        infoWindow.open(map, obj_marker);
      });
    });
    center1 /= coord_count;
    center2 /= coord_count;
    map.setCenter(new google.maps.LatLng(center2, center1));
    map.fitBounds(bounds);
  }
}
    
