/* 
 * author Amila Sankha
 */

function updateInterviewDetails(interviewID) {
    alert(interviewID);
    var httpxml;
    httpxml = new XMLHttpRequest();
    function stateChanged() {
        if (httpxml.readyState == 4) {
            alert(interviewID);
            //document.getElementById("updateInterviewDetailsBody").innerHTML = httpxml.responseText;
        }
    }
    var url = "../../LoadInterviewDetails";
    url = url + "?interviewID=" + interviewID;
    httpxml.onreadystatechange = stateChanged;
    httpxml.open("POST", url, true);
    httpxml.send(null);
}

function updateInterview(interviewID) {
    alert(interviewID);

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