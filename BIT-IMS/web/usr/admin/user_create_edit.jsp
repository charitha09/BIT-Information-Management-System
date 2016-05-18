<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC SMS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/common-style.css">
        <link rel="stylesheet" href="../css/admin-user.css">
    </head>
    <body>       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="../../js/validator.min.js"></script>
        <script src="js/admin-index.js"></script>   
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li> 
                    <li class="active"><a href="user_create_edit.jsp">Users</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <div class="container">
            <h2>Create User</h2>
            <div class="col-sm-12 shadow-box">
                <form name="admin_user_create" data-toggle="validator" action="" method="POST">
                    <div class="form-group col-sm-4">
                        <label for="cr_usr_name">User Name</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="cr_usr_name" name="cr_usr_name" placeholder="Name Of User" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-12"><!--Empty Div--></div>
                    <div class="form-group col-sm-4">
                        <label for="cr_usr_email">E-mail</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="email" id="cr_usr_email" name="cr_usr_email" placeholder="E-mail Address Of User" required class="form-control" data-error="Empty or Incorrect"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-12"><!--Empty Div--></div>
                    <div class="form-group col-sm-4">
                        <label for="cr_usr_role">User Role</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <select class="form-control" id="cr_usr_role" name="cr_usr_role" required data-error="Must Select">
                            <option value="" disabled selected hidden>- - Select User Role - -</option>
                            <option value="admin">Administrator</option>
                            <option value="coord">Coordinator</option>
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-12"><!--Empty Div--></div>
                    <div class="form-group col-sm-4">
                        <label for="cr_usr_loginName">Login Name</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="text" id="cr_usr_loginName" name="cr_usr_loginName" placeholder="Login Name for User" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-12"><!--Empty Div--></div>
                    <div class="form-group col-sm-4">
                        <label for="cr_usr_loginPasswd">Login Password</label>
                    </div>
                    <div class="form-group col-sm-8">
                        <input type="password" id="cr_usr_loginPasswd" name="cr_usr_loginPasswd" placeholder="Login Password for User" required class="form-control" data-error="Can't be empty"/>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-12"><!--Empty Div--></div>
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-success btn-size">Submit</button>
                        <button type="reset" class="btn btn-danger btn-size">Clear</button>
                    </div>                            
                </form>                    
            </div>                
        </div>
    </body>
</html>