<%-- 
    Document   : selectCourses
    Created on : Jun 27, 2016, 3:31:42 PM
    Author     : nadeesh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Semester 1 Courses</title>
    </head>
    <body>
        <h1>Select Courses</h1>
        <strong>For repeat students</strong><br>
        asdsa das d asd asd asd asd sa dsa das das dsa dsa das d<br>
        zxc zxc zxc zxc zxc zxc z czc  xzc xzc   ere r ew rew r.<br><br>
        
        <strong>First time students</strong><br>
        asdadssa dasdsadas asdsadd asghjgd agjghjsd asd asd sa dsa dayuiyuis dyiuyas dsyuia dsa dayuiyuiuys d<br>
        zxgjhc zghjhgjxc zxghjghjc zyiyuixc zyiuyxc zyiuxc yiz cyizc  xzghjc xzghjhgjc yuiuyiere yuir yuiew rew yuir.<br><br>
        
        <strong>Learning Method</strong><br>
        qwqwew e qweqw eqw eqweqwe qwe eqw eqwe wqeqw eqwe.<br><br>
        dfg dfgdf gdf gd fgdf gd g x xcvcxv cassdas dasd sad asd.<br><br>
        
        <form action="selectCoursesServlet" method="POST" name="selectCourses">
            <table border="1" style="width:100%">
                
                <tr>
                    <td></td>  
                    <td><strong>Course Code</strong></td>
                    <td><strong>Course Name</strong></td>
                    <td><strong>Compulsory/Optional</strong></td>
                    <td><strong>Self Study</strong></td>
                    <td><strong>Private Tuition</strong></td>
                    <td><strong>Institute</strong></td>
                </tr>
                
                <tr>
                    <td><input type="checkbox" name="check1" value="EN1101"></td>  
                    <td>EN1001</td>
                    <td>Mathematics II</td>
                    <td>Compulsory</td>
                    <td><input type="radio" name="1" value="M001"></td>
                    <td><input type="radio" name="1" value="M002"></td>
                    <td><input type="radio" name="1" value="M003"></td>
                </tr>
                
                <tr>
                    <td><input type="checkbox" name="check2" value="EN1201"></td>  
                    <td>EN1002</td>
                    <td>Database II</td>
                    <td>Compulsory</td>
                    <td><input type="radio" name="2" value="M001"></td>
                    <td><input type="radio" name="2" value="M002"></td>
                    <td><input type="radio" name="2" value="M003"></td>
                </tr>
                
                <tr>
                    <td><input type="checkbox" name="check3" value="EN1301"></td>  
                    <td>EN1003</td>
                    <td>Middleware</td>
                    <td>Compulsory</td>
                    <td><input type="radio" name="3" value="M001"></td>
                    <td><input type="radio" name="3" value="M002"></td>
                    <td><input type="radio" name="3" value="M003"></td>
                </tr>
            </table>
            
            
<!--********************try this if you want to print the table using a loop*********************************-->
            <%/*
            Class.forName("com.mysql.jdbc.Driver");    
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/BIT_SMS","root","admin");
            Statement statement = connection.createStatement() ;
            ResultSet res = statement.executeQuery("select * from course"); 
            */%>

        <!--<TABLE BORDER="1">
            <tr>
                <td></td>  
                <td><strong>Course Code</strong></td>
                <td><strong>Course Name</strong></td>
                <td><strong>Compulsory/Optional</strong></td>
                <td><strong>Self Study</strong></td>
                <td><strong>Private Tuition</strong></td>
                <td><strong>Institute</strong></td>
            </tr>
            
            <% /*while(res.next()){ 
                int i=1;
                String check="check",j;
                j=Integer.toString(i);*/
            %>
                <TR>                    
                    <td><input type="checkbox" name="<%//check=check.concat(j);%>" value=j></td> 
                    <td> <%//res.getString(1) %></td>
                    <td> <%//res.getString(2) %></td>
                    <td> <%//res.getString(3) %></td>
                    <td><input type="radio" name="1" value="M001"></td>
                    <td><input type="radio" name="1" value="M002"></td>
                    <td><input type="radio" name="1" value="M003"></td>                    
                </TR>
            <% 
                //i++;
                //} 
            %>
        </TABLE>-->
<!--********************try this if you want to print the table using a loop*********************************-->
            
            
            
            
                
                <br><br>
                <input type="submit" value="Next">
        </form>
        
         <form action='selectSemester.jsp'>
            <input type="submit" value="Back">            
        </form>
        
        
        
    </body>
</html>
