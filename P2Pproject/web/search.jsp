<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         import="java.util.List"
         import="java.util.ArrayList"
         import="controller.*"
         %>

<!DOCTYPE html>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
				<%List<UserBean> urss = (List<UserBean>) request.getAttribute("search");
  					if(urss!=null){
    					for(UserBean urs: urss){
       			%>
       			<table>
           			<tr><th>User Name:</th></tr><tr><td>
               			<FORM name="addFriend" action="FriendController" method="post">   
                   			<%= urs.getUserName() %>
                   			<input type="hidden" name="user" value="<%= urs.getUserName() %>"/>
                   			<input type="hidden" name="sessionuser" value="<%= User.getUserName() %>"/>
                   			<input type="submit" name="submit" value="Add Friend"/>
               			</form>
               		</td></tr>
       			</table>
				<%
     					}
  					}
				%>
            	<form action="search" method="post">
            		<input type="text" name="username" placeholder="Username" required="" />               
            		<input id="button1" type="submit" value="Search"/>           
        		</form>
        <!-- Use foreach to print username from the Users -->

        		<form method="post" action="addFriendList">
            		<table>
                		<tr>
                    		<th>User:</th>
                    		<th>Add?</th>
                		</tr>
                <!--%for(String users : rs ) -->
                		<tr>
                    		<td><%=users%></td>
                    		<td>
                        		<input type="checkbox" name ="Confirm" value="false"/>
                        		<input type="hidden" name ="UserName" value="<%=users%>"/>
                    		</td>
                		</tr>
                <!-- } -->
            		</table>
            		<input type="submit" value="Submit"/>
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
