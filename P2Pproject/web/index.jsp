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
        <div id="link">
            <a href="findUser.jsp">Find User</a>
            <a href="/servlet/openChat">Chatroom</a>
            <form name="submitForm" method="POST" action="servlet/openChat">
             <input type="hidden" name="param1" value="param1Value">
             <A HREF="javascript:document.submitForm.submit()">Click Me</A>
</form>
        </div>
        <div id="main">

        </div>

    </body>
</html>
