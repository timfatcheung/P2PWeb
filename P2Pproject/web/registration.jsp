<%-- 
    Document   : registration
    Created on : 2018年1月14日, 上午12:37:02
    Author     : cheungtimfat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration</h1>
       <form action="registerController" method="post">
            Username:<input name="username"/><br/>
            Password:<input type="password" name="password"/><br/>
            confrim your password:<input type="password" name="password"/><br/>
            <input type="submit" name="submit" value="submit"/><br/>
        </form>
        <a href="login.jsp">login</a>
    </body>
</html>
