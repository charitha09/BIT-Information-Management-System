<%-- 
    Document   : xam
    Created on : Aug 30, 2016, 3:01:09 PM
    Author     : Charith
--%>

<%@ page import="java.sql.*" %>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.0.0/bootstrap-social.min.css">
        <link rel="stylesheet" href="../css/common-style.css">
        <link rel="stylesheet" href="../css/exam.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hall Allocation</title>
    </head>
    <body>
        <div class="container"
             <div class="col-sm-8">         
                <h1>Hall allocation for examination </h><br>
                    <table class="table table-striped tbl" border="1" style="width:100%">
                        <tr><th>Semester ID</th>
                            <th>District Code</th>
                            <th>Course Code</th>
                            <th>Capacity</th>
                        </tr>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bit_sms", "root", "");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from course_capacity ");
                            //--SELECT dis_name FROM exam_dis JOIN course_capacity ON course_capacity.dis_code=exam_dis.dis_code--
                            //select * from course_capacity JOIN exam_dis ON course_capacity.dis_code=exam_dis.dis_code JOIN course ON course_capacity.course_code=course.course_code

                            while (rs.next()) {
                                String SemID = rs.getString("sem_id");
                                String DisCode = rs.getString("dis_code");
                                // String Dis = rs.getString("dis_name");
                                String CourseCode = rs.getString("course_code");
                                int Capacity = rs.getInt("capacity");
                        %>
                        <tr>
                            <td><b><font color='#663300'><%=SemID%></font></b></td>
                            <td><b><font color='#663300'><%=DisCode%></font></b></td>
                            <td><b><font color='#663300'><%=CourseCode%></font></b></td>
                            <td><b><font color='#663300'><%=Capacity%></font></b></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
            </div>
        </div>
    </body>
</html>