<%@page import="javax.validation.constraints.Null"%>
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
    </head>
    <body>       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="../../js/coordinator.js"></script>   
        <header>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="coordinate.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                    </div>
                    <ul class="nav navbar-nav">                       
                        <li><a href="coordinate.jsp">Coordinate</a></li> 
                        <li class="active"><a href="settings.jsp">Setting</a></li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <div class="col-sm-12 bottem-border">
                <h3>User Settings</h3>
            </div>
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <h5>Change Password</h5>
                </div>
                <div class="col-sm-6">
                    <button type='button' class="btn btn-success col-sm-12" data-toggle='modal' data-target='#changePassword'>Change Password</button>                    
                </div>
            </div>
            
                        
        </div>       

        <!-- change Password -->
        <div id="changePassword" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Change Password</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Current Password</label>
                        </div>
                        <div class="form-group col-sm-8">
                            <input type="password" id="currentPassword" name="currentPassword" placeholder="Current Password" class="form-control" onblur="isEmptyPassword()" />
                            <div id="currentPasswordErr" class="help-block with-errors"></div>
                        </div>

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">New Password</label>
                        </div>
                        <div class="form-group col-sm-8">
                            <input type="password" id="newPassword" name="newPassword" placeholder="New Password" class="form-control" onblur="checkNewPassword()" />
                            <div id="newPasswordErr" class="help-block with-errors"></div>
                        </div>

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Confirm New Password</label>
                        </div>
                        <div class="form-group col-sm-8">
                            <input type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder="Confirm New Password" class="form-control" onblur="checkConfirmNewPassword()" />
                            <div id="confirmNewPasswordErr" class="help-block with-errors"></div>
                        </div>

                        <div id="outputErr" class="help-block with-errors"></div>
                        <button type='button' class="btn btn-info" onclick="changePassword()"> Submit</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

