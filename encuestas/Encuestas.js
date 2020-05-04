

$(function(){
    function geo_success(position) {
    var lat = position.coords.latitude;    
    var long = position.coords.longitude;
    var geo = lat+","+long;
    $("#geo").val(geo);
    console.log(lat, long);
}

function geo_error() {
  alert("Disculpe no es posible acceder a su ubicacion");
  $("#geo").val("0,0");
}

var geo_options = {
  enableHighAccuracy: true, 
  maximumAge        : 30000, 
  timeout           : 27000
};

var wpid = navigator.geolocation.watchPosition(geo_success, geo_error, geo_options);
});