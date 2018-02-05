<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>

<!DOCTYPE html>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AtoZ</title>
        <link rel="stylesheet" type="text/css" href="index.css">
    </head>
    <body>

        <header>
            <div id="header">
                <div id="headerlogo"></div>
                <div id="headeruser">
                    Welcome, <%= User.getUserName()%>!
                </div>
                    <form method="link" action="logout.jsp">
                        <input id="logout" type="submit" value="Logout">
                    </form>
        </header>

    </body>
</html>
