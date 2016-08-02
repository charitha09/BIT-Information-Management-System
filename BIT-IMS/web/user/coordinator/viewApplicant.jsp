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
        <script src="../../js/coordinator-interview.js"></script>   
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
                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
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
                            applicant = (Applicant)applicantList.get(i);
                            out.write("<tr>");
                            out.write("<td>" + applicant.getApplicationNum() + "</td>");
                            out.write("<td>" + applicant.getFullName()+ "</td>");
                            out.write("<td>" + applicant.getNicNo() + "<td>");
                            out.write("<br>" + applicant.getTelephoneNumMob() + "<br>");
                            out.write("<td>"+applicant.getEmail()+"</td>");
                            out.write("<td>"+applicant.getAddress()+"</td>");
                            out.write("</tr>");
                        }
                    %>


                </tbody>
            </table>

        </div>




    </body>
</html>