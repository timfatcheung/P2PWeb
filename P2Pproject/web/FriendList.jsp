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
                            <a href="index.jsp"><img src="logo.png" width="86" height="86"/></a>
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
                    <form name="submitForm" method="POST" action="ListFriend">
                        <input type="hidden" name="SessionUser" value="<%= User.getUserName()%>">
                        <A HREF="javascript:document.submitForm.submit()">Create Group</A>
                    </form>
                </div>
                <div id="FunctionBox03">
                    <a href="one.jsp" align="center">chat</a>
                </div>

            </div>
            <div style=margin: 0px auto; id="main">
                 <br/>
                <form name="addGroup" action="groupController" method="post"> 
                    Group Name:<br/>
                    <input type="text" name="GroupName" placeholder="Groupname" required="" /><br/>
                    Friend Name:<br/>
                    <%List<FriendListBean> urss = (List<FriendListBean>) request.getAttribute("ListFriends");
                        if (urss != null) {
                            for (FriendListBean urs : urss) {
                    %>
                    <%=urs.getFriendName()%><input type="checkbox" name="member" value="<%= urs.getUserName()%>"/><br/>
                    <%
                            }
                        }
                    %>
                    <input type="hidden" name="SessionUser" value="<%= User.getUserName()%>">
                    <input type="submit" name="submit" value="Add Group"/>
                </form>
            </div>
            <div id="RightBody">

            </div>
        </div>
    </body>

</html>