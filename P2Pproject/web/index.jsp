<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
    <header>
        <div id="header">
            <div id="headerbox">
                <div id="headerlogo"></div>
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

    <body>
        <div id="link">
            <a href="findUser.jsp">Find User</a>
            <a href="/servlet/openChat">Chatroom</a>
            <form name="submitForm" method="POST" action="servlet/openChat">
                <input type="hidden" name="param1" value="param1Value">
                <A HREF="javascript:document.submitForm.submit()">Click Me</A>
            </form>
        </div>
        <div id="main">
            <h1>Make your post!</h1>
            <form method="post" action="postController" id="postform">
                <input type="hidden" name ="UserName" value="<%= User.getUserName()%>"/>
                <textarea rows="4" cols="50" name="comment" form="postform">Enter text here.</textarea><br/>
                <input type="submit"  value="Submit">
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

    </body>
</html>
