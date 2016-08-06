/* 
 * auther Amila Sankha
 */
function checkApplicantInDB(value){
    
    value = value.trim();

    if (value=="") {
        document.getElementById("addStudentApplicationNum").value="";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {//
                if(httpxml.responseText =="Ok"){
                    document.getElementById("addStudentApplicationNunErr").innerHTML = "";
                }else{
                    document.getElementById("addStudentApplicationNunErr").innerHTML = httpxml.responseText;
                    document.getElementById("addStudentApplicationNum").value="";
                }
                
            }
        }
        var url = "../../CheckInDB";
        url = url + "?table=ApplicantIsRegistered&value=" + value;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}

/*
 * search student details using registration number
 */
function searchByRegistrationNum(){
    
    var registrationNum = document.getElementById("searchRegistrationNum").value;
    registrationNum = registrationNum.trim();

    if (registrationNum == "") {
        document.getElementById("searchRegistrationNumErr").innerHTML = "Empty";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchRegistrationNumOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchStudent";
        url = url + "?method=byregistrationNum&input=" + registrationNum;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }
}

/*
 * search student details according to current year
 */
function searchByCurrentYear(){
    
    var year = document.getElementById("searchCurrentYear").value;
    year = year.trim();

    if (year == "") {
        document.getElementById("searchYearErr").innerHTML = "Empty";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchCurrentYearOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchStudent";
        url = url + "?method=byYear&input=" + year;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }
}


