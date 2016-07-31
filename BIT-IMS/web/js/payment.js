/* 
 * auther Amila Sankha
 */



/*
 * Search payment details using payment ID
 */
function searchByPaymentID() {

    var paymentID = document.getElementById("searchPaymentID").value;
    alert(paymentID);
    paymentID = paymentID.trim();

    if (paymentID == "") {
        document.getElementById("searchPaymentIDErr").innerHTML = "Empty";
    } else {
        alert(paymentID);
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchPaymentIDOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchPayment";
        url = url + "?method=byID&input=" + paymentID;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}


/*
 * Search payment details using student ID
 */
function searchByStudentID() {

    var StudentID = document.getElementById("searchStudentID").value;
    alert(StudentID);
    StudentID = StudentID.trim();

    if (StudentID == "") {
        document.getElementById("searchStudentIDErr").innerHTML = "Empty";
    } else {
        alert(StudentID);
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchStudentIDOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchPayment";
        url = url + "?method=byStudentID&input=" + StudentID;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}

/*
 * Search payment details using Application Number
 */
function searchByApplicationNumber() {

    var ApplicationNumber = document.getElementById("searchApplicationNumber").value;
    alert(ApplicationNumber);
    ApplicationNumber = ApplicationNumber.trim();

    if (ApplicationNumber == "") {
        document.getElementById("searchApplicationNumberErr").innerHTML = "Empty";
    } else {
        alert(ApplicationNumber);
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchApplicationNumberOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchPayment";
        url = url + "?method=byApplicationNumber&input=" + ApplicationNumber;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}


/*
 * Search payment details using Exam ID
 */
function searchByExamID() {

    var ExamID = document.getElementById("searchExamID").value;
    alert(ExamID);
    ExamID = ExamID.trim();

    if (ExamID == "") {
        document.getElementById("searchExamIDErr").innerHTML = "Empty";
    } else {
        alert(ExamID);
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchExamIDOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchPayment";
        url = url + "?method=byExamID&input=" + ExamID;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}

/*
 * Search payment details using Payment Type
 */
function searchByPaymentType() {

    var paymentType = document.getElementById("searchpaymentType").value;
    alert(paymentType);
    paymentType = paymentType.trim();

    if (paymentType == "") {
        document.getElementById("searchpaymentTypeErr").innerHTML = "Empty";
    } else {
        alert(paymentType);
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {
                document.getElementById("searchpaymentTypeOutput").innerHTML = httpxml.responseText;
            }
        }
        var url = "../../SearchPayment";
        url = url + "?method=bypaymentType&input=" + paymentType;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}

/*
 * Check this value in Database Applicant Table 
 */
function checkApplicantInDB(value){
    
    value = value.trim();

    if (value=="") {
        document.getElementById("paymentApplicationNum").value="";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {//
                if(httpxml.responseText =="Ok"){
                    document.getElementById("applicationNunErr").innerHTML = "";
                }else{
                    document.getElementById("applicationNunErr").innerHTML = httpxml.responseText;
                    document.getElementById("paymentApplicationNum").value="";
                }
                
            }
        }
        var url = "../../CheckInDB";
        url = url + "?table=Applicant&value=" + value;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }

}


/*
 * Check this value in Database Student Table 
 */
function checkStudentInDB(value){
    
    value = value.trim();

    if (value=="") {
        document.getElementById("paymentApplicationNumOrStudentID").value="";
    } else {
        var httpxml;
        httpxml = new XMLHttpRequest();
        function stateChanged() {
            if (httpxml.readyState == 4) {//
                if(httpxml.responseText =="Ok"){
                    document.getElementById("RegistrationstudentIDErr").innerHTML = "";
                    document.getElementById("ExamstudentIDErr").innerHTML = "";
                    document.getElementById("OtherstudentIDErr").innerHTML = "";
                }else{
                    document.getElementById("RegistrationstudentIDErr").innerHTML = httpxml.responseText;
                    document.getElementById("RegistrationpaymentApplicationNumOrStudentID").value="";
                                    
                    document.getElementById("ExamstudentIDErr").innerHTML = httpxml.responseText;
                    document.getElementById("ExampaymentApplicationNumOrStudentID").value="";
                    
                    document.getElementById("OtherstudentIDErr").innerHTML = httpxml.responseText;
                    document.getElementById("OtherpaymentApplicationNumOrStudentID").value="";
                }
                
            }
        }
        var url = "../../CheckInDB";
        url = url + "?table=Student&value=" + value;
        httpxml.onreadystatechange = stateChanged;
        httpxml.open("POST", url, true);
        httpxml.send(null);
    }
}