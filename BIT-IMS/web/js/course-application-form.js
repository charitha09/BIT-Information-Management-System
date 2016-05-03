/*Form Navigation and Next Back Buttons*/
function clickPersonal() {
    document.getElementById("PersonalDetails").className += " app-nav-active";
    document.getElementById("ContactDetails").className =
            document.getElementById("ContactDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("EducationDetails").className =
            document.getElementById("EducationDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("PaymentDetails").className =
            document.getElementById("PaymentDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');

    document.getElementById("app-details-1").style.display = "block";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "none";
}

function clickContact() {
    document.getElementById("ContactDetails").className += " app-nav-active";
    document.getElementById("PersonalDetails").className =
            document.getElementById("PersonalDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("EducationDetails").className =
            document.getElementById("EducationDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("PaymentDetails").className =
            document.getElementById("PaymentDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');

    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "block";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "none";
}

function clickEducation() {
    document.getElementById("EducationDetails").className += " app-nav-active";
    document.getElementById("PersonalDetails").className =
            document.getElementById("PersonalDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("ContactDetails").className =
            document.getElementById("ContactDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("PaymentDetails").className =
            document.getElementById("PaymentDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');

    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "block";
    document.getElementById("app-details-4").style.display = "none";
}

function clickPayment() {
    document.getElementById("PaymentDetails").className += " app-nav-active";
    document.getElementById("PersonalDetails").className =
            document.getElementById("PersonalDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("ContactDetails").className =
            document.getElementById("ContactDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');
    document.getElementById("EducationDetails").className =
            document.getElementById("EducationDetails").className.replace(/(?:^|\s)app-nav-active(?!\S)/g, '');

    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "block";
}

function viewFullForm() {
    document.getElementById("app-nav").style.display = "none";
    document.getElementById("app-details-1").style.display = "block";
    document.getElementById("app-details-2").style.display = "block";
    document.getElementById("app-details-3").style.display = "block";
    document.getElementById("app-details-4").style.display = "block";
    /*Hiding Buttons*/
    var btndivs = document.getElementsByClassName("btn-box");
    for (i = 0; i < btndivs.length; i++) {
        btndivs[i].style.display = "none";
    }
    ;
    document.getElementById("Submit-btn-box").style.display = "block";
}

function backToNaviForm() {
    document.getElementById("app-nav").style.display = "block";
    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "block";
    /*Showing Buttons*/
    var btndivs = document.getElementsByClassName("btn-box");
    for (i = 0; i < btndivs.length; i++) {
        btndivs[i].style.display = "block";
    }
    ;
    document.getElementById("Submit-btn-box").style.display = "none";
}

/*Form Validations*/
function PersonalDtlValidation() {
    var perdtlfulname = document.getElementById("perdtl-ful-name").value;
    var perdtlIniname = document.getElementById("perdtl-ini-name").value;
    var perdtllastname = document.getElementById("perdtl-last-name").value;
    var perdtltitle = document.getElementById("perdtl-title").value;
    var perdtlgender = document.getElementById("perdtl-gender").value;
    var perdtlcitizenship = document.getElementById("perdtl-citizen").value;
    var perdtlnationality = document.getElementById("perdtl-nationality").value;
    var perdtlNIC = document.getElementById("perdtl-nic").value;
    var perdtlDOB = document.getElementById("perdtl-dob").value;
}

function ContactDtlValidation() {
    var perdtladdress = document.getElementById("perdtl-address").value;
    var perdtlcountry = document.getElementById("perdtl-country").value;
    var perdtlTPfix = document.getElementById("perdtl-Tp-fix").value;
    var perdtlmobile = document.getElementById("perdtl-mobile").value;
    var perdtlemail = document.getElementById("perdtl-email").value;
}

function CarrierDtlValidation() {
    var perdtlFITresult = document.getElementById("perdtl-fit-result").value;
    var perdtlsub1 = document.getElementById("perdtl-sub-1").value;
    var perdtlresult1 = document.getElementById("perdtl-result-1").value;
    var perdtlsub2 = document.getElementById("perdtl-sub-2").value;
    var perdtlresult2 = document.getElementById("perdtl-result-2").value;
    var perdtlsub3 = document.getElementById("perdtl-sub-3").value;
    var perdtlresult3 = document.getElementById("perdtl-result-3").value;
    var perdtlmaths = document.getElementById("perdtl-maths").value;
    var perdtlmathsresult = document.getElementById("perdtl-maths-result").value;
    var perdtlenglish = document.getElementById("perdtl-english").value;
    var perdtlenglishresult = document.getElementById("perdtl-english-result").value;
    var perdtlemployed = document.getElementById("perdtl-employed").value;
    var perdtldesignation = document.getElementById("perdtl-designation").value;
    var perdtlfield = document.getElementById("perdtl-field").value;
    var perdtlsalary = document.getElementById("perdtl-salary").value;
}

function PaymentDtlValidation() {
    var perdtlregCenter = document.getElementById("perdtl-reg-center").value;
    var perdtlamount = document.getElementById("perdtl-amount").value;
    var perdtlbank = document.getElementById("perdtl-bank").value;
    var perdtldate = document.getElementById("perdtl-date").value;
}
/*
function PersonalDetailsNext() {
    var course = document.getElementById("course").value;
    var fullName = document.getElementById("perdtl-ful-name").value;
    var initials = document.getElementById("perdtl-ini-name").value;
    var lastName = document.getElementById("perdtl-lst-name").value;
    var title = document.getElementById("perdtl-title").value;
    var gender = document.getElementById("perdtl-gender").value;
    var citizenship = document.getElementById("perdtl-citizen").value;
    var nationality = document.getElementById("perdtl-nation").value;
    var nic = document.getElementById("perdtl-nic").value;
    var dob = document.getElementById("perdtl-dob").value;

    if (course == "" || fullName == "" || initials == "" || title == "" || gender == "" || citizenship == "" || nationality == "" || nic == "" || dob == "") {
        alert("Fill all details");
    } else {
        alert("ok");
    }


}

function nicValidate() {
    var status = "";
    var nic = document.getElementById("perdtl-nic").value;
    alert(nic);
    if ((nic.length != 10) || !((nic.contains("v")) | (nic.contains("V")))) {
        status = "invalid";

    } else {
        var year = nic.substring(0, 2);
        var date = nic.substring(2, 5);
        var gender = "";
        var month = "";

        if (date > 500) {
            gender = "Female";
            date = date - 500;
        } else {
            gender = "Male";
        }

        if (date <= 31) {
            month = "January";
            status = year + "/" + month + "/" + date + "\n" + gender;
        }
        else if (date <= 60) {
            month = "February";
            date = date - 31;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 91) {
            month = "March";
            date = date - 60;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 121) {
            month = "April";
            date = date - 91;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 152) {
            month = "May";
            date = date - 121;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 182) {
            month = "June";
            date = date - 152;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 213) {
            month = "July";
            date = date - 182;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 244) {
            month = "August";
            date = date - 213;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 274) {
            month = "September";
            date = date - 244;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 305) {
            month = "October";
            date = date - 274;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 335) {
            month = "November";
            date = date - 305;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else if (date <= 366) {
            month = "December";
            date = date - 335;
            status = year + "/" + month + "/" + date + "\n" + gender;

        }
        else {

            status = "invalid";
        }
    }
    alert(status);
    
}


function saveStudent() {

}
*/