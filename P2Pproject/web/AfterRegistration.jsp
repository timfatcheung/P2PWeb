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
        <link rel="stylesheet" type="text/css" href="Form.css">
    </head>

    <body>
		<div id="container">
			<header>
        		<div id="header">
            		<div id="headerbox">
                		<div id="headerlogo">
							<img src="logo.png" width="86" height="86"/>
						</div>
            		</div>
        		</div>
   			</header>
			
			<div id="LeftMenu">
				
			</div>
			<div style=margin: 0px auto; id="main">
				<br/>
            	<div id="form">
					<h1>Registration successful!!</h1>
					Username: <%= User.getUserName()%><p/>
					Email: <%= User.getEmail()%><p/>
					Gender: <%= User.getGender()%><p/>       
					<a href="registration.jsp">Log in</a>
				</div>
			</div>
			<div id="RightBody">
				
			</div>
		</div>
	</body>

</html>
