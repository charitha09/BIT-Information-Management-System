<%-- 
    Document   : interview_create_edit
    Created on : Jun 22, 2016, 11:57:28 AM
    Author     : Amila Sankha
--%>

<%@page import="com.ims.model.Interview"%>
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
                        <li><a href="student.jsp">Student</a></li> 

                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <h1>Interview</h1>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addNewInterview'>Add Interview</button> <br/><br/>
        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewAllUnallocatedApplicant' onclick="viewAllUnallocatedApplicant()">View All Unallocated Applicant </button>

        <br><br>

        <div>
            <h3>View Interviews</h3>
            <br><br>
            <table class="table">
                <thead>
                    <tr>
                        <th>Interview ID</th>
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>Author</th>
                        <th>Update</th>
                        <th>View applicant</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
                        Session s = sessionFactry.openSession();
                        //s.beginTransaction();
                        Query queryinterview = s.createQuery("FROM Interview");
                        List interviewList = queryinterview.list();

                        for (int i = 0; i < interviewList.size(); i++) {
                            Interview iv = new Interview();
                            iv = (Interview) interviewList.get(i);
                            out.write("<tr>");
                            out.write("<td>" + iv.getInterviewID() + "</td>");
                            out.write("<td>" + iv.getDate() + "</td>");
                            out.write("<td>" + iv.getStartTime() + "<td>");
                            out.write("<br>" + iv.getAuthor() + "<br>");
                            out.write("<td><button type='button' class='btn btn-info btn-lg' data-toggle='modal' data-target='#updateInterviewDetails' onclick=updateInterviewDetails('" + iv.getInterviewID() + "')>Update Interviw Details</button></td>");
                            out.write("  ");
                            out.write("<td><button type='button' class='btn btn-info btn-lg' data-toggle='modal' data-target='#viewAllocatedApplicant' onclick=viewAllocatedApplicant('" + iv.getInterviewID() + "')>view Allocated Applicant</button></td>");
                            out.write("</tr>");
                        }
                    %>


                </tbody>
            </table>

        </div>

        <!-- Modal View All unallocated Applicant -->
        <div id="viewAllUnallocatedApplicant" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">All Unallocated Applicant</h4>
                    </div>
                    <div class="modal-body ">
                        <h2></h2>
                        <div id="unallocatedApplicantTableBody"style="height: auto">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



        <!-- Modal View Allocated Applicant -->
        <div id="viewAllocatedApplicant" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="viewinterviewID">Modal Header</h4>
                    </div>
                    <div class="modal-body ">
                        <h2>Allocated Applicant</h2>
                        <div id="allocatedApplicantTableBody"style="height: auto">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Update Interview Details -->
        <div id="updateInterviewDetails" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" id="viewinterviewID">Update Interview Details</h2>
                    </div>
                    <div class="modal-body ">

                        <div id="updateInterviewDetailsBody"style="height: auto">
                            <form id="updateInterview" action="../../UpdateInterviewDetails" method="POST">
                                <div class="form-group col-sm-4">
                                    <label>Interview ID</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <label id="viewInterviewID" ></label>
                                </div>
                                <div>
                                    <input type="text" id="interviewID" name="interviewID" style="visibility: hidden"/>

                                </div>                                

                                <div class="form-group col-sm-4">
                                    <label>Date</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="date" id="updateInterviewDate" name="updateInterviewDate" placeholder="Interview Date" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-sm-4">
                                    <label>Start Time</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="time" id="updateInterviewStartTime" name="updateInterviewStartTime" placeholder="Interview Start Time" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-default" >Update</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>

                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>


        <!-- Modal Add New Interview -->
        <div id="addNewInterview" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" id="viewinterviewID">New Interview</h2>
                    </div>
                    <div class="modal-body ">

                        <div id="updateInterviewDetailsBody"style="height: auto">
                            <form id="updateInterview" action="../../AddInterview" method="POST">

                                <div class="form-group col-sm-4">
                                    <label>Date</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="date" id="interviewDate" name="interviewDate" placeholder="Interview Date" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-sm-4">
                                    <label>Start Time</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="time" id="interStartTime" name="interStartTime"placeholder="Interview Start Time" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>


                                <div class="form-group col-sm-4">
                                    <label>Address</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="text" id="interAddress" name="interAddress"placeholder="Interview Address" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <!--            
                                <% String[] centers = {"Colombo", "Galle", "Kandy"}; %>
                                <div class="form-group col-sm-4">
                                    <label for="reg-center">District</label>
                                </div> 
                                <div class="form-group col-sm-8">                    
                                    <select class="form-control" id="interDistrict" name="interDistrict" required data-error="Must Select">
                                        <option value="" disabled selected hidden>- - Choose Registration District - -</option>
                                <%/*
                                     for (int i = 0; i < centers.length; i++) {
                                     out.write("<option value=' " + centers[i]  + "'>" + centers[i] + "</option>");
                                     }*/
                                %>
                            </select>
                            <div class="help-block with-errors"></div>
                        </div>
                                -->

                                <div class="form-group col-sm-4">
                                    <label>Number of Applicant</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="number" id="numberOfApplicant" name="numberOfApplicant" placeholder="Number of Applicant" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-sm-4">
                                    <label>Applicants Pre Hour</label>
                                </div>
                                <div class="form-group col-sm-8">
                                    <input type="number" id="applicantsPreHour" name="applicantsPreHour" placeholder="Applicants Pre Hour" required class="form-control" data-error="Can't be empty"/>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-default" >Add</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>

                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>




    </body>
</html>
