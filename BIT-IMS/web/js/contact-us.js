/*Google Map Functions*/
function initializeBitHome() {
        var location = new google.maps.LatLng(6.883209, 79.869199); 
         
        var mapOptions = {
            zoom: 14,
            center: location
        }
     
        var map = new google.maps.Map(document.getElementById('map-canvas-BIT'), mapOptions); 

        mapMaker(location,map);
}

function initializeUcscHome() {
        var location = new google.maps.LatLng(6.902243, 79.861302); 
         
        var mapOptions = {
            zoom: 14,
            center: location
        }
     
        var map = new google.maps.Map(document.getElementById('map-canvas-UCSC'), mapOptions); 

        mapMaker(location,map);
}
    
function mapMaker(location,map){
    var icon = '../images/map-marker.png';
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        icon: icon,
        title: 'BIT Contact Locations'
    });    
}
 
google.maps.event.addDomListener(window, 'load', initializeBitHome);
google.maps.event.addDomListener(window, 'load', initializeUcscHome);