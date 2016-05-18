$(document).ready(function () {
    function loadDBconfig() {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                getxmldata(xmlhttp);
            }
        };
        xmlhttp.open("GET", "dbconfig.xml", true);
        xmlhttp.send();
    } 
    function getxmldata(xml) {        
        var xmlDoc = xml.responseXML;
        var SV_NAME = xmlDoc.getElementsByTagName("SV_NAME")[0].childNodes[0].nodeValue;
        var US_NAME = xmlDoc.getElementsByTagName("US_NAME")[0].childNodes[0].nodeValue;
        var PW_NAME = xmlDoc.getElementsByTagName("PW_NAME")[0].childNodes[0].nodeValue;
        var DB_NAME = xmlDoc.getElementsByTagName("DB_NAME")[0].childNodes[0].nodeValue;
        alert(US_NAME);        
    }
    loadDBconfig();
});