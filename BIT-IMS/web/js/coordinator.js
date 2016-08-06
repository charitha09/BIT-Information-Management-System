/* 
 * auther Amila Sankha
 */


/*
 * changing the password
 */
function changePassword() {
    var currrentPassword = document.getElementById("currentPassword").value;
    currrentPassword = currrentPassword.trim();
    
    var newPassword = document.getElementById("newPassword").value;
    newPassword = newPassword.trim();
    
    var confirmNewPassword = document.getElementById("confirmNewPassword").value;
    confirmNewPassword = confirmNewPassword.trim();


    if (currrentPassword == "") {

        document.getElementById("currentPasswordErr").innerHTML = "Can\'t empty";
    } else if (newPassword == "") {
        document.getElementById("newPasswordErr").innerHTML = "Can\'t empty";

    } else if (newPassword.length < 8) {
        document.getElementById("newPasswordErr").innerHTML = "Password Too Short";
    }

    else if (confirmNewPassword == "") {
        document.getElementById("confirmNewPasswordErr").innerHTML = "Can\'t empty";

    } else if (newPassword != confirmNewPassword) {
        document.getElementById("confirmNewPasswordErr").innerHTML = "Mismatch new password and confirm Password";
    }

    else {
        
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {//
               if(httpxml.responseText == "ok"){
                   document.getElementById("outputErr").innerHTML = "";
                   window.location = "settings.jsp";
                   
               }else{
                    document.getElementById("outputErr").innerHTML = httpxml.responseText;
               }
                   
                
                
            }
        }
        var url = "../../ChangePassword";
        url = url + "?userType=user&currentPassword=" +currrentPassword +"&newPassword="+newPassword;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
        
        
        
        
    }

}


function isEmptyPassword() {

    var currrentPassword = document.getElementById("currentPassword").value;
    currrentPassword = currrentPassword.trim();

    if (currrentPassword == "") {

        document.getElementById("currentPasswordErr").innerHTML = "Can\'t empty";
    } else {
        document.getElementById("currentPasswordErr").innerHTML = "";
    }
}

function checkNewPassword() {

    var newPassword = document.getElementById("newPassword").value;
    newPassword = newPassword.trim();

    if (newPassword == "") {
        document.getElementById("newPasswordErr").innerHTML = "Can\'t empty";

    } else if (newPassword.length < 8) {
        document.getElementById("newPasswordErr").innerHTML = "Password Too Short";
    }

    else {
        document.getElementById("newPasswordErr").innerHTML = "";
    }
}


function checkConfirmNewPassword() {

    var newPassword = document.getElementById("newPassword").value;
    var confirmNewPassword = document.getElementById("confirmNewPassword").value;
    confirmNewPassword = confirmNewPassword.trim();

    if (confirmNewPassword == "") {
        document.getElementById("confirmNewPasswordErr").innerHTML = "Can\'t empty";

    } else if (newPassword != confirmNewPassword) {
        document.getElementById("confirmNewPasswordErr").innerHTML = "Mismatch new password and confirm Password";
    }

    else {
        document.getElementById("confirmNewPasswordErr").innerHTML = "";
    }
}