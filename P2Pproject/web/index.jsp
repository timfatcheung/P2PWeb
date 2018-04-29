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
            		            <form name="submitForm" method="POST" action="servlet/openChat">
                <input type="hidden" name="param1" value="param1Value">
                <A HREF="javascript:document.submitForm.submit()">Chat Room</A>
            </form>
				</div>
                                <div id="FunctionBox03">
            		<a href="one.jsp" align="center">chat</a>
				</div>
                                
			</div>
			<div style=margin: 0px auto; id="main">
				<br/>
            	<form method="post" action="postController" id="postform">
					<input type="submit"  value="Make Post">
					<br/>
                	<input type="hidden" name ="UserName" value="<%= User.getUserName()%>"/>
                	<textarea rows="4" cols="50" name="comment" form="postform" align="center">What's on your mind?</textarea>
            	</form>
            
            <!-- Use foreach to print username from the Users 
            <h1>You have invite!</h1>
            <form method="post" action="addFriendList">
            <table>
            <tr>
            <th>User:</th>
            <th>Confirm?</th>
            </tr>
            for (Sting users : rs){ 
            <tr>
            <td>%=users%></td>
            <td>
            <input type="hidden" name ="UserName" value="%=users%>"/>
            Yes<input type="radio" name ="Confirm" value="true"/>
            No<input type="radio" name ="Confirm" value="false"/>
            </td>
            </tr>
            }
            </table>
            <input type="submit" name="submit" value="Submit"/>
            </form> 
            -->
			</div>
			<div id="RightBody">
				
			</div>
		</div>
	</body>

</html>
