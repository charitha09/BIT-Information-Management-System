<%-- 
    Document   : messageBegin
    Created on : Aug 30, 2016, 8:54:58 PM
    Author     : Indusaranie Tharusha
--%>

<%@page import="java.util.ArrayList"%>
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
                    <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Coordinate</a></li> 
                    <li><a href="settings.jsp">Setting</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="messageBegin.jsp">Messaging
                        <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="messageForm.jsp">New Message</a></li>
                            <li><a href="msgReceive.jsp">Inbox</a></li> 
                            <li><a href="sendMsg.jsp">Outbox</a></li> 
                        </ul>
                    </li>
                     
                </ul>
                
                    <ul class="nav navbar-nav navbar-right"  data-toggle="modal" data-target="#login-box">
                    <li><a href="../../logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
            </nav>
        </header>
    
    </body>
</html>
