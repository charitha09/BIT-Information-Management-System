<%@page import="com.ims.model.User"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
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
        <script src="../../js/admin.js"></script>   
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
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <h2 id="create-User">Create User</h2>
            <div class="col-sm-12 line-seperater"></div>
            <div class="col-sm-12 shadow-box">
                <form name="admin_user_create" data-toggle="validator" action="../../AddUserController" method="POST">
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
                        <input type="email" id="cr_usr_email" name="cr_usr_email" placeholder="E-mail Address Of User" required class="form-control" data-error="Empty or Incorrect" onchange="checkEmail()"/>
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
                            <option value="coordinator">Coordinator</option>
                            <option value="departmentHead">Department Head</option>
                            <option value="operationalStaff">Operational Staff</option>
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-12"><!--Empty Div--></div>
                    <!--   <div class="form-group col-sm-4">
                           <label for="cr_usr_loginName">Login Name</label>
                       </div>
                       <div class="form-group col-sm-8">
                           <input type="text" id="cr_usr_loginName" name="cr_usr_loginName" placeholder="Login Name for User" required class="form-control" data-error="Can't be empty"/>
                           <div class="help-block with-errors"></div>
                       </div>
                    -->
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
            <%
                SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
                Session s = sessionFactry.openSession();
                //s.beginTransaction();
            %>
            <h2>Current Users</h2>
            <div class="col-sm-12 line-seperater"></div>            
            <div class="col-sm-12 shadow-box">
                <h3>Administrators</h3>
                <div class="col-sm-12 line-seperater"></div>   
                <div class="col-sm-12">
                    <%
                        Query queryAdmin = s.createQuery("FROM User where userLevel='admin'and state=1");
                        List adminUser = queryAdmin.list();

                        for (int i = 0; i < adminUser.size(); i++) {
                            User u = new User();
                            u = (User) adminUser.get(i);
                            out.write("<br>" + u.getName() + "<br>");
                            out.write("<input type='button' value='update' onclick=viewUserDetails('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='Reset Password' onclick=resetPassword('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='delete' onclick=suspendUser('" + u.getUserId() + "')>");
                        }
                    %>

                </div> 
                <h3>Department Heads</h3>
                <div class="col-sm-12 line-seperater"></div>   
                <div class="col-sm-12">
                    <%
                        Query queryDepHead = s.createQuery("FROM User where userLevel='departmentHead'and state=1");
                        List depHeadUserIDS = queryDepHead.list();

                        for (int i = 0; i < depHeadUserIDS.size(); i++) {
                            User u = new User();
                            u = (User) depHeadUserIDS.get(i);
                            out.write("<br>" + u.getName() + "<br>");
                            out.write("<input type='button' value='update' onclick=viewUserDetails('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='Reset Password' onclick=resetPassword('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='delete' onclick=suspendUser('" + u.getUserId() + "')>");
                        
                        }
                    %>

                </div> 
                <h3>Coordinator</h3>
                <div class="col-sm-12 line-seperater"></div>   
                <div class="col-sm-12">
                    <%
                        Query queryCoor = s.createQuery("FROM User where userLevel='coordinator' and state=1");
                        List coorUserIDS = queryCoor.list();

                        for (int i = 0; i < coorUserIDS.size(); i++) {
                            User u = new User();
                            u = (User) coorUserIDS.get(i);
                            out.write("<br>" + u.getName() + "<br>");
                            out.write("<input type='button' value='update' onclick=viewUserDetails('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='Reset Password' onclick=resetPassword('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='delete' onclick=suspendUser('" + u.getUserId() + "')>");
                        
                        }
                    %>

                </div> 
                <h3>Operational Staff</h3>
                <div class="col-sm-12 line-seperater"></div>   
                <div class="col-sm-12">

                    <%
                        Query queryOpeStaff = s.createQuery("FROM User where userLevel='operationalStaff' and state=1");
                        List opeStaffUserIDS = queryOpeStaff.list();

                        for (int i = 0; i < opeStaffUserIDS.size(); i++) {
                            User u = new User();
                            u = (User) opeStaffUserIDS.get(i);
                            out.write("<br>" + u.getName() + "<br>");
                            out.write("<input type='button' value='update' onclick=viewUserDetails('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='Reset Password' onclick=resetPassword('" + u.getUserId() + "')>");
                            out.write("<input type='button' value='delete' onclick=suspendUser('" + u.getUserId() + "')>");
                        
                        }
                    %>

                </div> 
            </div>
        </div>
        <div id="updateUserDetails">

        </div>
    </body>
</html>