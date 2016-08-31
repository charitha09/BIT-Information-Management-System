<%-- 
    Document   : login
    Created on : Jun 27, 2016, 2:38:00 PM
    Author     : nadeesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        
        <script type="text/javascript">
                function validateUsername(){
                    var text=document.getElementById("username").value;
                    if(text==""){
                        document.getElementById("errorusername").innerHTML="Provide Username";
                        document.getElementById("errorusername").style.color="red";
                    }
                    else{
                        document.getElementById("errorusername").innerHTML="Ok";
                        document.getElementById("errorusername").style.color="green";
                    }
                }
                
                function validatePassword(){
                    var text=document.getElementById("password").value;
                    if(text==""){
                        document.getElementById("errorpassword").innerHTML="Provide Password";
                        document.getElementById("errorpassword").style.color="red";
                    }
                    else{
                        document.getElementById("errorpassword").innerHTML="Ok";
                        document.getElementById("errorpassword").style.color="green";
                    }
                }
        </script>
        
        <form action="loginServlet" method="POST" name="userLogin">
        <table>
            <tr>
                <td>username:</td>
                <td><input type="text" id="username" name="username" onblur="validateUsername();"></td>
                <td><label id="errorusername"></label></td>
            </tr>
            
            <tr>
                <td>password:</td>
                <td><input type="text" id="password" name="password" onblur="validatePassword();"></td>
                <td><label id="errorpassword"></label></td>
            </tr>
            
            <tr>
                <td></td>
                <td><input type="submit" value="Login"></td>
                <td></td>
            </tr>
            
        </table>
        </form>
    </body>
</html>
