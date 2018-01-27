   <%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
   %>

<!DOCTYPE html>
<% UserBean User =(UserBean)(session.getAttribute("SessionUser"));%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page123</title>
    </head>
    <body>
        <h1>
           Welcome <%= User.getUserName()  %>
        </h1>
    </body>
</html>
