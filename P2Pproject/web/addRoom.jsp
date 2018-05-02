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
		<title>Add new Room</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/chat.css">
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
				
			</div>
			<div style=margin: 0px auto; id="main">
				<br/>
            	<div align="center">
            		<center>
                <form action="<%=request.getContextPath()%>/servlet/manageChat" method="post">
                    <table width="80%" cellpadding="0" cellspacing="0" border="0">
                        <%
                            Object e = request.getAttribute("error");
                            String error = null;
                            if (e != null) {
                                error = (String) e;
                        %>
                        <tr>
                            <td colspan="2"><h3 class="error"><%=error%></h3></td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="2"><h2>Add new Room</h2></td>
                        </tr>
                        <tr>
                            <td><b>Room Name (no spaces)</b></td><td><input type="text" name="rn"></td>
                        </tr>
                        <tr>
                            <td><b>Description</b></td><td><textarea rows="5" cols="30" name="rd"></textarea></td>
                        </tr>

                        <!-- Use foreach to print username from the friendlist 
                        <List<FriendListBean> urss = (List<FriendListBean>) request.getAttribute("ListFriends");
                          if (urss != null) {
                            for (FriendListBean urs : urss) {
                        <tr>
                        <td>%=users%><input type="checkbox" name ="UserName" value="%=users%>"/><br/></td>
                        </tr>
                        -->
                        <tr>
                            <td>&nbsp;</td><td><input type="submit" value="Submit"></td>
                        </tr>
                    </table>
                </form>
            </center>
        </div>
        <%@ include file="/footer.jsp"%>
			</div>
			<div id="RightBody">
				
			</div>
		</div>
	</body>

</html>
