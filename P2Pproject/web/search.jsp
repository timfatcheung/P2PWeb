<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         import="java.util.List"
         import="java.util.ArrayList"
         import="controller.*"
         %>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
  List<UserBean> urss = (List<UserBean>) request.getAttribute("search");
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
    <body>
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
    </body>
</html>
