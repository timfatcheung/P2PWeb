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
        <title>Find User</title>
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
                <form action="search" method="post">
                    <input type="text" name="username" placeholder="Username" required="" />               
                    <input id="button1" type="submit" value="Search"/>
                </form>
            </div>
            <div id="RightBody">

            </div>
        </div>
    </body>

</html>
