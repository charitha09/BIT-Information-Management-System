/* 
 * author Amila Sankha
 */

function updateInterviewDetails(interviewID) {
    alert(interviewID);
    document.getElementById("interviewID").value = interviewID;
    document.getElementById("viewInterviewID").innerHTML = interviewID;
}

function viewAllUnallocatedApplicant() {
     var httpxml;
    httpxml = new XMLHttpRequest();
    function stateChanged() {
        if (httpxml.readyState == 4) {
            document.getElementById("unallocatedApplicantTableBody").innerHTML = httpxml.responseText;
        }
    }
    var url = "../../ViewInterviewUnallocatedApplicant";
    httpxml.onreadystatechange = stateChanged;
    httpxml.open("POST", url, true);
    httpxml.send(null);

}

function viewAllocatedApplicant(interviewID) {

    document.getElementById("viewinterviewID").innerHTML = interviewID;


    var httpxml;
    httpxml = new XMLHttpRequest();
    function stateChanged() {
        if (httpxml.readyState == 4) {
            alert(interviewID);
            document.getElementById("allocatedApplicantTableBody").innerHTML = httpxml.responseText;
        }
    }
    var url = "../../ViewInterviewAllocatedApplicant";
    url = url + "?interviewID=" + interviewID;
    httpxml.onreadystatechange = stateChanged;
    httpxml.open("POST", url, true);
    httpxml.send(null);
}