<%-- 
    Document   : addPaymentDetails
    Created on : Jun 29, 2016, 8:33:09 AM
    Author     : Hp
--%>

<%@page import="com.ims.model.Student"%>
<%@page import="com.ims.model.Applicant"%>
<%@page import="com.ims.model.Payment"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
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
        <h1>Payment Details</h1>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addPayment'>Add Payment</button>

        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewPayment'>View Payment</button>


        <!-- ======================================================== -->
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


        <!-- ======================================================== -->
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

                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewAllPayment'>View All Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#searchPayment'>Search Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewApplicationPayment'>View Application Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewRegistrationPayment'>View Registration Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewExamPayment'>View Examination Payment</button> <br/><br/>
                        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#viewOtherPayment'>View Other Payment</button> <br/><br/>

                        <!-- <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addApplicationPayment'>Add Application Payment</button>
                        -->

                        View Payment

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

                        <form method="POST" action="../../AddPayment">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Application Number</label>
                            </div>

                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentApplicationNum" name="paymentApplicationNumOrStudentID" placeholder="Application Number" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
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
                                <input type="text" id="paymentApplicationNum" name="paymentApplicationNumOrStudentID" placeholder="Student ID" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
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
                                <input type="text" id="paymentApplicationNum" name="paymentApplicationNumOrStudentID" placeholder="Student ID" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
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
                                <input type="text" id="paymentApplicationNum" name="paymentApplicationNumOrStudentID" placeholder="Student ID" class="form-control" required data-error="Can't be empty"/>
                                <div class="help-block with-errors"></div>
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
                                            out.write("<td>"+ payment.getPaymentType() +" </td>");
                                            out.write("<td>"+ payment.getPaymentAmmount() +" </td>");
                                            out.write("<td>"+ payment.getPaymentDate() +" </td>");
                                            out.write("<td>"+ payment.getExamID()+" </td>");
                                            out.write("<td>"+ payment.getPaymentBank()+" </td>");
                                            
                                            out.write("</tr>");
                                        }else if (payment.getApplicationNumOrStudentID().contains("_S_")) {
                                            student= (Student) s.get(Student.class, payment.getApplicationNumOrStudentID());
                                            out.write("<tr>");
                                            out.write("<td>" + payment.getPaymentID() + "</td>");
                                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                            out.write("<td>" + student.getFullName() + "<td>");
                                            out.write("<td>"+ payment.getPaymentType() +" </td>");
                                            out.write("<td>"+ payment.getPaymentAmmount() +" </td>");
                                            out.write("<td>"+ payment.getPaymentDate() +" </td>");
                                            out.write("<td>"+ payment.getExamID()+" </td>");
                                            out.write("<td>"+ payment.getPaymentBank()+" </td>");
                                            
                                            out.write("</tr>");
                                        }else{
                                            out.write("<tr>");
                                            out.write("<td>" + payment.getPaymentID() + "</td>");
                                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                                            out.write("<td>" + "<td>");
                                            out.write("<td>"+ payment.getPaymentType() +" </td>");
                                            out.write("<td>"+ payment.getPaymentAmmount() +" </td>");
                                            out.write("<td>"+ payment.getPaymentDate() +" </td>");
                                            out.write("<td>"+ payment.getExamID()+" </td>");
                                            out.write("<td>"+ payment.getPaymentBank()+" </td>");
                                            out.write("</tr>");
                                            
                                        }

                                       
                                    }
                                %>


                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>







    </body>
</html>





