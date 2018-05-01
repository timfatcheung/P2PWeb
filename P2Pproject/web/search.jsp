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
                <form action="search" method="post">
                    <input type="text" name="username" placeholder="Username" required="" />               
                    <input id="button1" type="submit" value="Search"/>           
                </form>

                <table>
                    <tr><th>User Name:</th></tr>
                            <%List<UserBean> urss = (List<UserBean>) request.getAttribute("search");
                                if (urss != null) {
                                    for (UserBean urs : urss) {
                                        if (!urs.getUserName().equals(User.getUserName())) {
                            %>
                    <tr><td>
                            <FORM name="addFriend" action="FriendController" method="post">   
                                <%= urs.getUserName()%>
                                <input type="hidden" name="user" value="<%= urs.getUserName()%>"/>
                                <input type="hidden" name="sessionuser" value="<%= User.getUserName()%>"/>
                                <input type="submit" name="submit" value="Add Friend"/>
                            </form>
                        </td></tr>
                        <%
                                    }
                                }
                            }
                        %>
                </table>

            </div>
            <div id="RightBody">

            </div>
        </div>
    </body>

</html>
