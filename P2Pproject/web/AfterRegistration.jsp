<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AtoZ</title>
        <link rel="stylesheet" type="text/css" href="AfterRegistration.css">
    </head>
    <body>
        <header>
            <div id="header">
                <div id="headerlogo"></div>
            </div>
        </header>
        <div id="form">
            <h1>Registration successful!!</h1>
            Username: <%= User.getUserName()%><p/>
            Email: <%= User.getEmail()%><p/>
            Gender: <%= User.getGender()%><p/>       
            <a href="registration.jsp">Log in</a>
        </div>
    </body>
</html>