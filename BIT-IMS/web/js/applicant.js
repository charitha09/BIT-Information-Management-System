/* 
 * auther Amila Sankha
 */



/*
 * search Applicant details using Application number
 */
function searchByApplicationNum(){
    
    var applicationNum = document.getElementById("searchApplicationNum").value;
    applicationNum = applicationNum.trim();

    if (applicationNum == "") {
        document.getElementById("searchApplicationNumErr").innerHTML = "Empty";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchApplicationNumOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchApplicant";
        url = url + "?method=byApplicationNum&input=" + applicationNum;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }
}

/*
 * search Applicant details using NIC number
 */
function searchByNICNum(){
    
    var NICNum = document.getElementById("searchNICNum").value;
    NICNum = NICNum.trim();

    if (NICNum == "") {
        document.getElementById("searchNICNumErr").innerHTML = "Empty";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchNICNumOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchApplicant";
        url = url + "?method=byNICNum&input=" + NICNum;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }
}

