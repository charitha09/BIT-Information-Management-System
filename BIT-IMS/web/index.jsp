<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC Student Management System</title>
        <link rel="stylesheet" type="text/css" href="style/common-style.css">
        <link rel="stylesheet" type="text/css" href="style/index.css">
    </head>
    <body>
        <script type="text/javascript" src="js/jquery-1.12.2.min.js"></script>
        <script type="text/javascript" src="js/common-script.js"></script>
        <script type="text/javascript" src="js/index-script.js"></script>
        <header>
            <div id="logo">
                <a href="index.jsp"><img src="images/logo.png" alt="UCSC"/></a>
            </div>
            <ul class="navi-items">
                <li><a href="index.jsp"><img src="images/logo.png" alt="UCSC"/></a></li>
                <li><a href="#home">Login</a></li>
                <li><a href="Pages/pub-student-registration-form.jsp">Register</a></li>
                <li id="toggle-btn">
                    <a href="javascript:void(0);" onclick="myFunction()">&#9776;</a>
                </li>
            </ul>
        </header>
        <jsp:include page="WEB-INF/includes/footer.jsp"/>
    </body>
</html>
