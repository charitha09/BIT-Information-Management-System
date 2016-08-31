<%-- 
    Document   : messageForm
    Created on : Aug 29, 2016, 10:54:32 AM
    Author     : Indusaranie Tharusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UCSC SMS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/common-style.css">
        
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src=""></script>   
        <header>
            <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><img src="../../images/logo.png" alt="UCSC"></a>
                </div>
                <ul class="nav navbar-nav"></ul>
                </header>
        <div id="NewMessage">
    <form name="newMessage" method="post" action="MessageController">
        
        <h2> Create Message </h2>
        
        <div class="form-group col-sm-4">
            <label for="receiverName">Receiver</label>
        </div>

        <div class="form-group col-sm-8">
            <input type="text" id="Receiver" name="Receiver" placeholder="Receiver Name" class="form-control" required data-error="Can't be empty" onblur="checkApplicantInDB(this.value)"/>
            <div id="ReceiverErr" class="help-block with-errors"></div>
        </div>
        
        <div class="form-group col-sm-4">
            <label for="messageTitle">Title</label>
        </div>

        <div class="form-group col-sm-8">
            <input type="text" id="Title" name="Title" placeholder="Title" class="form-control" required data-error="Can't be empty" onblur="checkApplicantInDB(this.value)"/>
            <div id="TitleErr" class="help-block with-errors"></div>
        </div>
                
        <div class="form-group col-sm-4">
            <label for="messageBody">Message Body</label>
        </div>

        <div class="form-group col-sm-8">
            <textarea type="text" id="Message" name="Message" placeholder="Type your Message" class="form-control" required data-error="Can't be empty" onblur="checkApplicantInDB(this.value)"/></textarea>
            <div id="MessageErr" class="help-block with-errors"></div>
        </div>
        
            
            <button type='submit' class="btn btn-success" data-toggle='modal' data-target='#sendMessage'>Send Message</button>

            <button type='reset' class="btn btn-success" data-toggle='modal' data-target='#cancel'>Cancel</button>
    </form>    
        </div>
    </body>
</html>
        
