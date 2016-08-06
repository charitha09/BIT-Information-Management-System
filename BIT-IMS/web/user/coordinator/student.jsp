<%-- 
    Document   : student
    Created on : Aug 2, 2016, 11:45:27 AM
    Author     : Amila Sankha
--%>
<%@page import="com.ims.model.Student"%>
<%@page import="com.ims.model.Applicant"%>
<%@page import="com.ims.model.Payment"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>


<%
    try {
        String fName = session.getAttribute("email").toString();
        String userLevel = session.getAttribute("userLevel").toString();

    } catch (Exception e) {
        response.sendRedirect("../../");

    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC SMS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/common-style.css">
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="../../js/student.js"></script>   
        <header>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li> 
                        <li><a href="interview_create_edit.jsp">Interview</a></li> 
                        <li><a href="viewApplicant.jsp">Applicant</a></li> 
                        <li><a href="payment.jsp">Payment</a></li> 
                        <li><a href="student.jsp">Student</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <h1>Student Details</h1>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addStudent'>Add Student</button>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#searchStudent'>Search Student</button>

        <!-- ======================================================== -->
        <!-- Add Student -->

        <div id="addStudent" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Student</h2>
                    </div>
                    <div class="modal-body ">

                        <form method="POST" action="../../AddStudent">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Application Number</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="addStudentApplicationNum" name="addStudentApplicationNum" placeholder="Application Number" class="form-control" required data-error="Can't be empty" onblur="checkApplicantInDB(this.value)"/>
                                <div id="addStudentApplicationNunErr" class="help-block with-errors"></div>
                            </div>


                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Year</label>
                            </div>
                           
                            <div class="form-group col-sm-8">
                        <select class="form-control" id="addStudentAcademicYear" name="addStudentAcademicYear" required data-error="Must Select">
                            <option value="" disabled selected hidden>- - Select Year - -</option>
                            <option value="1stYear">1st Year</option>
                            <option value="2ndYear">2nd Year</option>
                            <option value="3rdYear">3rd Year</option>
                            <option value="4thYear">4th Year</option>
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>
                            
                            <button type="submit" class="btn btn-default" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </form>


                    </div>
                </div>
            </div>
        </div>

     
        <!-- ======================================================== -->
        <!-- Search Student -->
        <div id="searchStudent" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search Student</h2>
                    </div>
                    <div class="modal-body ">

                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByRegistrationNumber'><span class="glyphicon glyphicon-search"></span> By Registration Number</button> <br/><br/>
                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByCurrentYear'><span class="glyphicon glyphicon-search"></span>By Current Year</button> <br/><br/>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- Search By Registration Number -->
        <div id="searchByRegistrationNumber" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search Student Registration Number</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Registration Number</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchRegistrationNum" name="searchRegistrationNum" placeholder="Registration Number" class="form-control" />
                            <div id="searchRegistrationNumErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByRegistrationNum()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchRegistrationNumOutput"></div>


                    </div>
                </div>
            </div>
        </div>

<!-- ======================================================== -->
        <!-- Search By Current Year -->
        <div id="searchByCurrentYear" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search By Current Year</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Current Year</label>
                        </div>
                        
                        <div class="form-group col-sm-8">
                        <select class="form-control" id="searchCurrentYear" name="searchCurrentYear" required data-error="Must Select">
                            <option value="" disabled selected hidden>- - Select Year - -</option>
                            <option value="1stYear">1st Year</option>
                            <option value="2ndYear">2nd Year</option>
                            <option value="3rdYear">3rd Year</option>
                            <option value="4thYear">4th Year</option>
                        </select>
                        <div class="help-block with-errors"></div>
                        <div id="searchYearErr" class="help-block with-errors"></div>
                    </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByCurrentYear()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchCurrentYearOutput"></div>


                    </div>
                </div>
            </div>
        </div>
        
        
       
    </body>
</html>





