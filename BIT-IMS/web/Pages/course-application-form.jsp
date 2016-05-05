<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Degree Registration</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/common-style.css">
        <link rel="stylesheet" href="../css/course-application-form.css">
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="../js/validator.min.js"></script>
        <script src="../js/course-application-form.js"></script>
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp"><img src="../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="../index.jsp">Home</a></li>
                    <li><a href="#">Page 1</a></li>
                    <li class="active"><a href="course-application-form.jsp">Apply Course</a></li> 
                    <li><a href="contact-us.jsp">Contact Us</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <!--Login Box-->
        <%@include file="../WEB-INF/includes/user-login.jsp" %>
        <!--Student Application Form-->
        <div class="container">
            <div  id="form-headder" class="col-sm-12">
                <h1><img src="../images/logo.png" alt="UCSC"></h1>
                <h1>University Of Colombo School Of Computing</h1>
                <h1>Student Application Form</h1>
            </div>
            <form name="user-apply" data-toggle="validator" action="index.jsp" method="POST">
                <!--Course Selection-->
                <div id="app-for" class="col-sm-12">
                    <div class="form-group col-sm-4">
                        <label for="course">Application For</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <select class="form-control" id="course">
                            <option value="" disabled selected hidden>- - Select Course - -</option>
                            <option value="0">Bachelor of Information Technology ( BIT )</option>
                            <option value="1">Foundation in Information Technology ( FIT )</option>
                            <option value="2">Other</option>
                        </select>
                    </div>
                </div>
                <!--Form Navigation Bar-->
                <div id="app-nav" class="btn-group btn-group-justified">
                    <div class="btn-group">
                        <button id="PersonalDetails" type="button" class="btn btn-primary app-nav-active" onclick="clickPersonal()">Personal Details</button>
                    </div>
                    <div class="btn-group">
                        <button id="ContactDetails" type="button" class="btn btn-primary" onclick="clickContact()">Contact Details</button>
                    </div>
                    <div class="btn-group">
                        <button id="EducationDetails" type="button" class="btn btn-primary" onclick="clickEducation()">Carrier Details</button>
                    </div>
                    <div class="btn-group">
                        <button id="PaymentDetails" type="button" class="btn btn-primary" onclick="clickPayment()">Payment Details</button>
                    </div>
                </div>
                <!--Personal Details Tab-->
                <div id="app-details-1" class="col-sm-12">
                    <div class="form-group col-sm-4">
                        <label for="perdtl-ful-name">Full Name</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                        <input type="text" id="perdtl-ful-name" placeholder="Your Full Name" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-ini-name">Initials</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="perdtl-ini-name" placeholder="Initials Of Your Name" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-lst-name">Last Name</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="perdtl-lst-name" placeholder="Your Last Name" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-title">Title</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <select class="form-control" id="perdtl-title" required data-error="Must select">
                            <option value="" disabled selected hidden>- - Select Title - -</option>
                            <option value="0">Mr</option>
                            <option value="1">Miss</option>
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-gender">Gender</label>
                    </div>
                    <div class="radio col-sm-8">
                        <label><input type="radio" id="perdtl-gender" value="M" name="gender">Male</label>                    
                        <label><input type="radio" id="perdtl-gender" value="F" name="gender">Female</label>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-citizen">Citizenship</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="perdtl-citizen" placeholder="Your Citizenship" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-nation">Nationality</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="perdtl-nation" placeholder="Your Nationality" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-nic">National ID</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="perdtl-nic" placeholder="Your National ID card Number" required class="form-control" pattern="\d{9}([v]|[V]|[x]|[X])" data-error="Empty or invalied NIC number"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="perdtl-dob">Date Of Birth</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="date" id="perdtl-dob" required class="form-control" data-error="Empty or invalied Date" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="btn-box">
                        <button type="button" class="btn btn-success" onclick="clickContact()">Next</button> 
                    </div>
                </div>
                <!--Contact Details Tab-->
                <div id="app-details-2" class="col-sm-12">
                    <div class="form-group col-sm-4">
                        <label for="address">Permanent Address</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                        <input type="text" id="address" placeholder="Your Permanent Address" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="country">Country</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                        <input type="text" id="country" list="Countries" placeholder="Your Country" required class="form-control" data-error="Can't be empty"/>
                        <datalist id="Countries">
                            <% 
                                String[] country = {"Afghanistan","Albania","Algeria","Andorra","Angola","Antigua and Barbuda","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Republic","Chad","Chile","China","Colombi","Comoros","Congo (Brazzaville)","Congo","Costa Rica","Cote d'Ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor (Timor Timur)","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia, The","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea, North","Korea, South","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russia","Rwanda","Saint Kitts and Nevis","Saint Lucia","Saint Vincent","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia and Montenegro","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"}; 
                                for (int i = 0; i < country.length; i++){
                                    out.write("<option value='" + country[i] + "'>");
                                }
                            %>
                        </datalist> 
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="tel-fix">Telephone Number (FIX)</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                        <input type="text" id="tel-fix" placeholder="Your Fixed Telephone Number" required class="form-control" pattern="([\+]\d{2}|\d{1})\d{9}" data-error="Empty or invalid phone Number ex:- 011XXXXXXX or +94XXXXXXXXX"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="tel-mob">Telephone Number (Mobile)</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                         <input type="text" id="tel-mob" placeholder="Your Mobile Number" required class="form-control" pattern="([\+]\d{2}|\d{1})\d{9}" data-error="Empty or invalid phone Number ex:- 07XXXXXXXX or +947XXXXXXXX"/>
                         <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="email">E-mail</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                         <input type="email" id="email" placeholder="E-mail Address" required class="form-control" data-error="Empty or invalid email address"/>
                         <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="btn-box">
                        <button type="button" class="btn btn-success" onclick="clickEducation()">Next</button>
                        <button type="button" class="btn btn-default" onclick="clickPersonal()">Back</button>
                    </div>
                </div> 
                <!--Carrier Details Tab-->
                <div id="app-details-3" class="col-sm-12">
                    <% String[] grades = {"A", "B", "C", "S", "F", "Not Participated"}; %>
                    <div class="form-group col-sm-4">
                        <label for="fit-res">Foundation in Information Technology Result</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <select class="form-control" id="fit-res" required data-error="Must Select">
                            <option value="" disabled selected hidden>- - Select Result for FIT - -</option>
                            <%                                     
                                for (int i = 0; i < grades.length; i++){
                                    out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                }
                            %>
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="al-res">A/L Results</label>
                    </div>
                    <div class="col-sm-8 carrier-set">
                        <div class="form-group col-sm-6">
                            <input type="text" id="al-res-sub1" placeholder="Enter A/L Subject Name 01" required class="form-control" data-error="Can't be empty"/>
                            <div class="help-block with-errors"></div>
                        </div> 
                        <div class="form-group col-sm-6">                    
                            <select class="form-control" id="al-res-sub1" required data-error="Must Select">
                                <option value="" disabled selected hidden>- - Select Result - -</option>
                                <%                                     
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <!--Pseudo div-->
                    </div>
                    <div class="col-sm-8 carrier-set">
                        <div class="form-group col-sm-6">
                            <input type="text" id="al-res-sub2" placeholder="Enter A/L Subject Name 02" required data-error="Can't be empty" class="form-control"/>
                            <div class="help-block with-errors"></div>
                        </div> 
                        <div class="form-group col-sm-6">                    
                            <select class="form-control" id="al-res-sub2" required data-error="Must Select">
                                <option value="" disabled selected hidden>- - Select Result - -</option>
                                <%                                     
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <!--Pseudo div-->
                    </div>
                    <div class="col-sm-8 carrier-set">
                        <div class="form-group col-sm-6">
                            <input type="text" id="al-res-sub3" placeholder="Enter A/L Subject Name 03" required data-error="Can't be empty" class="form-control"/>
                            <div class="help-block with-errors"></div>
                        </div> 
                        <div class="form-group col-sm-6">                    
                            <select class="form-control" id="al-res-sub3" required data-error="Must Select">
                                <option value="" disabled selected hidden>- - Select Result - -</option>
                                <%                                     
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="ol-res">O/L Results</label>
                    </div>
                    <div class="col-sm-8 carrier-set">
                        <div class="form-group col-sm-4">
                            <label for="ol-res-sub1">Results For Mathematics</label>
                        </div> 
                        <div class="form-group col-sm-4">                    
                            <select class="form-control" id="ol-res-sub1" required data-error="Must Select">
                                <option value="" disabled selected hidden>- - Select Result - -</option>
                                <%                                     
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <!--Pseudo div-->
                    </div>
                    <div class="col-sm-8 carrier-set">
                        <div class="form-group col-sm-4">
                            <label for="ol-res-sub2">Results For English</label>
                        </div> 
                        <div class="form-group col-sm-4">                    
                            <select class="form-control" id="ol-res-sub2" required data-error="Must Select">
                                <option value="" disabled selected hidden>- - Select Result - -</option>
                                <%                                     
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="emp-dtl">Employment Details</label>
                    </div> 
                    <div class="form-group col-sm-4">
                        <label for="emp-dtl-current">Are you currently employed?</label>
                    </div>
                    <div class="radio col-sm-4">
                        <label><input type="radio" id="emp-dtl-current" value="Y" name="emp-curr">Yes</label>                    
                        <label><input type="radio" id="emp-dtl-current" value="N" name="emp-curr">No</label>
                    </div>
                    <div class="form-group col-sm-4">
                        <!--Pseudo div-->
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="emp-dtl-discript">If employed: Designation</label>
                    </div>
                    <div class="form-group col-sm-4">
                        <textarea class="form-control" rows="4" id="emp-dtl-discript" placeholder="Your Designation Here"></textarea>
                    </div>
                    <div class="form-group col-sm-4">
                        <!--Pseudo div-->
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="emp-dtl-field">Are you working on computer field?</label>
                    </div>
                    <div class="radio col-sm-4">
                        <label><input type="radio" id="emp-dtl-field" value="Y" name="emp-field">Yes</label>                    
                        <label><input type="radio" id="emp-dtl-field" value="N" name="emp-field">No</label>
                    </div>
                    <div class="form-group col-sm-4">
                        <!--Pseudo div-->
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="emp-dtl-salary">Monthly Salary</label>
                    </div>
                    <div class="radio col-sm-4">
                        <input type="text" id="emp-dtl-salary" placeholder="Your Monthly Salary" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="btn-box">
                        <button type="button" class="btn btn-success" onclick="clickPayment()">Next</button>
                        <button type="button" class="btn btn-default" onclick="clickContact()">Back</button>
                    </div>
                </div> 
                <!--Payment Details Tab-->
                <div id="app-details-4" class="col-sm-12">
                    <% String[] centers = {"Colombo", "Galle", "Kandy"}; %>
                    <div class="form-group col-sm-8">
                        <label for="reg-slip">If you not paid yet please pay for the bank before filling the application form</label>                        
                    </div>
                    <div class="col-sm-4">
                        <a href="#">Download The Deposit Slip</a>
                    </div>
                    <div class="form-group col-sm-12">
                        <!--Pseudo div-->
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="reg-center">Registration Center</label>
                    </div> 
                    <div class="form-group col-sm-8">                    
                        <select class="form-control" id="reg-center">
                            <option value="" disabled selected hidden>- - Choose Registration Near To You - -</option>
                            <%                                     
                                for (int i = 0; i < centers.length; i++){
                                    out.write("<option value=' " + i + "'>" + centers[i] + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="reg-pammount">Amount Paid (RS)</label>
                    </div>
                    <div class="radio col-sm-8">
                        <input type="text" id="reg-pammount" placeholder="Amount You Paid" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="reg-bank">Name of Payee Bank</label>
                    </div> 
                    <div class="form-group col-sm-8">                    
                        <input type="text" id="reg-bank" placeholder="Bank You Paid" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="reg-pdate">Date Paid</label>
                    </div> 
                    <div class="form-group col-sm-8">                    
                        <input type="text" id="reg-pdate" placeholder="Date You Paid" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="col-sm-12 warning-apply-anc">
                        <div class="col-sm-2">
                            <h5 class="warning-apply">Warning : </h5>
                        </div>
                        <div class="col-sm-10">
                            <h5>After you submit it will automatically download the copy for you to send via mail to UCSC. After submitting you are no longer able to edit or re submit a form with same national card number you used here. So we suggest you that to double check the details before submit. If you find any mistake after submitting please contact and request UCSC to correct mistake</h5>
                        </div>
                        <div class="col-sm-2">
                            <h5>How To Contact UCSC?</h5>
                        </div>
                        <div class="col-sm-10">
                            <a href="#">Contact Us</a>
                        </div>
                    </div>
                    <div class="form-group col-sm-12 bottem-border">
                    </div>
                    <div class="btn-box">
                        <button type="button" class="btn btn-success" onclick="viewFullForm()">Finish</button>
                        <button type="button" class="btn btn-default" onclick="clickEducation()">Back</button>
                    </div>
                    <div id="Submit-btn-box">
                        <button type="submit" class="btn btn-success" onclick="applyFormValidate()">Submit</button>
                        <button type="button" class="btn btn-default" onclick="backToNaviForm()">Edit</button>
                    </div>
                </div> 
            </form>
        </div>
    </body>
</html>
