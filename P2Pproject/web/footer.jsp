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
		<div id="container">
			<header>
        		<div id="header">
            		<div id="headerbox">
                		<div id="headerlogo">
							<img src="logo.png" width="86" height="86"/>
						</div>
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
			
			<div id="LeftMenu">
				<br/>
				<div id="FunctionBox01">
            		<a href="findUser.jsp" align="center">Find User</a>
				</div>
				<div id="FunctionBox02">
            		<a href="createChatroom.jsp">Create Chatroom</a>
				</div>
			</div>
			<div style=margin: 0px auto; id="main">
				<br/>
            	<DIV align="center">
					<CENTER>
					<TABLE width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
						<TR>
							<TD width="100%" align="center"><%
							String n = (String)session.getAttribute("nickname");
							if (n != null && n.length() > 0)
							{
								out.write("<a href=\"logout.jsp\">Logout</a>");
								out.write(" <a href=\"listrooms.jsp\">List of Rooms</a>");
							}
							%> </TD>
						</TR>
					</TABLE>
					</CENTER>
				</DIV>
            
            
			</div>
			<div id="RightBody">
				
			</div>
		</div>
	</body>

</html>
