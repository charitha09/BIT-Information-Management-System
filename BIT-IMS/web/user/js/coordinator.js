$( document ).ready(function() {
    $("#Interview-window").css("display", "block");
    $("#Applicant-window").css("display", "none");
    $("#Student-window").css("display", "none");
    $("#Payment-window").css("display", "none");
    
    $( "#Interview-window-navi" ).click(function() {
        $("#Interview-window").css("display", "block");
        $("#Applicant-window").css("display", "none");
        $("#Student-window").css("display", "none");
        $("#Payment-window").css("display", "none");
    });
    
    $( "#Applicant-window-navi" ).click(function() {
        $("#Interview-window").css("display", "none");
        $("#Applicant-window").css("display", "block");
        $("#Student-window").css("display", "none");
        $("#Payment-window").css("display", "none");
    });
    
    $( "#Student-window-navi" ).click(function() {
        $("#Interview-window").css("display", "none");
        $("#Applicant-window").css("display", "none");
        $("#Student-window").css("display", "block");
        $("#Payment-window").css("display", "none");
    });
    
    $( "#Payment-window-navi" ).click(function() {
        $("#Interview-window").css("display", "none");
        $("#Applicant-window").css("display", "none");
        $("#Student-window").css("display", "none");
        $("#Payment-window").css("display", "block");
    });
});




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