<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find User</title>
    </head>

    <header>
        <div id="header">
            <div id="headerbox">
                <div id="headerlogo"></div>
                <div id="headeruser">
                    Welcome, <%= User.getUserName()%>!
                </div>
                <div>
                    <form method="link" action="logout.jsp" >
                        <input id="logout" type="submit" value="Logout">
                    </form>
                </div>
            </div>
        </div>
    </header>

    <body>
        <form action="search" method="post">
            <input type="text" name="username" placeholder="Username" required="" />               
            <input id="button1" type="submit" value="Search"/>
        </form>
    </body>
</html>
