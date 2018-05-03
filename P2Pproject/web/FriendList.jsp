<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         import="java.util.List"
         import="java.util.ArrayList"
         import="controller.*"
         import="controller.FriendListBean"
         %>
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
            		            <form name="submitForm" method="POST" action="/ListFriend">
                <input type="hidden" name="param1" value="param1Value">
                <A HREF="javascript:document.submitForm.submit()">Friend list</A>
            </form>
				</div>
                                <div id="FunctionBox03">
            		<a href="one.jsp" align="center">chat</a>
				</div>
                                
			</div>
			<div style=margin: 0px auto; id="main">
				<br/>

                            

                <table>
                    <tr>
                        <th>User Name:</th>
                    </tr>
                    <%List<FriendListBean> urss = (List<FriendListBean>) request.getAttribute("ListFriends");
                        if (urss != null) {
                            for (FriendListBean urs : urss) {
                    %>
                    <tr>
                        <td>
                            <FORM name="confirmFriend" action="ConfirmFriendController" method="post">   
                                <%=urs.getUserName()%>
                                <input type="hidden" name="frienduser" value="<%= urs.getUserName()%>"/>
                                <input type="hidden" name="user" value="<%= User.getUserName()%>"/>
                                <input type="submit" name="submit" value="Add Friend"/>
                        </td>
                    </tr>
                </table>
                </FORM> 
                <%
                        }
                    }
                %>
   
            
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