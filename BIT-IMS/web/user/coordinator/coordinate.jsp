<%@page import="com.ims.model.Student"%>
<%@page import="com.ims.model.Payment"%>
<%@page import="com.ims.model.Applicant"%>
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
        <link rel="stylesheet" href="../css/coordinator.css">
    </head>
    <body>       
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="../js/coordinator.js"></script>   
        <script src="../../js/student.js"></script>  
        <script src="../../js/payment.js"></script>
        <header>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="coordinate.jsp">Coordinate</a></li> 
                        <li><a href="settings.jsp">Setting</a></li>
                        <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="messageBegin.jsp">Messaging
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="messageForm.jsp">New Message</a></li>
                            <li><a href="msgReceive.jsp">Inbox</a></li> 
                            <li><a href="sendMsg.jsp">Outbox</a></li> 
                        </ul>
                    </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="container">
            <div class="col-sm-2 no-padding">
                <a id="Interview-window-navi" href="#Interview-window" class="list-group-item">
                    <i class="fa fa-comment-o"></i> Interview
                </a>  
                <a id="Applicant-window-navi" href="#Interview-Applicant" class="list-group-item">
                    <i class="fa fa-comment-o"></i> Applicant
                </a> 
                <a id="Student-window-navi" href="#Student" class="list-group-item">
                    <i class="fa fa-comment-o"></i> Students
                </a>
                <a id="Payment-window-navi" href="#Payment" class="list-group-item">
                    <i class="fa fa-comment-o"></i> Payments
                </a>
            </div>
            <div class="col-sm-10 no-padding" id="coordinator-pages">
                <div id="Interview-window">
                    <div class="col-sm-12 devbottom-line">
                        <div class="col-sm-10">
                            <h3>Interview</h3>
                        </div>
                        <div class="col-sm-2 droup-down-box">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tasks
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#addNewInterview" data-toggle='modal' data-target='#addNewInterview'>Add Interview</a></li>
                                    <li><a href="#viewAllUnallocatedApplicant" data-toggle='modal' data-target='#viewAllUnallocatedApplicant' onclick="viewAllUnallocatedApplicant()">Unallocated Students</a></li>  
                                </ul>
                            </div>                            
                        </div>                        
                    </div>                    
                    <div class="col-sm-12" id="ViewInterview">
                        <div class="col-sm-12 devbottom-line">
                            <h4>View Interview</h4>
                        </div>
                        <div class="col-sm-12 devbottom-line">
                            <div class="col-sm-2 no-padding"><h5>Interview ID</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Date</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Start Time</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Author</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Update</h5></div>
                            <div class="col-sm-2 no-padding"><h5>View applicant</h5></div>
                        </div>
                        <%
                            SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
                            Session s = sessionFactry.openSession();
                            //s.beginTransaction();
                            Query queryinterview = s.createQuery("FROM Interview");
                            List interviewList = queryinterview.list();

                            for (int i = 0; i < interviewList.size(); i++) {
                                Interview iv = new Interview();
                                iv = (Interview) interviewList.get(i);
                                out.write("<div class='col-sm-12 devbottom-line'>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + iv.getInterviewID() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + iv.getDate() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + iv.getStartTime() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + iv.getAuthor() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><button type='button' class='btn btn-default btn-sm' data-toggle='modal' data-target='#updateInterviewDetails' onclick=updateInterviewDetails('" + iv.getInterviewID() + "')><span class='glyphicon glyphicon-pencil'></span></button></div>");
                                out.write("<div class='col-sm-2 no-padding'><button type='button' class='btn btn-default btn-sm' data-toggle='modal' data-target='#viewAllocatedApplicant' onclick=viewAllocatedApplicant('" + iv.getInterviewID() + "')><span class='glyphicon glyphicon-new-window'></span></button></div>");
                                out.write("</div>");
                            }
                        %> 
                    </div>

                </div>  
                <div id="Applicant-window">
                    <div class="col-sm-12 devbottom-line">
                        <div class="col-sm-10">
                            <h3>Applicant</h3>
                        </div>
                        <div class="col-sm-2 droup-down-box">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tasks
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#searchApplicant" data-toggle='modal' data-target='#searchApplicant'>Search Applicant</a></li> 
                                </ul>
                            </div>                            
                        </div>                        
                    </div>                    
                    <div class="col-sm-12" id="ViewInterview">
                        <div class="col-sm-12 devbottom-line">
                            <h4>Applicant list</h4>
                        </div>
                        <div class="col-sm-12 devbottom-line">
                            <div class="col-sm-2 no-padding"><h5>Applicant ID</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Name</h5></div>
                            <div class="col-sm-2 no-padding"><h5>NIC Number</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Phone Number</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Email</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Address</h5></div>
                        </div>
                        <%
                            //s.beginTransaction();
                            Query queryApplicant = s.createQuery("FROM Applicant");
                            List applicantList = queryApplicant.list();

                            for (int i = 0; i < applicantList.size(); i++) {
                                Applicant applicant = new Applicant();
                                applicant = (Applicant) applicantList.get(i);
                                out.write("<div class='col-sm-12 devbottom-line'>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getApplicationNum() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getFullName() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getNicNo() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getTelephoneNumMob() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getEmail() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getAddress() + "</h6></div>");
                                out.write("</div>");
                            }

                        %>
                    </div>
                </div>
                <div id="Student-window">
                    <div class="col-sm-12 devbottom-line">
                        <div class="col-sm-10">
                            <h3>Student Details</h3>
                        </div>                        
                        <div class="col-sm-2 droup-down-box">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tasks
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#addStudent" data-toggle='modal' data-target='#addStudent'>Add Student</a></li>
                                    <li><a href="#searchStudent" data-toggle='modal' data-target='#searchStudent'>Search Student</a></li>  
                                </ul>
                            </div>                            
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-12 devbottom-line">
                            <div class="col-sm-2 no-padding"><h5>Student ID</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Name</h5></div>
                            <div class="col-sm-2 no-padding"><h5>NIC Number</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Phone Number</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Email</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Current Year</h5></div>
                        </div>
                        <%
                            Session ss3 = sessionFactry.openSession();
                            ss3.beginTransaction();
                            Query queryStudentDetails = ss3.createQuery("from Student");
                            List studentDetailList = queryStudentDetails.list();
                            for (int j = 0; j < studentDetailList.size(); j++) {

                                Student student = new Student();

                                student =  (Student)studentDetailList.get(j);

                                out.write("<div class='col-sm-12 devbottom-line'>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + student.getRegistrationNum() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + student.getFullName() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + student.getNicNo() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + student.getTelephoneNum() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + student.getEmail() + "</h6></div>");
                                out.write("<div class='col-sm-2 no-padding'><h6>" + student.getCurrentYear() + "</h6></div>");
                                out.write("</div>");
                            }
                            ss3.getTransaction().commit();
                            ss3.close();
                        %>
                    </div>
                </div>

                <div id="Payment-window">
                    <div class="col-sm-12 devbottom-line">
                        <div class="col-sm-10">
                            <h3>Payment Details</h3>
                        </div>               
                        <div class="col-sm-2 droup-down-box">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tasks
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#addPayment" data-toggle='modal' data-target='#addPayment'>Add Payment</a></li>
                                    <li><a href="#viewPayment" data-toggle='modal' data-target='#viewPayment'>View Payment</a></li>  
                                </ul>
                            </div>                            
                        </div>                        
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-12 devbottom-line">
                            <div class="col-sm-1 no-padding"><h5>Payment</h5></div>
                            <div class="col-sm-1 no-padding"><h5>ID</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Name</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Payment Type</h5></div>
                            <div class="col-sm-1 no-padding"><h5>Amount</h5></div>
                            <div class="col-sm-1 no-padding"><h5>Date</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Bank</h5></div>
                            <div class="col-sm-2 no-padding"><h5>Other</h5></div>
                        </div>
                        <% 
                            Session ss1 = sessionFactry.openSession();
                            ss1.beginTransaction();
                            Query queryAllPayment = ss1.createQuery("from Payment order by EnteredTimeStamp desc");
                            List allPaymentList = queryAllPayment.list();

                            for (int i = 0; i < allPaymentList.size(); i++) {
                                Payment payment = new Payment();
                                Applicant applicant = new Applicant();
                                Student student = new Student();

                                payment = (Payment) allPaymentList.get(i);
                                if (payment.getApplicationNumOrStudentID().contains("_A_")) {
                                    applicant = (Applicant) ss1.get(Applicant.class, payment.getApplicationNumOrStudentID());
                                    out.write("<div class='col-sm-12 devbottom-line'>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentID() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getApplicationNumOrStudentID() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + applicant.getFullName() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getPaymentType() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentAmmount() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentDate() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getExamID() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getPaymentBank() + "</h6></div>");
                                    out.write("</div>");
                                } else if (payment.getApplicationNumOrStudentID().contains("_S_")) {
                                    student = (Student) s.get(Student.class, payment.getApplicationNumOrStudentID());
                                    out.write("<div class='col-sm-12 devbottom-line'>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentID() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getApplicationNumOrStudentID() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + student.getFullName() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getPaymentType() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentAmmount() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentDate() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getExamID() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getPaymentBank() + "</h6></div>");

                                    out.write("</div>");
                                } else {
                                    out.write("<div class='col-sm-12 devbottom-line'>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentID() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getApplicationNumOrStudentID() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getPaymentType() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentAmmount() + "</h6></div>");
                                    out.write("<div class='col-sm-1 no-padding'><h6>" + payment.getPaymentDate() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getExamID() + "</h6></div>");
                                    out.write("<div class='col-sm-2 no-padding'><h6>" + payment.getPaymentBank() + "</h6></div>");
                                    out.write("</div>");

                                }

                            }
                            ss1.getTransaction().commit();
                            ss1.close();
                       %>
                    </div>
                </div>
            </div>            
        </div>
        <!--Pop Ups-->
        <!--Interview Page-->
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

        <!--Applicant Page-->
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

                        <button type='button' class="btn btn-info col-sm-12" data-toggle='modal' data-target='#searchByApplicationNumber'><span class="glyphicon glyphicon-search"></span> By Application Number</button> <br/><br/>
                        <button type='button' class="btn btn-info col-sm-12" data-toggle='modal' data-target='#searchByNicNumber'><span class="glyphicon glyphicon-search"></span>By NIC Number</button> <br/><br/>

                    </div>
                </div>
            </div>
        </div>

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

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByApplicationNum()"><span class="glyphicon glyphicon-search"></span> Search</button>

                        <div id="searchApplicationNumOutput"></div>


                    </div>
                </div>
            </div>
        </div>

        <!-- Search By NIC Number -->
        <div id="searchByNicNumber" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close col-sm-12" data-dismiss="modal">&times;</button>
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

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByNICNum()"><span class="glyphicon glyphicon-search"></span> Search</button>

                        <div id="searchNICNumOutput"></div>


                    </div>
                </div>
            </div>
        </div>

        <!--Student Page-->
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

        <!--Payment Page-->
        <!-- Add Payment -->
        <div id="addPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addApplicationPayment'>Add Application Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addRegistrationPayment'>Add Registration Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addExamPayment'>Add Examination Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addOtherPayment'>Add Other Payment</button> <br/><br/>
                    </div>
                </div>
            </div>
        </div>

        <!-- View Payment -->
        <div id="viewPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >View Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <!-- <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewAllPayment'>View All Payment</button> <br/><br/>-->
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#searchPayment'>Search Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewApplicationPayment'>View Application Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewRegistrationPayment'>View Registration Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewExamPayment'>View Examination Payment</button> <br/><br/>

                        <!-- <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addApplicationPayment'>Add Application Payment</button>
                        -->


                    </div>
                </div>
            </div>
        </div>

        <!-- Add Application Payment -->

        <div id="addApplicationPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Application Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <form method="POST" action="../../AddPayment">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Application Number</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentApplicationNum" name="paymentApplicationNumOrStudentID" placeholder="Application Number" class="form-control" required data-error="Can't be empty" onblur="checkApplicantInDB(this.value)"/>
                                <div id="applicationNunErr" class="help-block with-errors"></div>
                            </div>

                            <input type="hidden" value="Application_Payment" id="paymentType" name="paymentType"/>

                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Amount Paid (RS)</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentAmount" name="paymentAmount" placeholder="Amount You Paid" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-bank">Name of Payee Bank</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="text" id="paymentBank" name="paymentBank" placeholder="Bank You Paid" required data-error="Can't be empty" class="form-control"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-pdate">Date Paid</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="date" id="paymentDate" name="paymentDate" placeholder="Date You Paid" required class="form-control" data-error="Empty or invalied Date try YYYY-MM-DD format" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"/>
                                <div class="help-block with-errors"></div>
                            </div>

                            <button type="submit" class="btn btn-default" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </form>


                    </div>
                </div>
            </div>
        </div>

        <!-- Add Registration Payment -->

        <div id="addRegistrationPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Registration Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <form method="POST" action="../../AddPayment">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Student ID</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="RegistrationpaymentApplicationNumOrStudentID" name="paymentApplicationNumOrStudentID" placeholder="Student ID" class="form-control" required data-error="Can't be empty" onblur="checkStudentInDB(this.value)"/>
                                <div  id="RegistrationstudentIDErr" class="help-block with-errors"></div>
                            </div>

                            <input type="hidden" value="Registration_Payment" id="paymentType" name="paymentType"/>

                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Amount Paid (RS)</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentAmount" name="paymentAmount" placeholder="Amount You Paid" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-bank">Name of Payee Bank</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="text" id="paymentBank" name="paymentBank" placeholder="Bank You Paid" required data-error="Can't be empty" class="form-control"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-pdate">Date Paid</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="date" id="paymentDate" name="paymentDate" placeholder="Date You Paid" required class="form-control" data-error="Empty or invalied Date try YYYY-MM-DD format" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"/>
                                <div class="help-block with-errors"></div>
                            </div>

                            <button type="submit" class="btn btn-default" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </form>


                    </div>
                </div>
            </div>
        </div>

        <!-- Add Examination Payment -->
        <div id="addExamPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Examination Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <form method="POST" action="../../AddPayment">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Student ID</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="ExampaymentApplicationNumOrStudentID" name="paymentApplicationNumOrStudentID" placeholder="Student ID" class="form-control" required data-error="Can't be empty"onblur="checkStudentInDB(this.value)"/>
                                <div  id="ExamstudentIDErr" class="help-block with-errors"></div>
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Examination ID</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="examID" name="examID" placeholder="Examination ID" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
                            </div>

                            <input type="hidden" value="Examination_Payment" id="paymentType" name="paymentType"/>

                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Amount Paid (RS)</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentAmount" name="paymentAmount" placeholder="Amount You Paid" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-bank">Name of Payee Bank</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="text" id="paymentBank" name="paymentBank" placeholder="Bank You Paid" required data-error="Can't be empty" class="form-control"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-pdate">Date Paid</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="date" id="paymentDate" name="paymentDate" placeholder="Date You Paid" required class="form-control" data-error="Empty or invalied Date try YYYY-MM-DD format" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"/>
                                <div class="help-block with-errors"></div>
                            </div>

                            <button type="submit" class="btn btn-default" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </form>


                    </div>
                </div>
            </div>
        </div>

        <!-- Add Other Payment -->
        <div id="addOtherPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Other Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <form method="POST" action="../../AddPayment">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Student ID</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="OtherpaymentApplicationNumOrStudentID" name="paymentApplicationNumOrStudentID" placeholder="Student ID" class="form-control" required data-error="Can't be empty" onblur="checkStudentInDB(this.value)"/>
                                <div id="OtherstudentIDErr" class="help-block with-errors"></div>
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Payment Type</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentType" name="paymentType" placeholder="Payment Type" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
                            </div>

                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Amount Paid (RS)</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentAmount" name="paymentAmount" placeholder="Amount You Paid" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-bank">Name of Payee Bank</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="text" id="paymentBank" name="paymentBank" placeholder="Bank You Paid" required data-error="Can't be empty" class="form-control"/>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <label for="reg-pdate">Date Paid</label>
                            </div> 
                            <div class="form-group col-sm-8">                    
                                <input type="date" id="paymentDate" name="paymentDate" placeholder="Date You Paid" required class="form-control" data-error="Empty or invalied Date try YYYY-MM-DD format" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"/>
                                <div class="help-block with-errors"></div>
                            </div>

                            <button type="submit" class="btn btn-default" >Submit</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- View All Payment -->
        <div id="viewAllPayment" class="modal" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >View All Payment</h2>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- View Application Payment -->
        <div id="viewApplicationPayment" class="modal" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >View Application Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Payment</th>
                                    <th>Application Number</th>
                                    <th>Name</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Bank</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Session s1 = sessionFactry.openSession();
                                    s1.beginTransaction();
                                    Query queryApplicationPayment = s1.createQuery("from Payment WHERE paymentType='Application_Payment' order by EnteredTimeStamp desc");
                                    List applicationPaymentList = queryApplicationPayment.list();

                                    for (int j = 0; j < applicationPaymentList.size(); j++) {
                                        Payment payment = new Payment();
                                        Applicant applicant = new Applicant();

                                        payment = (Payment) applicationPaymentList.get(j);

                                        applicant = (Applicant) s1.get(Applicant.class, payment.getApplicationNumOrStudentID());
                                        out.write("<tr>");
                                        out.write("<td>" + payment.getPaymentID() + "</td>");
                                        out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                        out.write("<td>" + applicant.getFullName() + "<td>");
                                        out.write("<td>" + payment.getPaymentAmmount() + "</td>");
                                        out.write("<td>" + payment.getPaymentDate() + "</td>");
                                        out.write("<td>" + payment.getPaymentBank() + "</td>");

                                        out.write("</tr>");

                                    }
                                    s1.getTransaction().commit();
                                    s1.close();
                                %>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- View Registration Payment -->
        <div id="viewRegistrationPayment" class="modal" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >View Registration Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Payment</th>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Bank</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Session s2 = sessionFactry.openSession();
                                    s2.beginTransaction();
                                    Query queryRegistrationPayment = s2.createQuery("from Payment WHERE paymentType='Registration_Payment' order by EnteredTimeStamp desc");
                                    List registrationPaymentList = queryRegistrationPayment.list();
                                    for (int j = 0; j < registrationPaymentList.size(); j++) {
                                        Payment payment = new Payment();
                                        Student student = new Student();

                                        payment = (Payment) registrationPaymentList.get(j);

                                        student = (Student) s2.get(Student.class, payment.getApplicationNumOrStudentID());
                                        out.write("<tr>");
                                        out.write("<td>" + payment.getPaymentID() + "</td>");
                                        out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                        out.write("<td>" + student.getFullName() + "<td>");
                                        out.write("<td>" + payment.getPaymentAmmount() + "</td>");
                                        out.write("<td>" + payment.getPaymentDate() + "</td>");
                                        out.write("<td>" + payment.getPaymentBank() + "</td>");

                                        out.write("</tr>");

                                    }
                                    s2.getTransaction().commit();
                                    s2.close();
                                %>


                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- View Exam Payment -->
        <div id="viewExamPayment" class="modal" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >View Examination Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Payment</th>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Amount</th>
                                    <th>Exam ID</th>
                                    <th>Date</th>
                                    <th>Bank</th>

                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    Session s3 = sessionFactry.openSession();
                                    s3.beginTransaction();
                                    Query queryExamPayment = s3.createQuery("from Payment WHERE paymentType='Examination_Payment' order by EnteredTimeStamp desc");
                                    List examPaymentList = queryExamPayment.list();
                                    for (int j = 0; j < examPaymentList.size(); j++) {
                                        Payment payment = new Payment();
                                        Student student = new Student();

                                        payment = (Payment) examPaymentList.get(j);

                                        student = (Student) s3.get(Student.class, payment.getApplicationNumOrStudentID());
                                        out.write("<tr>");
                                        out.write("<td>" + payment.getPaymentID() + "</td>");
                                        out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                        out.write("<td>" + student.getFullName() + "<td>");
                                        out.write("<td>" + payment.getPaymentAmmount() + "</td>");
                                        out.write("<td>" + payment.getExamID() + "</td>");
                                        out.write("<td>" + payment.getPaymentDate() + "</td>");
                                        out.write("<td>" + payment.getPaymentBank() + "</td>");

                                        out.write("</tr>");

                                    }
                                    s3.getTransaction().commit();
                                    s3.close();
                                %>


                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- Search Payment -->
        <div id="searchPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByPaymentID'><span class="glyphicon glyphicon-search"></span> By Payment ID</button> <br/><br/>
                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByStudentID'><span class="glyphicon glyphicon-search"></span>By Student ID</button> <br/><br/>
                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByApplicationNumber'><span class="glyphicon glyphicon-search"></span>By Application Number</button> <br/><br/>
                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchByExamID'><span class="glyphicon glyphicon-search"></span>By Exam ID</button> <br/><br/>
                        <button type='button' class="btn btn-info" data-toggle='modal' data-target='#searchBypaymentType'><span class="glyphicon glyphicon-search"></span>By payment Type</button> <br/><br/>

                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- Search By Payment ID -->
        <div id="searchByPaymentID" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search By Payment ID</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Payment ID</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchPaymentID" name="searchPaymentID" placeholder="Payment ID" class="form-control" />
                            <div id="searchPaymentIDErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByPaymentID()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchPaymentIDOutput"></div>


                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- Search By Student ID -->
        <div id="searchByStudentID" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search By Student ID</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Student ID</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchStudentID" name="searchStudentID" placeholder="Student ID" class="form-control" />
                            <div id="searchStudentIDErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByStudentID()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchStudentIDOutput"></div>


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
                        <h2 class="modal-title" >Search By Application Number</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Application Number</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchApplicationNumber" name="searchApplicationNumber" placeholder="Application Number" class="form-control" />
                            <div id="searchApplicationNumberErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByApplicationNumber()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchApplicationNumberOutput"></div>


                    </div>
                </div>
            </div>
        </div>


        <!-- ======================================================== -->
        <!-- Search By Exam ID -->
        <div id="searchByExamID" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search By Exam ID</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Exam ID</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchExamID" name="searchExamID" placeholder="Exam ID" class="form-control" />
                            <div id="searchExamIDErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByExamID()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchExamIDOutput"></div>


                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
        <!-- Search By Payment Type -->
        <div id="searchBypaymentType" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Search By Payment Type</h2>
                    </div>
                    <div class="modal-body ">

                        <div class="form-group col-sm-4">
                            <label for="reg-pammount">Payment Type</label>
                        </div>

                        <div class="form-group col-sm-8">
                            <input type="text" id="searchpaymentType" name="searchpaymentType" placeholder="Payment Type" class="form-control" />
                            <div id="searchpaymentTypeErr" class="help-block with-errors"></div>
                        </div>

                        <button type='button' class="btn btn-info btn-lg" onclick="searchByPaymentType()"><span class="glyphicon glyphicon-search"></span> Search</button> <br/><br/>

                        <div id="searchpaymentTypeOutput"></div>


                    </div>
                </div>
            </div>
        </div>

    </body>
</html>