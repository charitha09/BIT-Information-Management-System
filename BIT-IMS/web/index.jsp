<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC SMS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="css/common-style.css">
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.cycle2/2.1.6/jquery.cycle2.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="js/common-public.js"></script>
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Page 1</a></li>
                    <li><a href="Pages/course-application-form.jsp">Apply Course</a></li> 
                    <li><a href="Pages/contact-us.jsp">Contact Us</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
            </nav>
        </header>
        <!--Login Box-->
        <section id="user-login">
            <div id="login-box" class="modal fade" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Login to System</h4>
                    </div>
                    <form name="user-login" action="index.jsp" method="POST">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="email">Email address:</label>
                                <input type="email" class="form-control" id="email">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" id="pwd">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox"> Remember me</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="col-sm-12 cycle-slideshow" data-cycle-speed="10000">
                <img src="images/cover/cover-1.jpg" alt="cover-1">
                <img src="images/cover/cover-2.jpg" alt="cover-2">
                <img src="images/cover/cover-3.jpg" alt="cover-3">
                <img src="images/cover/cover-4.jpg" alt="cover-4">
                <img src="images/cover/cover-5.jpg" alt="cover-5">
            </div>   
            <div class="col-sm-8">
                <div id="main-Caption" class="col-sm-12 index-box">
                    <h2>Be a Part of the Knowledge Society with a BIT @ UCSC</h2>
                    <p>Taking into consideration the job opportunities that exist for ICT graduates in Sri Lanka & overseas, the UCSC (formerly Institute of Computer Technology) took the initiative to launch the External Degree (BIT) programme leading to the award of Degree of Bachelor of Information Technology (External) – BIT.</p>
                    <p>The UCSC having the most advanced training resources and experience in Sri Lanka in the field of ICT training conducts the Degree of Bachelor of Information Technology (External) programme. The UCSC conducts examinations leading to the first-ever External Degree in IT in Sri Lanka. The University of Colombo will award the degree.</p>
                </div>
                <div class="col-sm-4">
                    <div id="vision" class="col-sm-12 index-box box-4">
                        <h3>Our Vision</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula eu erat non aliquet. Phasellus felis tortor, ornare quis interdum a, tempus vel felis. Donec id risus eget ipsum pellentesque dignissim vel ut diam.</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div id="mission" class="col-sm-12 index-box box-4">
                        <h3>Our Mission</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget suscipit nisi. In faucibus non massa dictum vehicula. Phasellus egestas quis ante id semper. Pellentesque lacus sapien, imperdiet ac tristique vitae, porta non ex. Aenean at risus egestas, porttitor nunc sed, blandit purus.</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div id="goals" class="col-sm-12 index-box box-4">
                        <h3>Our Goals</h3>
                        <ul>
                            <li>Lorem ipsum dolor sit amet</li>
                            <li>Suspendisse ut felis ut arcu</li>
                            <li>Etiam quis mauris in ante</li>
                            <li>Ut sed lacus vitae ex sollicitudin</li>
                            <li>Morbi consectetur nulla</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="News-box" class="col-sm-4 index-box">
                news-box
            </div>
        </div>
    </body>
</html>
