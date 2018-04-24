<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="stylesheet" type="text/css" href="Form.css">
    </head>
    
    <header>
        <div id="header">
            <div id="headerlogo">
				<img src="logo.png" width="91" height="90"/>
			</div>
        </div>
    </header>

    <body>
        <% session.invalidate();%>
     
        <div id="form">
            <h1>Logout</h1><p> 
            You are Successfully logged out.<p>
            <a href="registration.jsp">Go-Back To Hone Page</a>
        </div>
    </body>
</html>
