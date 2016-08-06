<%-- 
    Document   : viewApplicant
    Created on : Jun 28, 2016, 11:37:28 PM
    Author     : Amila Sankha
--%>

<%@page import="com.ims.model.Applicant"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
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
        <script src="../../js/applicant.js"></script>   
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
                        <li><a href="settings.jsp">Setting</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#searchApplicant'>Search Applicant</button> <br/><br/>
        <h1>Applicant List</h1>

        <br><br>

        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Applicant ID</th>
                        <th>Name</th>
                        <th>NIC Number</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
                        Session s = sessionFactry.openSession();
                        //s.beginTransaction();
                        Query queryinterview = s.createQuery("FROM Applicant");
                        List applicantList = queryinterview.list();

                        for (int i = 0; i < applicantList.size(); i++) {
                            Applicant applicant = new Applicant();
                            applicant = (Applicant) applicantList.get(i);
                            out.write("<tr>");
                            out.write("<td>" + applicant.getApplicationNum() + "</td>");
                            out.write("<td>" + applicant.getFullName() + "</td>");
                            out.write("<td>" + applicant.getNicNo() + "<td>");
                            out.write("<br>" + applicant.getTelephoneNumMob() + "<br>");
                            out.write("<td>" + applicant.getEmail() + "</td>");
                            out.write("<td>" + applicant.getAddress() + "</td>");
                            out.write("</tr>");
                        }
                    %>


                </tbody>
            </table>

        </div>


        <!-- ======================================================== -->
        <!-- Search Applicant -->
        <div id="searchApplicant" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search Student</h2>
                    </div>
                    <div class="modal-body ">

                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByApplicationNumber'><span class="glyphicon glyphicon-search"></span> By Application Number</button> <br/><br/>
                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByNicNumber'><span class="glyphicon glyphicon-search"></span>By NIC Number</button> <br/><br/>

                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- Search By Application Number -->
        <div id="searchByApplicationNumber" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search Applicant By Application Number</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Application Number</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchApplicationNum" name="searchApplicationNum" placeholder="Application Number" class="form-control" />
                            <div id="searchApplicationNumErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByApplicationNum()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchApplicationNumOutput"></div>


                    </div>
                </div>
            </div>
        </div>

        
        <!-- ======================================================== -->
        <!-- Search By NIC Number -->
        <div id="searchByNicNumber" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search Applicant By NIC Number</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">NIC Number</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchNICNum" name="searchNICNum" placeholder="NIC Number" class="form-control" />
                            <div id="searchNICNumErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByNICNum()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchNICNumOutput"></div>


                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
