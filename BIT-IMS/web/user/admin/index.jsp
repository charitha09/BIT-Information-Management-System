<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC SMS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/common-style.css">
        <link rel="stylesheet" href="../css/admin-index.css">
    </head>
    <body>   
        <%
            try {
                String fName = session.getAttribute("email").toString();
                String userLevel = session.getAttribute("userLevel").toString();
            } catch (Exception e) {
                response.sendRedirect("../../");

            }
        %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/admin-index.js"></script>   
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li> 
                    <li><a href="user_create_edit.jsp">Users</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <div class="container">             
            <div class="col-sm-12 logins-raw">
                <div class="col-sm-12 no-padding">
                    <h3>Last Logins</h3>
                </div>
                <div class="col-sm-3 no-padding">
                    <h5>User ID</h5>
                </div>
                <div class="col-sm-3 no-padding">
                    <h5>e-mail</h5>
                </div>
                <div class="col-sm-3 no-padding">
                    <h5>User Role</h5>
                </div>
                <div class="col-sm-3 no-padding">
                    <h5>Last Login Time</h5>
                </div>
            </div>
        </div>
    </body>
</html>