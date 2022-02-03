var gClickLat=-1, gClickLon=-1;
var gInfoWindow=null;
var gHaDrawedMarkers={};

//main function
$(function(){

    //parse pointdata
    var haJsonPoints=$('.ha_json_points').val();
    var conf={
	points: JSON.parse(haJsonPoints)
    };
    
    //map initialize
    $.initMap($, conf);

    //do the marker selected on map when each site on table is selected
    $(".site_index_div_pointup").click(function(event){
	var _siteid = $(this).attr("siteid");
	var _obj_mk = gHaDrawedMarkers[_siteid];
	
	var _title = conf.points[_siteid][0];	
	var _show_link = conf.points[_siteid][5];
	var _edit_link = conf.points[_siteid][6];
	var _delete_link = conf.points[_siteid][7];
	var _id = conf.points[_siteid][8];	
	if (!gInfoWindow) {
	    gInfoWindow = new google.maps.InfoWindow();
	}
	gInfoWindow.setContent('<h3>' + _title + '</h3>'+_show_link + _edit_link + _delete_link);	
	gInfoWindow.open(_obj_mk.getMap(), _obj_mk);
    });
    
});

//draw map
jQuery.initMap = function($, conf) {
    console.log("INFO : initMap() start")
    console.log(Object.keys(conf.points));

    //initialize map controls
    var mapOptions = {
	    zoom:14,
	    mapTypeControl: false,
	    panControl: false,
	    streetViewControl: true,
	    zoomControl: true,
	    scaleControl: true,
	    overviewMapControl: true
	},
	map = new google.maps.Map($("#map_index")[0], mapOptions),
	bounds = new google.maps.LatLngBounds(),	
	//points = new google.maps.MVCArray(conf.points)//
	points = new google.maps.MVCArray();

    //convert point-data from Map to MVCArray
    ar_keys = Object.keys(conf.points);
    var i=0;
    ar_keys.forEach(function (id){
	points.push(conf.points[id]); i++;
    });
    
    //draw points 
    if(points.length > 0){
	var center1=0, center2=0, coord_count=0;
	points.forEach(function (point, index) {
	    var _title = point[0];
	    var _x =  point[1];
	    var _y =  point[2]
	    var _address =  point[3];
	    var _description =  point[4];
	    var _show_link =  point[5];
	    var _edit_link =  point[6];
	    var _delete_link =  point[7];
	    var _id = point[8];	    
	    
	    center1 += _x;
	    center2 += _y;
	    coord_count++;
	    
	    var myLatlng;
	    var obj_marker;
	    myLatlng = new google.maps.LatLng(_y, _x),
	    obj_marker=new google.maps.Marker({
		position: myLatlng,
		title: String(_id),
		animation: google.maps.Animation.DROP,
		//icon: `map_icons/number_${index+1}.png`,
		map: map
	    });
	    gHaDrawedMarkers[_id] = obj_marker;
	    bounds.extend(myLatlng);

	    google.maps.event.addListener(obj_marker, 'click', function() {
		if (!gInfoWindow) {
		    gInfoWindow = new google.maps.InfoWindow();
		}
		gInfoWindow.setContent('<h3>' + _title + '</h3>'+_show_link + _edit_link + _delete_link);			
		gInfoWindow.open(map, obj_marker);
	    });

	});
	center1 /= coord_count;
	center2 /= coord_count;
	map.setCenter(new google.maps.LatLng(center2, center1));
	map.fitBounds(bounds);
    }

    //map leftclick-events
    google.maps.event.addListener(map, 'click', function(event){
	gClickLat = event.latLng.lat();
	gClickLon = event.latLng.lng();
	console.log("lat: "+String(gClickLat))
	console.log("lon: "+String(gClickLon))

        $('#site_index_clickmenu')
	    .css('top', event.pixel.y+50)
	    .css('left', event.pixel.x)  	
            .css('visibility', 'visible');
        return false;
	
    });

    //map rightclick-events
    google.maps.event.addListener(map, 'rightclick', function(event){
	gClickLat = event.latLng.lat();
	gClickLon = event.latLng.lng();
	console.log("lat: "+String(gClickLat))
	console.log("lon: "+String(gClickLon))

        $('#site_index_clickmenu').css('visibility', 'hidden');	
    });


    //click-menu(1) events
    $("#li_new-site_here").click(function(event){
	console.log("lat: "+String(gClickLat))
	console.log("lon: "+String(gClickLon))
	window.location.href = 'sites/new?geom=POINT('+String(gClickLon)+' '+String(gClickLat)+')';
/*	
	$.ajax({
	    type: 'GET',	    
	    url: 'sites/new',
	    data: {geom: "POINT(#{gClickLon} #{gClickLat})"
	    dataType: 'json',
	    success: function(){
		window.location.href = 'sites/new';
	    },
	    error: function(){
		alert("通信エラー発生");
	    }
	});
*/

    });
    
}

