/**
 *
 * @author amila
 */


function checkEmail() {
    var email = document.getElementById("cr_usr_email").value;
    alert(email);


    $.ajax({
        url: 'https://Hp-Pavilion:8243/services/Weather?lat=' + lat + '&lon=' + lon,
        dataType: 'json',
        success: function (data) {
            document.getElementById('city').innerHTML = data['city'];


            //alert(data['name']);
        },
        error: function () {
            $("#results").append("error");
            alert('error');
        }
    });




}
////////////////////////////////////////////////////////////////////////////////////////////////////
function viewUserDetails(userID) {

    alert(userID);
    var httpxml;
    httpxml = new XMLHttpRequest();
    function stateChanged() {
        if (httpxml.readyState == 4) {
            document.getElementById("updateUserDetails").innerHTML = httpxml.responseText;
        }
    }
    var url = "../../ViewUserDetails";
    url = url + "?userID=" + userID;
    //url=url+"&sid="+Math.random();
    httpxml.onreadystatechange = stateChanged;
    httpxml.open("POST", url, true);
    httpxml.send(null);
}


function resetPassword(uid) {
    alert("reset password ->" + uid);
    alert(uid);
    var httpxml1;
    httpxml1 = new XMLHttpRequest();
    function stateChanged() {
        if (httpxml1.readyState == 4) {
            alert(httpxml1.responseText);
            //document.getElementById("updateUserDetails").innerHTML = httpxml.responseText;
        }
    }
    var url = "../../PasswordReset";
    url = url + "?userID=" + uid;
    //url=url+"&sid="+Math.random();
    httpxml1.onreadystatechange = stateChanged;
    httpxml1.open("POST", url, true);
    httpxml1.send(null);

}

function suspendUser(uid) {
    alert("Suspend User ->" + uid);
    var httpxml;
    httpxml = new XMLHttpRequest();
    function stateChanged() {
        if (httpxml.readyState == 4) {
            var r = httpxml.responseText;
            alert(r);
        }
    }
    var url = "../../SuspendUser";
    url = url + "?userID=" + uid;
    httpxml.onreadystatechange = stateChanged;
    httpxml.open("POST", url, true);
    httpxml.send(null);

}
