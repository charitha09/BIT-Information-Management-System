<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC Student Management System</title>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
        <script src="js/jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">WebSiteName</a>
                </div>
                <!--ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Page 1</a></li>
                    <li><a href="#">Page 2</a></li> 
                    <li><a href="#">Page 3</a></li> 
                </ul-->
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Pages/course-application-form.jsp"><span class="glyphicon glyphicon-user"></span> Apply Course</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
          </nav>
        </header>
        <jsp:include page="WEB-INF/includes/footer.jsp"/>
    </body>
</html>
