<%-- 
    Document   : News
    Created on : Aug 29, 2016, 11:10:17 PM
    Author     : Amila Sankhax
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
        <script src="../../js/payment.js"></script>   
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
                        <li><a href="news.jsp">News</a></li>
                        <li><a href="settings.jsp">Setting</a></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                        <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <h1>News</h1>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addNews'>Add New News</button>


        <!-- ======================================================== -->
        <!-- Add News -->
        <div id="addNews" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add News</h2>
                    </div>
                    <div class="modal-body ">
                        
                        <form method="POST" action="../../AddNews">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Title</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="newsTitle" name="newsTitle" placeholder="News Title" class="form-control" required data-error="Can't be empty"   />
                                <div id="applicationNunErr" class="help-block with-errors"></div>
                            </div>

                  
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">News</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="news" name="news" placeholder="News" class="form-control "  required data-error="Can't be empty"/>
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

                        


                    </div>
                </div>
            </div>
        </div>

        <!-- ======================================================== -->
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


        <!-- ======================================================== -->
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


        <!-- ======================================================== -->
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


        <!-- ======================================================== -->
        <!-- View All Payment -->
        <div id="viewAllPayment" class="modal" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >View All Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Payment</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Payment Type</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Bank</th>
                                    <th>Other</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
                                    Session s = sessionFactry.openSession();
                                    s.beginTransaction();
                                    Query queryAllPayment = s.createQuery("from Payment order by EnteredTimeStamp desc");
                                    List allPaymentList = queryAllPayment.list();

                                    for (int i = 0; i < allPaymentList.size(); i++) {
                                        Payment payment = new Payment();
                                        Applicant applicant = new Applicant();
                                        Student student = new Student();

                                        payment = (Payment) allPaymentList.get(i);
                                        if (payment.getApplicationNumOrStudentID().contains("_A_")) {
                                            applicant = (Applicant) s.get(Applicant.class, payment.getApplicationNumOrStudentID());
                                            out.write("<tr>");
                                            out.write("<td>" + payment.getPaymentID() + "</td>");
                                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                            out.write("<td>" + applicant.getFullName() + "<td>");
                                            out.write("<td>" + payment.getPaymentType() + " </td>");
                                            out.write("<td>" + payment.getPaymentAmmount() + " </td>");
                                            out.write("<td>" + payment.getPaymentDate() + " </td>");
                                            out.write("<td>" + payment.getExamID() + " </td>");
                                            out.write("<td>" + payment.getPaymentBank() + " </td>");

                                            out.write("</tr>");
                                        } else if (payment.getApplicationNumOrStudentID().contains("_S_")) {
                                            student = (Student) s.get(Student.class, payment.getApplicationNumOrStudentID());
                                            out.write("<tr>");
                                            out.write("<td>" + payment.getPaymentID() + "</td>");
                                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                            out.write("<td>" + student.getFullName() + "<td>");
                                            out.write("<td>" + payment.getPaymentType() + " </td>");
                                            out.write("<td>" + payment.getPaymentAmmount() + " </td>");
                                            out.write("<td>" + payment.getPaymentDate() + " </td>");
                                            out.write("<td>" + payment.getExamID() + " </td>");
                                            out.write("<td>" + payment.getPaymentBank() + " </td>");

                                            out.write("</tr>");
                                        } else {
                                            out.write("<tr>");
                                            out.write("<td>" + payment.getPaymentID() + "</td>");
                                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                            out.write("<td>" + "<td>");
                                            out.write("<td>" + payment.getPaymentType() + " </td>");
                                            out.write("<td>" + payment.getPaymentAmmount() + " </td>");
                                            out.write("<td>" + payment.getPaymentDate() + " </td>");
                                            out.write("<td>" + payment.getExamID() + " </td>");
                                            out.write("<td>" + payment.getPaymentBank() + " </td>");
                                            out.write("</tr>");

                                        }

                                    }
                                    s.getTransaction().commit();
                                    s.close();
                                %>


                            </tbody>
                        </table>

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






