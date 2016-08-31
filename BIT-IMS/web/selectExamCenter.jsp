<%-- 
    Document   : selectExamCenter
    Created on : Jun 27, 2016, 2:42:35 PM
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
        <title>Select Exam Center</title>
        
    </head>

    <body>
        <div class="container">
            <div class="col-sm-8">
                 
                <h1>Select Exam Center</h1>
                Please select suitable district/location for the examinations.<br><br>

                
                <form action='selectExamCenterServlet' method='POST' name='selectExamCenter'>
                    <div class="form-group slctcenter">        
                        <input class="radio-inline" type="radio" name="examCenter" value="D001">Colombo 
                        <input class="radio-inline" type="radio" name="examCenter" value="D002"> Galle
                        <input class="radio-inline" type="radio" name="examCenter" value="D003"> Kandy
                        <input class="radio-inline" type="radio" name="examCenter" value="D004"> Jaffna<br><br>
                        <div id="main-Caption" class="col-sm-12 index-box">
                            <strong>Note:</strong>Please note that, if your choice isn't available, you'll be assigned to the <strong>Colombo exam center.</strong><br><br>
                        </div>
                        
                        <input class="btn btn-success" type="submit" value="Next">
                    </div>    
                </form>
                
                
                <form action='user/student/index.jsp'>
                    <div class="form-group slctcenter">
                        <input class="btn btn-default" type="submit" value="Back">            
                    </div>    
                </form>      
            </div>    
        </div>     
        <!-- footer -->
    </body>

</html>
