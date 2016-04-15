<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Degree Registration</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/common-style.css">
        <link rel="stylesheet" href="../css/course-application-form.css">
    </head>
    <body>
        <script src="../js/jquery-1.12.2.min.js"></script>
        <script src="../js/bootstrap.js"></script> 
        <script src="../js/course-application-form.js"></script>
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp"><img src="../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Page 1</a></li>
                    <li class="active"><a href="Pages/course-application-form.jsp">Apply Course</a></li> 
                    <li><a href="#">Contact Us</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <!--Login Box-->
        <section id="user-login">
            <div id="login-box" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Login to System</h4>
                    </div>
                    <form name="user-login" action="index.jsp" method="POST">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="email">Email address:</label>
                                <input type="email" class="form-control" id="email">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox"> Remember me</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!--Student Application Form-->
        <div class="container">
            <div  id="form-headder" class="col-sm-12">
                <h1><img src="../images/logo.png" alt="UCSC"></h1>
                <h1>University Of Colombo School Of Computing</h1>
                <h1>Student Application Form</h1>
            </div>
            <form name="user-apply" action="index.jsp" method="POST">
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
                <div id="app-details-1" class="col-sm-12">
                    <div class="form-group col-sm-4">
                        <label for="ful-name">Full Name</label>
                    </div>  
                    <div class="form-group col-sm-8">    
                         <input type="text" id="ful-name" placeholder="Your Full Name" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="ini-name">Initials</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="ini-name" placeholder="Initials Of Your Name" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="lst-name">Last Name</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="lst-name" placeholder="Your Last Name" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="title">Title</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <select class="form-control" id="course">
                            <option value="" disabled selected hidden>- - Select Title - -</option>
                            <option value="0">Mr</option>
                            <option value="1">Miss</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="gender">Gender</label>
                    </div>
                    <div class="radio col-sm-8">
                        <label><input type="radio" id="gender" value="Male">Male</label>                    
                        <label><input type="radio" id="gender" value="Female">Female</label>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="citi-ship">Citizenship</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="citi-ship" placeholder="Your Citizenship" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="nation">Nationality</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="nation" placeholder="Your Nationality" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="nati-id">National ID</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="nati-id" placeholder="Your National ID card Number" required class="form-control"/>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="dob">Date Of Birth</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="date" id="dob" placeholder="DD/MM/YYYY" required class="form-control"/>
                    </div>
                    <button class="btn btn-success" onclick="NextFromPersonal()">Next</button>                    
                </div>
                <div id="app-details-2" class="col-sm-12">
                    2
                </div> 
                <div id="app-details-3" class="col-sm-12">
                    3
                </div> 
                <div id="app-details-4" class="col-sm-12">
                    4
                </div> 
            </form>
        </div>
    </body>
</html>
