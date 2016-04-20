/*Form Navigation and Next Back Buttons*/
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
    PersonalDetailsNext();
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

function viewFullForm(){
    document.getElementById("app-nav").style.display = "none";
    document.getElementById("app-details-1").style.display = "block";
    document.getElementById("app-details-2").style.display = "block";
    document.getElementById("app-details-3").style.display = "block";
    document.getElementById("app-details-4").style.display = "block";
    /*Hiding Buttons*/
    var btndivs =  document.getElementsByClassName("btn-box");
    for( i = 0; i <btndivs.length; i++) {
      btndivs[i].style.display = "none";
    };
    document.getElementById("Submit-btn-box").style.display = "block";
}

function backToNaviForm(){
    document.getElementById("app-nav").style.display = "block";
    document.getElementById("app-details-1").style.display = "none";
    document.getElementById("app-details-2").style.display = "none";
    document.getElementById("app-details-3").style.display = "none";
    document.getElementById("app-details-4").style.display = "block";  
    /*Showing Buttons*/
    var btndivs =  document.getElementsByClassName("btn-box");
    for( i = 0; i <btndivs.length; i++) {
      btndivs[i].style.display = "block";
    };
    document.getElementById("Submit-btn-box").style.display = "none";
}

/*Form Validations*/

function PersonalDetailsNext(){
    var course = document.getElementById("course").value;
    var fullName = document.getElementById("perdtl-ful-name").value;
    var initials = document.getElementById("perdtl-ini-name").value;
    alert(fullName);
}
function saveStudent(){
    
}
