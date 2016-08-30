<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.0.0/bootstrap-social.min.css">
        <link rel="stylesheet" href="../css/common-style.css">
        <link rel="stylesheet" href="../css/contact-us.css">
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
        <script src="../js/contact-us.js"></script>
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="../index.jsp"><img src="../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="../index.jsp">Home</a></li>
                    <li><a href="course-application-form.jsp">Apply Courses</a></li>
                    <li class="active"><a href="contact-us.jsp">Contact Us</a></li>  
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <!--Login Box-->
        <%@include file="../WEB-INF/includes/user-login-inside.jsp" %>
        <div class="container">
            <h2>Contact Us</h2>
            <div cla class="col-sm-6">
                <h3>External Degree Center</h3>
                <div class="col-sm-12">
                    <h4><i>Course Coordinator</i></h4>
                    <h5><b>Mr. L.P.Jayasinghe</b></h5>
                    <p>Coordinator,<br>External Degrees Centre of UCSC,<br>No 17, Swarna Road, Colombo 06.<br>(Opposite Havlock City).</p>
                    <p>Email:<a href="mailto:edc@ucsc.cmb.ac.lk">edc@ucsc.cmb.ac.lk</a></p>
                </div>
                <div class="col-sm-12">
                    <h4><i>Senior Assistant Registrar (EDC)</i></h4>
                    <h5><b>Ms. S.D.Chandralatha,</b></h5>
                    <p>Senior Assistant Registrar (EDC),<br>External Degrees Centre of UCSC,<br>No 17, Swarna Road, Colombo 06.<br>(Opposite Havlock City).</p>
                    <p>Email:<a href="saredc@ucsc.cmb.ac.lk">saredc@ucsc.cmb.ac.lk</a></p>
                </div>
            </div>
            <div cla class="col-sm-6">
                <h3>UCSC BIT</h3> 
                <div class="col-sm-12">
                    <h4><i>Academic Coordinator of BIT</i></h4>
                    <h5><b>Dr. H.A.Caldera</b></h5>
                    <p>Senior Lecturer,<br>UCSC Building Complex,<br>No,35 Reid Avnue, Colombo 07.</p>
                    <p>Email:<a href="mailto:edc@ucsc.cmb.ac.lk">edc@ucsc.cmb.ac.lk</a></p>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="col-sm-6">
                    <h3>External Degree Center Location</h3>
                    <div id="map-canvas-BIT" class="col-sm-12 map-box">

                    </div>
                </div>
                <div class="col-sm-6">
                    <h3>UCSC Building Complex Location</h3>
                    <div id="map-canvas-UCSC" class="col-sm-12 map-box">

                    </div>
                </div>
            </div>
        </div>
        <%@include file="../WEB-INF/includes/footer.jsp"%>
    </body>
</html>
