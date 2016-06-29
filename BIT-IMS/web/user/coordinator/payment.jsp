<%-- 
    Document   : addPaymentDetails
    Created on : Jun 29, 2016, 8:33:09 AM
    Author     : Hp
--%>

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
        
        <button type='button' class="btn btn-success" data-toggle='modal' data-target='#addRegistrationPayment'>Add Registration Payment</button>



        <!-- ======================================================== -->
        <div id="addRegistrationPayment" class="modal fade" role="dialog" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h2 class="modal-title" >Add Payment</h2>
                    </div>
                    <div class="modal-body ">

                        <form method="POST" action="../../AddPayment">
                            <div class="form-group col-sm-4">
                                <label for="reg-pammount">Application Number</label>
                            </div>
                            <div class="form-group col-sm-8">
                                <input type="text" id="paymentApplicationNum" name="paymentApplicationNum" placeholder="Amount You Paid" class="form-control" required data-error="Can't be empty"/>
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





    </body>
</html>
