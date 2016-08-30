<%-- 
    Document   : selectSemester
    Created on : Jun 27, 2016, 3:23:48 PM
    Author     : nadeesh
--%>

<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.util.Calendar"%>
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
        <title>Select Semester</title>
    </head>
    
    <body>
        <div class="container">
            <div class="col-sm-8">
                <h1>Select Semester</h1>
                Please select the semester.<br><br>



                <form action='selectSemesterServlet' method='POST' name='selectSemester'>
                    <%
                    /*
                    out.write("********************<br>");
                    Calendar now = Calendar.getInstance();
                    out.write("Current Year is : " + now.get(Calendar.YEAR)+"<br>");
                    // month start from 0 to 11
                    out.write("Current Month is : " + (now.get(Calendar.MONTH) + 1)+"<br>");
                    int month=now.get(Calendar.MONTH+1);
                    out.write("Current Date is : " + now.get(Calendar.DATE)+"<br>");
                    int date=now.get(Calendar.DATE+1);
                    out.write("********************<br>");
                    out.write("<br><br>");
                    */
                    %>   



                    <input type="radio" name="semester" value="S001" id="1">Semester 1<br>
                    <input type="radio" name="semester" value="S002" id="2">Semester 2<br>
                    <input type="radio" name="semester" value="S003" id="3">Semester 3<br>
                    <input type="radio" name="semester" value="S004" id="4">Semester 4<br>
                    <input type="radio" name="semester" value="S005" id="5">Semester 5<br>
                    <input type="radio" name="semester" value="S006" id="6">Semester 6<br><br>
               
                    <div id="main-Caption" class="col-sm-12 index-box">
                        <strong>Note:<br><br></strong>Please note that, if you are applying for more than one examination(eg.Sem1,Sem3,Sem5), payments must be made with separate bank vouchers for each of those semester examinations and separate applications must be filled up.<br><br>
                    </div>        

                    <script>
                        var date = new Date();
                        var month = date.getMonth();
                        if(month>6){
                            document.getElementById("1").disabled=true;
                            document.getElementById("3").disabled=true;
                            document.getElementById("5").disabled=true;
                        }
                        else{
                            document.getElementById("2").disabled=true;
                            document.getElementById("4").disabled=true;
                            document.getElementById("6").disabled=true;
                        }
                    </script>
                        
                    
                    <input class="btn btn-success"  type="submit" value="Next">


                </form>

                <form action='selectExamCenter.jsp'>
                    <input type="submit" value="Back">            
                </form>
            </div> 
        </div>
                    
    </body>
    
</html>
