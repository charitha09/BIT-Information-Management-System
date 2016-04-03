<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Degree Registration</title>
        <link rel="stylesheet" type="text/css" href="../style/common-style.css">
        <link rel="stylesheet" type="text/css" href="../style/pub-student-registration-form.css">
    </head>
    <body>
        <script type="text/javascript" src="../js/jquery-1.12.2.min.js"></script>
        <script type="text/javascript" src="../js/common-script.js"></script>
        <script type="text/javascript" src="../js/index-script.js"></script>        
        <header>
            <div id="logo">
                <a href="index.jsp"><img src="../images/logo.png" alt="UCSC"/></a>
            </div>
            <ul class="navi-items">
                <li><a href="index.jsp"><img src="../images/logo.png" alt="UCSC"/></a></li>
                <li><a href="#home">Login</a></li>
                <li><a href="../index.jsp">Home</a></li>
                <li id="toggle-btn">
                    <a href="javascript:void(0);" onclick="myFunction()">&#9776;</a>
                </li>
            </ul>
        </header>        
        <div id="main-bucket" class="borders">
            <h1><img src="../images/logo.png" alt="UCSC"></h1>
            <h1>University Of Colombo School Of Computing</h1>
            <h1>Student Application Form</h1>
            <div class="borders lv1dev">
                <form name="public-student-registration" action="pub-student-registration-form.jsp" method="POST">
                    <label for="course" class="labels">Application For</label>
                    <select name="course" required class="inputs">
                        <option value="" disabled selected hidden class="place-holder">- - Select Course - -</option>
                        <option value="0">Bachelor of Information Technology ( BIT )</option>
                        <option value="1">Foundation in Information Technology ( FIT )</option>
                        <option value="2">Other</option>
                    </select>
                    <div class="borders lv2dev">
                        <label for="ful-name" class="labels">Full Name</label>
                        <input type="text" name="ful-name" placeholder="Your Full Name" required class="inputs"/>
                        <label for="ini-name" class="labels">Initials</label>
                        <input type="text" name="ini-name" placeholder="Initials Of Your Name" required class="inputs"/>
                        <label for="lst-name" class="labels">Last Name</label>
                        <input type="text" name="lst-name" placeholder="Your Last Name" required class="inputs"/>
                        <label for="course" class="labels">Title</label>
                        <select name="title" required class="inputs select">
                            <option value="" disabled selected hidden class="place-holder">- - Select Title - -</option>
                            <option value="0">Miss</option>
                            <option value="1">Mr</option>
                        </select>
                        <label for="gender"  class="labels">Gender </label>
                        <input type="radio" name="gender" value="Male" checked="checked" class="radio"/>
                        <label for="gender" class="labels-radio radio">Male<br></label>                    
                        <input type="radio" name="gender" value="Female" class="radio"/>
                        <label for="gender" class="labels-radio radio">Female<br></label>
                        <label for="citi-ship" class="labels">Citizenship</label>
                        <input type="text" name="citi-ship" placeholder="Your Citizenship" required class="inputs"/>
                        <label for="nation" class="labels">Nationality</label>
                        <input type="text" name="nation" placeholder="Your Nationality" required class="inputs"/>
                        <label for="nati-id" class="labels">National ID</label>
                        <input type="text" name="nati-id" placeholder="Your National ID card Number" required class="inputs"/>
                        <label for="dob" class="labels">Date Of Birth</label>
                        <input type="date" name="dob" placeholder="Your Birthday" required class="inputs"/>
                        <label for="age" class="labels">Age as at DD/MM/YYYY</label>
                        <select name="days" required class="inputs age">
                            <option value="" disabled selected hidden class="place-holder">- - Days - -</option>
                            <option value="0">00</option>
                            <option value="1">01</option>
                            <option value="2">02</option>
                        </select>
                        <label for="months" class="labels age-lbl">Days</label>
                        <select name="title" required class="inputs age">
                            <option value="" disabled selected hidden class="place-holder">- - Months - -</option>
                            <option value="0">00</option>
                            <option value="1">01</option>
                            <option value="2">02</option>
                        </select>
                        <label for="age" class="labels age-lbl">Months</label>
                        <select name="years" required class="inputs age">
                            <option value="" disabled selected hidden class="place-holder">- - Years - -</option>
                            <option value="0">00</option>
                            <option value="1">01</option>
                            <option value="2">02</option>
                        </select>
                        <label for="age" class="labels age-lbl">Years</label>
                        <div class="borders lv3dev">
                            <label for="address" class="labels">Permanent Address</label>
                            <input type="text" name="address" placeholder="Your Permanent Address" required class="inputs"/>
                            <label for="country" class="labels">Country</label>
                            <input type="text" name="country" placeholder="Your Country" required class="inputs"/>
                            <label for="tel-no" class="labels">Telephone Number</label>
                            <input type="text" name="tel-no" placeholder="Your Telephone Number" class="inputs"/>
                            <label for="tel-no" class="labels">Telephone Number</label>
                            <input type="text" name="tel-no" placeholder="Your Telephone Number" class="inputs"/>
                            <label for="email" class="labels">E-mail</label>
                            <input type="email" name="email" placeholder="Your E-mail Address" class="inputs"/>
                        </div>
                        <div class="borders lv3dev">
                            <input type="checkbox" name="vehicle" value="Car"/>
                        </div>
                    </div>
                </form>                
            </div>
                            
        </div>
    </body>
</html>
