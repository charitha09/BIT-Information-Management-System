<%-- 
    Document   : selectSemester1Courses
    Created on : Aug 3, 2016, 10:32:30 PM
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
        <title>Select Semester 1 Courses</title>
    </head>
    <body>
        <div class="container">
            <div class="col-sm-12">
                <h1>Select Semester 1 Courses</h1>
                <div id="main-Caption" class="col-sm-12 index-box">
                    <strong>For repeat students</strong><br>
                    Please note that, you cannot apply for any courses that you have already passed subjects (obtained grades A,B or C).<br> 
                    Check your online examination results (year comment) for what courses you need to repeat.<br><br>
                
                    <strong>First time students</strong><br>
                    No need for apply for all courses at a time. Because you have any numbers of attempts and if you sit for an examination that course will be counted as an attempt.<br><br>
                
                    <strong>Learning Method</strong><br>
                    You must select the one of the learning method (Self Study/Private Tuition/Institute)<br><br>
                    If you studied at an institute for the following related course(s), please select <strong>"Institute"</strong> for the learning method.<br><br>
                </div>        

                <table class="table table-striped tbl" border="2" style="width:60%">
                        
                        <tr>
                            <td></td>  
                            <td><strong>1</strong></td>
                            <td><strong>2</strong></td>
                            <td><strong>3</strong></td>
                            <td><strong>4</strong></td>
                            <td><strong>5</strong></td>
                            <td><strong>6</strong></td>
                        </tr>
                        
                        <tr>
                            <td><strong>Institute Name</strong></td>  
                            <td>Institute 1</td>
                            <td>Institute 2</td>
                            <td>Institute 3</td>
                            <td>Institute 4</td>
                            <td>Institute 5</td>
                            <td>Other</td>
                        </tr>
                        
                        
                </table>
                <br>



                <form action="selectCoursesServlet" method="POST" name="selectSemester1Courses">
                    <table class="table table-striped tbl" border="2" style="width:100%">
                        <tr>
                            <td></td>  
                            <td><strong>Course Code</strong></td>
                            <td><strong>Course Name</strong></td>
                            <td><strong>Compulsory/Optional</strong></td>
                            <td><strong>Self Study</strong></td>
                            <td><strong>Private Tuition</strong></td>
                            <td><strong>Institute ( 1 2 3 4 5 6 )</strong></td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="check1" value="IT1105"></td>  
                            <td>IT1105</td>
                            <td>Information Systems & Technology</td>
                            <td>Compulsory</td>
                            <td><input type="radio" name="1" value="M001"></td>
                            <td><input type="radio" name="1" value="M002"></td>
                            <!--<td><input type="radio" name="1" value="M003"></td>-->
                            <td>
                                <input type="radio" name="1" value="I001"> 
                                <input type="radio" name="1" value="I002"> 
                                <input type="radio" name="1" value="I003"> 
                                <input type="radio" name="1" value="I004"> 
                                <input type="radio" name="1" value="I005"> 
                                <input type="radio" name="1" value="I006"> 
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="check2" value="IT1205"></td>  
                            <td>IT1205</td>
                            <td>Computer Systems</td>
                            <td>Compulsory</td>
                            <td><input type="radio" name="2" value="M001"></td>
                            <td><input type="radio" name="2" value="M002"></td>
                            <!--<td><input type="radio" name="2" value="M003"></td>-->
                            <td>1=>
                                <input type="radio" name="2" value="I001">2=> 
                                <input type="radio" name="2" value="I002">3=> 
                                <input type="radio" name="2" value="I003">4=> 
                                <input type="radio" name="2" value="I004">5=> 
                                <input type="radio" name="2" value="I005">6=> 
                                <input type="radio" name="2" value="I006"> 
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="check3" value="IT1305"></td>  
                            <td>IT1305</td>
                            <td>Web Application Development I</td>
                            <td>Compulsory</td>
                            <td><input type="radio" name="3" value="M001"></td>
                            <td><input type="radio" name="3" value="M002"></td>
                            <!--<td><input type="radio" name="3" value="M003"></td>-->
                            <td>1=>
                                <input type="radio" name="3" value="I001">2=> 
                                <input type="radio" name="3" value="I002">3=> 
                                <input type="radio" name="3" value="I003">4=> 
                                <input type="radio" name="3" value="I004">5=> 
                                <input type="radio" name="3" value="I005">6=> 
                                <input type="radio" name="3" value="I006"> 
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="check4" value="EN1101"></td>  
                            <td>EN1101</td>
                            <td>Communication Skills</td>
                            <td>Compulsory</td>
                            <td><input type="radio" name="4" value="M001"></td>
                            <td><input type="radio" name="4" value="M002"></td>
                            <!--<td><input type="radio" name="4" value="M003"></td>-->
                            <td>1=>
                                <input type="radio" name="4" value="I001">2=> 
                                <input type="radio" name="4" value="I002">3=> 
                                <input type="radio" name="4" value="I003">4=> 
                                <input type="radio" name="4" value="I004">5=> 
                                <input type="radio" name="4" value="I005">6=> 
                                <input type="radio" name="4" value="I006"> 
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="check5" value="EN1201"></td>  
                            <td>EN1201</td>
                            <td>Introductory Mathematics</td>
                            <td>Compulsory</td>
                            <td><input type="radio" name="5" value="M001"></td>
                            <td><input type="radio" name="5" value="M002"></td>
                            <!--<td><input type="radio" name="5" value="M003"></td>-->
                            <td>1=>
                                <input type="radio" name="5" value="I001">2=> 
                                <input type="radio" name="5" value="I002">3=> 
                                <input type="radio" name="5" value="I003">4=> 
                                <input type="radio" name="5" value="I004">5=>
                                <input type="radio" name="5" value="I005">6=> 
                                <input type="radio" name="5" value="I006"> 
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" name="check6" value="EN1301"></td>  
                            <td>EN1301</td>
                            <td>Personal Computing</td>
                            <td>Compulsory</td>
                            <td><input type="radio" name="6" value="M001"></td>
                            <td><input type="radio" name="6" value="M002"></td>
                            <!--<td><input type="radio" name="6" value="M003"></td>-->
                            <td>1=>
                                <input type="radio" name="6" value="I001">2=>
                                <input type="radio" name="6" value="I002">3=> 
                                <input type="radio" name="6" value="I003">4=> 
                                <input type="radio" name="6" value="I004">5=>
                                <input type="radio" name="6" value="I005">6=>
                                <input type="radio" name="6" value="I006"> 
                            </td>
                        </tr>
                    </table>




                        <input class="btn btn-default" type="reset"/>

                        <br><br>
                        <input class="btn btn-success" type="submit" value="Next">
                </form>

                 <form action='selectSemester.jsp'>
                    <input class="btn btn-default" type="submit" value="Back">            
                </form>
            </div>    
        </div>
        
    </body>
</html>
