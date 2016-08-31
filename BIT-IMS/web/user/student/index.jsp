<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
        <link rel="stylesheet" href="../css/student-index.css">
    </head>
    <body>       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/student-index.js"></script>   
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li> 
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Registrations
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../../selectExamCenter.jsp">Exam Registration</a></li>
                           <!-- <li><a href="#">Course Registration</a></li> -->
                        </ul>
                    </li>
                    <li><a href="#">Messages</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <div class="container">
            <div class="col-sm-2">
                Courses
            </div>
            <div class="col-sm-6">
                News
            </div>
            <div class="col-sm-4">
                <div id="GPA" class="col-sm-12 stat-box">
                    <div class="col-sm-12">
                        <h3>Current GPA</h3>
                    </div>
                    <div class="col-sm-12">
                        <h3>3.2110</h3>
                    </div>
                </div>
                GPA/Student Statistics
            </div>            
        </div>
    </body>
</html>