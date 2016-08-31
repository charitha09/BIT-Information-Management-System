<%-- 
    Document   : admissionCard
    Created on : Jun 28, 2016, 11:53:00 AM
    Author     : nadeesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.0.0/bootstrap-social.min.css">
        <link rel="stylesheet" href="../css/common-style.css">
        <link rel="stylesheet" href="../css/exam.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application & Payment Voucher</title>
    </head>
    <body>
        <div class="container">
            <div class="col-sm-8">
                <h1>Application & Payment Voucher</h1>
                <div id="main-Caption" class="col-sm-12 index-box">
                    <form action="examApplicationServlet" method="POST" name="pdfDownloaderServlet">
                        <br><br>
                        <table  style="width:50%">
                            <tr>  
                                <td>Application</td>
                                <td width="20%"></td>
                                <td><input class="btn btn-success" type="submit" value="Download PDF"></td>
                            </tr>
                        </table>        
                    </form>

                    <form action="examApplicationServlet" method="POST" name="pdfDownloaderServlet">
                        <br><br>
                        <table  style="width:51%">
                            <tr>  
                                <td>Payment Voucher</td>
                                <td></td>
                                <td><input class="btn btn-success" type="submit" value="Download PDF"></td>
                            </tr>
                        </table>        
                    </form>
                </div>        
            </div>   
        </div>    
    </body>
</html>
