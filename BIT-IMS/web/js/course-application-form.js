function clickPersonal() {
    document.getElementById("PersonalDetails").className += " app-nav-active";
    document.getElementById("ContactDetails").className =
        document.getElementById("ContactDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("EducationDetails").className =
        document.getElementById("EducationDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("PaymentDetails").className =
        document.getElementById("PaymentDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );

    document.getElementById("app-details-1").style.display = "block";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "none";
}

function clickContact() {
    document.getElementById("ContactDetails").className += " app-nav-active";
    document.getElementById("PersonalDetails").className =
        document.getElementById("PersonalDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("EducationDetails").className =
        document.getElementById("EducationDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("PaymentDetails").className =
        document.getElementById("PaymentDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );

    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "block";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "none";
}

function clickEducation() {
    document.getElementById("EducationDetails").className += " app-nav-active";
    document.getElementById("PersonalDetails").className =
        document.getElementById("PersonalDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("ContactDetails").className =
        document.getElementById("ContactDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("PaymentDetails").className =
        document.getElementById("PaymentDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );

    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "block";
    document.getElementById("app-details-4").style.display = "none";
}

function clickPayment() {
    document.getElementById("PaymentDetails").className += " app-nav-active";
    document.getElementById("PersonalDetails").className =
        document.getElementById("PersonalDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("ContactDetails").className =
        document.getElementById("ContactDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );
    document.getElementById("EducationDetails").className =
        document.getElementById("EducationDetails").className.replace( /(?:^|\s)app-nav-active(?!\S)/g , '' );

    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "block";
}