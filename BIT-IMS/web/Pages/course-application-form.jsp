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
                            <% 
                                for (int i = 0; i < 32; i++){
                                    out.write("<option value=' " + i + "'>" + i + "</option>");
                                }
                            %>
                        </select>
                        <label for="months" class="labels age-lbl">Days</label>
                        <select name="title" required class="inputs age">
                            <option value="" disabled selected hidden class="place-holder">- - Months - -</option>
                            <% 
                                for (int i = 0; i < 13; i++){
                                    out.write("<option value=' " + i + "'>" + i + "</option>");
                                }
                            %>
                        </select>
                        <label for="age" class="labels age-lbl">Months</label>
                        <select name="years" required class="inputs age">
                            <option value="" disabled selected hidden class="place-holder">- - Years - -</option>
                            <% 
                                for (int i = 16; i < 101; i++){
                                    out.write("<option value=' " + i + "'>" + i + "</option>");
                                }
                            %>
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
                            <input type="checkbox" name="vehicle" value="Car" class="check-box"/>
                            <label for="agree-box" class="labels check-lbl">
                                I have the Foundation in Information Technology ( FIT conducted by UCSC, With 'C' passes for O/L Mathematics and O/L English )
                            </label>
                            <label for="al-result" class="labels">A/L Results</label>
                            <% String[] grades = {"A", "B", "C", "S", "F", "AB"}; %>
                            <input type="text" name="sub-1" placeholder="Subject 01" class="inputs rsults"/>
                            <select name="sub-1-res" required class="inputs rsults res-select">
                                <option value="" disabled selected hidden class="place-holder">- - Select Result - -</option>
                                <%                                     
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select> 
                            <input type="text" name="sub-2" placeholder="Subject 02" class="inputs rsults"/>
                            <select name="sub-2-res" required class="inputs rsults res-select">
                                <option value="" disabled selected hidden class="place-holder">- - Select Result - -</option>
                                <% 
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select> 
                            <input type="text" name="sub-3" placeholder="Subject 03" class="inputs rsults"/>
                            <select name="sub-3-res" required class="inputs rsults res-select">
                                <option value="" disabled selected hidden class="place-holder">- - Select Result - -</option>
                                <% 
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select>  
                            <label for="ol-result" class="labels">O/L Results</label>
                            <label for="al-Maths" class="labels ol-labels">Results For Mathematics</label>
                            <select name="sub-mat-res" required class="inputs rsults res-select">
                                <option value="" disabled selected hidden class="place-holder">- - Select Result - -</option>
                                <% 
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select> 
                            <label for="al-English" class="labels ol-labels">Results For English</label>
                            <select name="sub-eng-res" required class="inputs rsults res-select">
                                <option value="" disabled selected hidden class="place-holder">- - Select Result - -</option>
                                <% 
                                    for (int i = 0; i < grades.length; i++){
                                        out.write("<option value=' " + i + "'>" + grades[i] + "</option>");
                                    }
                                %>
                            </select> 
                        </div>
                        <div class="borders lv3dev">
                            <label for="centers" class="labels">Registration Center</label>
                            <select name="sub-eng-res" required class="inputs select">
                                <option value="" disabled selected hidden class="place-holder">- - Select Your Nearest Registration Center - -</option>
                                <% 
                                    String[] centers = {"Galle", "Colombo", "Kandy"};
                                    for (int i = 0; i < centers.length; i++){
                                    out.write("<option value=' " + i + "'>" + centers[i] + "</option>");
                                    }
                                %>
                            </select> 
                            <label for="payment-amou" class="labels">Amount Paid</label>
                            <input type="text" name="payment-amou" placeholder="Amount You Paid" required class="inputs"/>
                            <label for="payment-bank" class="labels">Name of Payee Bank</label>
                            <input type="text" name="payment-bank" placeholder="Bank You Paid" required class="inputs"/>
                            <label for="payment-date" class="labels">Date Paid</label>
                            <input type="text" name="payment-date" placeholder="Date You Paid" required class="inputs"/>
                        </div>
                        <div class="borders lv3dev">
                            <label for="emp-dtl"  class="labels">Are you currently employed?</label>
                            <input type="radio" name="emp-dtl" value="yes" checked="checked" class="radio"/>
                            <label for="emp-dtl" class="labels-radio radio">Yes<br></label>                    
                            <input type="radio" name="emp-dtl" value="no" class="radio"/>
                            <label for="emp-dtl" class="labels-radio radio">No<br></label>
                            <label for="emp-disc" class="labels">If employed: Designation</label>
                            <textarea name="emp-disc" class="inputs text-area" placeholder="Your Designation"></textarea>
                            <label for="emp-field" class="labels">Working on computer field?</label>
                            <input type="radio" name="emp-field" value="yes" checked="checked" class="radio"/>
                            <label for="emp-field" class="labels-radio radio">Yes<br></label>                    
                            <input type="radio" name="emp-field" value="no" class="radio"/>
                            <label for="emp-field" class="labels-radio radio">No<br></label>
                            <label for="emp-sal"  class="labels">Monthly Salary</label>
                            <input type="text" name="emp-sal" placeholder="Your Monthly Salary" class="inputs"/>
                        </div>
                    </div>
                            <button type="reset" value="Reset" class="buttons">RESET</button>
                        <button type="submit" value="Submit" class="buttons">SEND</button>                         
                </form>                
            </div>                            
        </div>
        <jsp:include page="../WEB-INF/includes/footer.jsp"/>
    </body>
</html>
